﻿using Backend.Entities;
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

namespace FrontEnd.Controllers
{
    public class IncidentController : Controller
    {
        IHubContext<NotificationHub> _notificationHubContext;

        public IncidentController(
            IHubContext<NotificationHub> notificationHubContext
            )
        {
            _notificationHubContext = notificationHubContext;
        }

        #region Lista
        [Authorize]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }


        public async Task<JsonResult> GetAllIndex()
        {

            List<Incident> incident;
            List<Status> status;
            List<Priority> priority;

            var incidents = new List<IncidentViewModel>();

            using (UnidadDeTrabajo<Status> Unidad
                = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                status = Unidad.genericDAL.GetAll().ToList();
            }

            using (UnidadDeTrabajo<Incident> Unidad
                = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                /*Casos Activos*/
                if (User.IsInRole("Administrador") || User.IsInRole("Soportista"))
                {
                    incident = Unidad.genericDAL.GetAll().Where(x=> x.StatusId != status.Where(y => y.Description.Equals("Finalizado")).Select(z => z.Id).FirstOrDefault())
                        .ToList();
                }
                else
                {
                    incident = Unidad.genericDAL.GetAll().Where(x=> x.UserId == User.Claims.First(c => c.Type.Contains("nameidentifier")).Value &&
                    x.StatusId != status.Where(y=> y.Description.Equals("Finalizado")).Select(z=> z.Id).FirstOrDefault())
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
            Incident incident = new Incident();

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

            incident.UserId = User.Claims.First(c => c.Type.Contains("nameidentifier")).Value;
            incident.CategoryId = categories.Where(x => x.CategoryName.Equals(incidentVM.Category)).Select(y => y.Id).FirstOrDefault();
            incident.Theme = incidentVM.Theme;
            incident.Description = incidentVM.Description;
            incident.PriorityId = priority.Where(x => x.Description.Equals(incidentVM.Priority)).Select(y => y.Id).FirstOrDefault();
            incident.StatusId = status.Where(x => x.Description.Equals("Creado")).Select(y => y.Id).FirstOrDefault();
            incident.Created = System.DateTime.Now;

            using (UnidadDeTrabajo<Incident> Unidad
                = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Add(incident);
                Unidad.Complete();
            }

            var connectionIds = NotificationHub._connections.GetConnections(User.Claims.FirstOrDefault(x => x.Type.Equals(ClaimTypes.NameIdentifier)).Value);
            var urlSessionsDetails = Url.Action("Index", "Sesion", new { id = incident.Id });

            foreach (var connectionId in connectionIds)
            {
                _notificationHubContext.Clients.AllExcept(connectionId).SendAsync("ReceiveNotification", new RecieveNotificationModel
                {
                    Message = "New incident has been registered",
                    DropDownElement = $"<a class='dropdown-item d-flex align-items-center' href='{urlSessionsDetails}'>" +
                        $"<div class='mr-3'>" +
                            $"<div class='icon-circle bg-success'>" +
                                $"<i class='fas fa-archive text-white'></i>" +
                            $"</div>" +
                        $"</div>" +
                       $" <div>" +
                            $"<div class='small text-gray-500'>{incident.Created.ToShortDateString()}</div>" +
                            $"{incident.Theme}" +
                        $"</div>" +
                   $" </a>"
                });
            }

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
