using Backend.Entities;
using FrontEnd.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketsManager.DAL;

namespace FrontEnd.Controllers
{
    public class SesionController : Controller
    {
        public IActionResult Index(int id)
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

            return View(incidentVM);
        }

        public async Task<List<Sesion>> GetSesionsByIncident(int incidentId)
        {
            try
            {
                using(TicketsManagerContext dbContext = new TicketsManagerContext())
                {
                    var sesions = await dbContext.Sesions.Where(x => x.IncidentId.Equals(incidentId)).ToListAsync();

                    return sesions;
                }
            }
            catch
            {
                return null;
            }
        }
    }
}
