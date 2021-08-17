using Backend.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using TicketsManager.DAL;
using Microsoft.AspNetCore.Authorization;
using FrontEnd.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using FrontEnd.Hubs;
using Microsoft.AspNetCore.SignalR;
using System.Security.Claims;
using Backend.Helpers;
using Backend.Models;
using System;

namespace FrontEnd.Controllers
{
    public class IncidentController : Controller
    {

        #region Helper Email
        private readonly IHubContext<NotificationHub> _notificationHubContext;
        private readonly IEmailHelper _emailHelper;
        private readonly UserManager<ApplicationUser> _userManager;

        public IncidentController(
            IHubContext<NotificationHub> notificationHubContext,
            IEmailHelper emailHelper,
            UserManager<ApplicationUser> userManager
            )
        {
            _notificationHubContext = notificationHubContext;
            _emailHelper = emailHelper;
            _userManager = userManager;
        }




        #endregion

        #region Lista
        [Authorize]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<JsonResult> GetAllIndex(string tab)
        {
            List<Incident> incident;
            List<Status> status;
            List<Priority> priority;
            var idUser = "";

            var incidents = new List<IncidentViewModel>();

            using (UnidadDeTrabajo<Status> Unidad
                = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                status = Unidad.genericDAL.GetAll().ToList();
            }

            using (UnidadDeTrabajo<Incident> Unidad
                = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                
                if (User.IsInRole("Administrador"))
                {
                    incident = Unidad.genericDAL.GetAll().Where(x => x.StatusId == status.Where(y => y.Description.Equals(tab))
                                .Select(z => z.Id).FirstOrDefault())
                        .ToList();
                }
                else if (User.IsInRole("Soportista"))
                {
                    idUser = User.Claims.First(c => c.Type.Contains("nameidentifier")).Value;
                    incident = Unidad.genericDAL.GetAll().Where(x => x.StatusId != status.Where(y => y.Description.Equals(tab) || x.UserId == idUser)
                                .Select(z => z.Id).FirstOrDefault())
                                .ToList();
                }
                else
                {
                    idUser = User.Claims.First(c => c.Type.Contains("nameidentifier")).Value;
                    incident = Unidad.genericDAL.GetAll().Where(x => x.UserId == idUser || 
                                x.StatusId != status.Where(y => y.Description.Equals(tab))
                                .Select(z => z.Id).FirstOrDefault())
                                .ToList();
                }
            }


            using (UnidadDeTrabajo<Priority> Unidad
            = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                priority = Unidad.genericDAL.GetAll().ToList();
            }

            foreach (var i in incident)
            {
                var incidentVM = new IncidentViewModel();
                incidentVM.Id = i.Id;
                incidentVM.User = User.Identity.Name;
                incidentVM.UserRequestBy = User.Identity.Name;
                incidentVM.Theme = i.Theme;
                incidentVM.Status = status.Where(x => x.Id == i.StatusId).Select(y => y.Description).FirstOrDefault();
                incidentVM.Priority = priority.Where(x => x.Id == i.PriorityId).Select(y => y.Description).FirstOrDefault();
                incidentVM.Created = i.Created;
                incidents.Add(incidentVM);
            }
            return Json(new { data = incidents });
        }
        #endregion

        #region Agregar
        [Authorize]
        [HttpGet]
        public IActionResult Create()
        {
            List<Priority> priority;
            List<Category> categories;

            using (UnidadDeTrabajo<Priority> Unidad
                = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                priority = Unidad.genericDAL.GetAll().ToList();
            }

            using (UnidadDeTrabajo<Category> Unidad
                 = new UnidadDeTrabajo<Category>(new TicketsManagerContext()))
            {
                categories = Unidad.genericDAL.GetAll().ToList();
            }

            ViewBag.Description = new SelectList(priority.ToList(), "Description", "Description");
            ViewBag.CategoryName = new SelectList(categories.ToList(), "CategoryName", "CategoryName");
            return View();

        }

        [Authorize]
        [HttpPost]
        public IActionResult Create(IncidentViewModelCreate incidentVM)
        {
            List<Priority> priority;
            List<Status> status;
            List<Category> categories;
            var UserId = User.Claims.First(c => c.Type.Contains("nameidentifier")).Value;
            ApplicationUser userCreator;

            var users = new List<RandomUser>();
            Incident incident = new Incident();

            using (UnidadDeTrabajo<ApplicationUser> Unidad
                = new UnidadDeTrabajo<ApplicationUser>(new TicketsManagerContext()))
            {
                users = Unidad.genericDAL.GetAll()
                    .Where(x => _userManager.IsInRoleAsync(x, "Soportista").Result)
                    .Select(
                    x => new RandomUser { Email = x.Email, UserId = x.Id })
                    .ToList();

                userCreator = Unidad.genericDAL.GetAll().Where(x => x.Id == UserId).FirstOrDefault(); ;

            }

            using (UnidadDeTrabajo<Priority> Unidad
                = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                priority = Unidad.genericDAL.GetAll().ToList();
            }

            using (UnidadDeTrabajo<Category> Unidad
                = new UnidadDeTrabajo<Category>(new TicketsManagerContext()))
            {
                categories = Unidad.genericDAL.GetAll().ToList();
            }

            using (UnidadDeTrabajo<Status> Unidad
             = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                status = Unidad.genericDAL.GetAll().ToList();
            }

            incident.UserId = UserId;
            incident.CategoryId = categories.Where(x => x.CategoryName.Equals(incidentVM.Category)).Select(y => y.Id).FirstOrDefault();
            incident.Theme = incidentVM.Theme;
            incident.Description = incidentVM.Description;
            incident.PriorityId = priority.Where(x => x.Description.Equals(incidentVM.Priority)).Select(y => y.Id).FirstOrDefault();
            incident.StatusId = status.Where(x => x.Description.Equals("Sin atender")).Select(y => y.Id).FirstOrDefault();
            incident.Created = System.DateTime.Now;
            var rand = new Random();
            var user = users[rand.Next(users.Count)];
            incident.RequestById = user.UserId;

            using (UnidadDeTrabajo<Incident> Unidad
                = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Add(incident);
                Unidad.Complete();
            }

            var connectionIds = NotificationHub._connections.GetConnections(user.UserId);
            var urlSessionsDetails = Url.Action("Index", "Sesion", new { id = incident.Id });

            foreach (var connectionId in connectionIds)
            {
                _notificationHubContext.Clients.Client(connectionId).SendAsync("ReceiveNotification", new RecieveNotificationModel
                {
                    Message = "Un nuevo incidente ha sido registrado",
                    DropDownElement = $"<a class='dropdown-item d-flex align-items-center' href='{urlSessionsDetails}'>" +
                        $"<div class='mr-3'>" +
                            $"<div class='icon-circle bg-success'>" +
                                $"<i class='fas fa-archive text-white'></i>" +
                            $"</div>" +
                        $"</div>" +
                       $" <div>" +
                            $"<div class='small text-gray-500'>{incident.Created.ToString("dd/MM/yyyy hh:mm tt")}</div>" +
                            $"{incident.Theme}" +
                        $"</div>" +
                   $" </a>"
                });
            }

            _emailHelper.SendEmailAsync(new BackEnd.Models.EmailModel
            {
                Body = " Se ha registrado un nuevo incidente",
                Subject = "Nuevo incidente creado",
                To = user.Email
            });

            _emailHelper.SendEmailAsync(new BackEnd.Models.EmailModel
            {
                Body = " Se creo su incidente con exito",
                Subject = "Se ha registrado su incidente con exito.",
                To = userCreator.Email
            });

            return RedirectToAction("Index");
        }
        #endregion

        #region Editar
        [Authorize]
        [HttpGet]
        public IActionResult Edit(int id)
        {
            Incident incident;
            List<Priority> priority;
            List<Category> categories;
            List<Status> status;
            IncidentViewModelEdit incidentVM = new IncidentViewModelEdit();

            using (UnidadDeTrabajo<Priority> Unidad
                = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                priority = Unidad.genericDAL.GetAll().ToList();
            }

            using (UnidadDeTrabajo<Status> Unidad
                = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                status = Unidad.genericDAL.GetAll().ToList();
            }

            using (UnidadDeTrabajo<Category> Unidad
                 = new UnidadDeTrabajo<Category>(new TicketsManagerContext()))
            {
                categories = Unidad.genericDAL.GetAll().ToList();
            }

            using (UnidadDeTrabajo<Incident> Unidad
               = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                incident = Unidad.genericDAL.Get(id);
            }
            incidentVM.Id = incident.Id;
            incidentVM.Category = categories.Where(x => x.Id == incident.CategoryId).Select(y => y.CategoryName).FirstOrDefault();
            incidentVM.Theme = incident.Theme;
            incidentVM.Description = incident.Description;
            incidentVM.Priority = priority.Where(x => x.Id == incident.PriorityId).Select(y => y.Description).FirstOrDefault();
            incidentVM.Status = status.Where(x => x.Id == incident.StatusId).Select(y => y.Description).FirstOrDefault();
            incidentVM.Created = incident.Created;
            incidentVM.Attended = System.DateTime.Now;
            if (User.IsInRole("Soportista, Administrador"))
            {
                incidentVM.RequestById = User.Identity.Name;
                ViewBag.Description = new SelectList(status.ToList(), "Status", "Status");
            }

            return View(incidentVM);
        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Edit(Incident incident)
        {
            using (UnidadDeTrabajo<Incident> Unidad
               = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Update(incident);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Eliminar
        [Authorize(Roles = "Administrador")]
        [HttpGet]
        public IActionResult Delete(int id)
        {
            Incident incident;
            using (UnidadDeTrabajo<Incident> Unidad
               = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                incident = Unidad.genericDAL.Get(id);

            }

            return View(incident);
        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Delete(Incident incident)
        {
            using (UnidadDeTrabajo<Incident> Unidad
               = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Remove(incident);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Detalles
        [Authorize(Roles = "Administrador")]
        [HttpGet]
        public IActionResult Details(int id)
        {
            Incident incident;
            using (UnidadDeTrabajo<Incident> Unidad
               = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                incident = Unidad.genericDAL.Get(id);

            }

            return View(incident);
        }
        #endregion



        public async Task<List<Incident>> GetIncidentsByStatus(int statusId)
        {
            try
            {
                using (TicketsManagerContext dbContext = new TicketsManagerContext())
                {
                    var incidents = await dbContext.Incidents.Where(x => x.Status.Id.Equals(statusId)).ToListAsync();

                    return incidents;
                }
            }
            catch (System.Exception)
            {
                return null;
            }
        }

    }
}
