using Backend.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using TicketsManager.DAL;
using Microsoft.AspNetCore.Authorization;

namespace FrontEnd.Controllers
{
    public class DepartmentController : Controller
    {
        #region Lista
        [Authorize(Roles = "Administrador")]
        public IActionResult Index()
        {

            List<Department> department;

            using (UnidadDeTrabajo<Department> Unidad
                = new UnidadDeTrabajo<Department>(new TicketsManagerContext()))
            {
                department = Unidad.genericDAL.GetAll().ToList();
            }
            return View(department);
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
        public IActionResult Create(Department department)
        {
            using (UnidadDeTrabajo<Department> Unidad
                = new UnidadDeTrabajo<Department>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Add(department);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Editar
        [Authorize(Roles = "Administrador")]
        public IActionResult Edit(int id)
        {
            Department department;
            using (UnidadDeTrabajo<Department> Unidad
               = new UnidadDeTrabajo<Department>(new TicketsManagerContext()))
            {
                department = Unidad.genericDAL.Get(id);

            }

            return View(department);
        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Edit(Department department)
        {
            using (UnidadDeTrabajo<Department> Unidad
               = new UnidadDeTrabajo<Department>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Update(department);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Eliminar
        [Authorize(Roles = "Administrador")]
        public IActionResult Delete(int id)
        {
            Department department;
            using (UnidadDeTrabajo<Department> Unidad
               = new UnidadDeTrabajo<Department>(new TicketsManagerContext()))
            {
                department = Unidad.genericDAL.Get(id);

            }

            return View(department);
        }

        [Authorize(Roles = "Administrador")]
        [HttpPost]
        public IActionResult Delete(Department department)
        {
            using (UnidadDeTrabajo<Department> Unidad
               = new UnidadDeTrabajo<Department>(new TicketsManagerContext()))
            {
                Unidad.genericDAL.Remove(department);
                Unidad.Complete();
            }

            return RedirectToAction("Index");
        }
        #endregion

        #region Detalles
        [Authorize(Roles = "Administrador")]
        public IActionResult Details(int id)
        {
            Department department;
            using (UnidadDeTrabajo<Department> Unidad
               = new UnidadDeTrabajo<Department>(new TicketsManagerContext()))
            {
                department = Unidad.genericDAL.Get(id);

            }

            return View(department);
        }
        #endregion

    }
}
