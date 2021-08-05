using Backend.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketsManager.DAL;

namespace FrontEnd.Controllers
{
    public class SesionController : Controller
    {
        #region Lista
        [HttpGet]
        public IActionResult Index()
        {

            return View();
        }


        public async Task<JsonResult> GetAllIndex()
        {
            List<Sesion> sesions;

            using (UnidadDeTrabajo<Sesion> Unidad
                = new UnidadDeTrabajo<Sesion>(new TicketsManagerContext()))
            {
                sesions = Unidad.genericDAL.GetAll().ToList();
            }

            return Json(new { data = sesions });
        }
        #endregion

        #region Agregar
        [HttpGet]
        public IActionResult Create(int id)
        {
            ViewBag.Id = id;
            return View();

        }

        [HttpPost]
        public IActionResult Create(Sesion sesions)
        {
            sesions.UserId = User.Claims.First(c => c.Type.Contains("nameidentifier")).Value;
            sesions.Created = System.DateTime.Now;
            using (UnidadDeTrabajo<Sesion> Unidad
                = new UnidadDeTrabajo<Sesion>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Add(sesions);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Editar
        [HttpGet]
        public IActionResult Edit(int id)
        {
            Sesion sesion;
            using (UnidadDeTrabajo<Sesion> Unidad
               = new UnidadDeTrabajo<Sesion>(new TicketsManagerContext()))
            {
                sesion = Unidad.genericDAL.Get(id);

            }

            return View(sesion);
        }


        [HttpPost]
        public IActionResult Edit(Sesion sesion)
        {
            using (UnidadDeTrabajo<Sesion> Unidad
               = new UnidadDeTrabajo<Sesion>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Update(sesion);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Eliminar

        public IActionResult Delete(int id)
        {
            Sesion sesion;
            using (UnidadDeTrabajo<Sesion> Unidad
               = new UnidadDeTrabajo<Sesion>(new TicketsManagerContext()))
            {
                sesion = Unidad.genericDAL.Get(id);

            }

            return View(sesion);
        }


        [HttpPost]
        public IActionResult Delete(Sesion sesion)
        {
            using (UnidadDeTrabajo<Sesion> Unidad
               = new UnidadDeTrabajo<Sesion>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Remove(sesion);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Detalles
        public IActionResult Details(int id)
        {
            Sesion sesion;
            using (UnidadDeTrabajo<Sesion> Unidad
               = new UnidadDeTrabajo<Sesion>(new TicketsManagerContext()))
            {
                sesion = Unidad.genericDAL.Get(id);

            }

            return View(sesion);
        }
        #endregion
    }
}
