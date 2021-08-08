using Backend.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Threading.Tasks;
using TicketsManager.DAL;
using Microsoft.AspNetCore.Authorization;
using FrontEnd.Models.Priority;

namespace FrontEnd.Controllers
{   
    public class PriorityController : Controller
    {
        private PriorityViewModel Convertir(Priority pri)
        {
            return new PriorityViewModel
            {
                Id = (int)pri.Id,
                Description = pri.Description
            };
        }

        #region Lista
        [Authorize(Roles = "Administrador")]
        public IActionResult Index()
        {
            return View();
        }


        public async Task<JsonResult> GetAllIndex()
        {
            List<Priority> priority;

            using (UnidadDeTrabajo<Priority> Unidad
                = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                priority = Unidad.genericDAL.GetAll().ToList();
            }
            List<PriorityViewModel> priorityVM = new List<PriorityViewModel>();
            PriorityViewModel priorityViewModel;
            foreach (var item in priority)
            {
                priorityViewModel = this.Convertir(item);
                priorityVM.Add(priorityViewModel);
            }
            return Json(new { data = priority });
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
        public IActionResult Create(Priority priority)
        {
            using (UnidadDeTrabajo<Priority> Unidad
                = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Add(priority);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Editar
        [Authorize(Roles = "Administrador")]
        public IActionResult Edit(int id)
        {
            Priority priority;
            using (UnidadDeTrabajo<Priority> Unidad
               = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                priority = Unidad.genericDAL.Get(id);

            }
            PriorityViewModel pri = this.Convertir(priority);
            return View(pri);
        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Edit(Priority priority)
        {
            using (UnidadDeTrabajo<Priority> Unidad
               = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Update(priority);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Eliminar
        [Authorize(Roles = "Administrador")]
        public IActionResult Delete(int id)
        {
            Priority priority;
            using (UnidadDeTrabajo<Priority> Unidad
               = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                priority = Unidad.genericDAL.Get(id);

            }
            PriorityViewModel pri = this.Convertir(priority);
            return View(pri);
        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Delete(Priority priority)
        {
            using (UnidadDeTrabajo<Priority> Unidad
               = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Remove(priority);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Detalles
        [Authorize(Roles = "Administrador")]
        public IActionResult Details(int id)
        {
            Priority priority;
            using (UnidadDeTrabajo<Priority> Unidad
               = new UnidadDeTrabajo<Priority>(new TicketsManagerContext()))
            {
                priority = Unidad.genericDAL.Get(id);

            }
            PriorityViewModel pri = this.Convertir(priority);

            return View(pri);
        }
        #endregion

    }
}
