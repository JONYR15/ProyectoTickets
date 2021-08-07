using Backend.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using TicketsManager.DAL;
using Microsoft.AspNetCore.Authorization;
using System.Threading.Tasks;

namespace FrontEnd.Controllers
{
    public class StatusController : Controller
    {
        #region Lista
        [Authorize(Roles = "Administrador")]
        public IActionResult Index()
        {
            return View();
        }

        public async Task<JsonResult> GetAllIndex()
        {

            List<Status> status;

            using (UnidadDeTrabajo<Status> Unidad
                = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                status = Unidad.genericDAL.GetAll().ToList();
            }
            return Json(new { data = status });
        }

        #endregion

        #region Agregar
        [Authorize(Roles = "Administrador")]
        public IActionResult Create()
        {

            return View();

        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Create(Status status)
        {
            using (UnidadDeTrabajo<Status> Unidad
                = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Add(status);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Editar
        [Authorize(Roles = "Administrador")]
        public IActionResult Edit(int id)
        {
            Status status;
            using (UnidadDeTrabajo<Status> Unidad
               = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                status = Unidad.genericDAL.Get(id);

            }

            return View(status);
        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Edit(Status status)
        {
            using (UnidadDeTrabajo<Status> Unidad
               = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Update(status);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Eliminar
        [Authorize(Roles = "Administrador")]
        public IActionResult Delete(int id)
        {
            Status status;
            using (UnidadDeTrabajo<Status> Unidad
               = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                status = Unidad.genericDAL.Get(id);

            }

            return View(status);
        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Delete(Status status)
        {
            using (UnidadDeTrabajo<Status> Unidad
               = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Remove(status);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Detalles
        [Authorize(Roles = "Administrador")]
        public IActionResult Details(int id)
        {
            Status status;
            using (UnidadDeTrabajo<Status> Unidad
               = new UnidadDeTrabajo<Status>(new TicketsManagerContext()))
            {
                status = Unidad.genericDAL.Get(id);

            }

            return View(status);
        }
        #endregion
    }
}
