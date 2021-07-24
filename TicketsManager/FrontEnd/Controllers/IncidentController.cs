using Backend.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using TicketsManager.DAL;
using Microsoft.AspNetCore.Authorization;
using FrontEnd.Models;

namespace FrontEnd.Controllers
{
    public class IncidentController : Controller
    {
        #region Lista
        [Authorize(Roles = "Administrador, Soportista")]
        public IActionResult Index()
        {

            List<Incident> incident;
            var incidents = new List<IncidentViewModel>();

            using (UnidadDeTrabajo<Incident> Unidad
                = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                incident = Unidad.genericDAL.GetAll().ToList();
            }

            foreach (var i in incident)
            {
                var incidentVM = new IncidentViewModel();
                incidentVM.Id = i.Id;
                incidentVM.User = User.Identity.Name;
                incidentVM.UserRequestBy = User.Identity.Name;
                incidentVM.Theme = i.Theme;
                incidentVM.Status = i.Status.Description.ToString();
                incidentVM.Priority = i.Priority.Description.ToString();
                incidentVM.Created = i.Created;
                incidentVM.Attended = i.Attended;
                incidents.Add(incidentVM);
            }

            return View(incidents);
        }
        #endregion

        #region Agregar
        [Authorize]
        public IActionResult Create()
        {
            List<Priority> priority;
            List<Status> status;

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

            ViewBag.priority = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(priority.ToList(), "Name", "Name");
            ViewBag.status = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(status.ToList(), "Name", "Name");
            return View();

        }

        [Authorize]
        [HttpPost]
        public IActionResult Create(Incident incident)
        {
            List<Priority> priority;
            List<Status> status;

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

            ViewBag.priority = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(priority.ToList(), "Name", "Name");
            ViewBag.status = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(status.ToList(), "Name", "Name");

            using (UnidadDeTrabajo<Incident> Unidad
                = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Add(incident);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Editar
        [Authorize(Roles = "Administrador")]
        public IActionResult Edit(int id)
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

    }
}
