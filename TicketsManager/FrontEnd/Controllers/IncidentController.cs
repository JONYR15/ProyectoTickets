using Backend.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using TicketsManager.DAL;
using Microsoft.AspNetCore.Authorization;

namespace FrontEnd.Controllers
{
    public class IncidentController : Controller
    {
        #region Lista
        [Authorize(Roles = "Administrador, Soportista")]
        public IActionResult Index()
        {

            List<Incident> incident;

            using (UnidadDeTrabajo<Incident> Unidad
                = new UnidadDeTrabajo<Incident>(new TicketsManagerContext()))
            {
                incident = Unidad.genericDAL.GetAll().ToList();
            }
            return View(incident);
        }
        #endregion

        #region Agregar
        [Authorize]
        public IActionResult Create()
        {
            return View();

        }

        [Authorize]
        [HttpPost]
        public IActionResult Create(Incident incident)
        {
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
