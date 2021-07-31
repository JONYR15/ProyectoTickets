using Backend.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Threading.Tasks;
using TicketsManager.DAL;
using Microsoft.AspNetCore.Authorization;
using FrontEnd.Models.Departament;

namespace FrontEnd.Controllers
{
    public class DepartmentController : Controller
    {
        private DepartmentViewModel Convertir(Department dep)
        {
            return new DepartmentViewModel
            {
                Id = (int)dep.Id,
                Name = dep.Name
            };
        }

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

            List<DepartmentViewModel> depVM = new List<DepartmentViewModel>();
            DepartmentViewModel departmentViewModel;
            foreach (var item in department)
            {
                departmentViewModel = this.Convertir(item);
                depVM.Add(departmentViewModel);
            }

            return View(depVM);
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

            DepartmentViewModel dep = this.Convertir(department);

            return View(dep);
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

            DepartmentViewModel dep = this.Convertir(department);

            return View(dep);
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

            DepartmentViewModel dep = this.Convertir(department);

            return View(dep);
        }
        #endregion

    }
}
