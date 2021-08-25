using Backend.Entities;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketsManager.DAL;

namespace FrontEnd.Controllers
{
    public class ClientController : Controller
    {
        #region Lista
        [Authorize(Roles = "Administrador")]
        public IActionResult Index()
        {

            return View();
        }

        [Authorize(Roles = "Administrador")]
        public async Task<JsonResult> GetAllIndex()
        {
            List<AspUsers> applicationUsers = new List<AspUsers>();

            TicketsManagerContext db = new TicketsManagerContext();
 ;

         
                foreach (AspUsers au in db.aspUsers.ToList())
                {
                    if (au..Equals("Client"))
                    {
                        applicationUsers.Add(au);
                    }
                }
                applicationUsers = Unidad.genericDAL.GetAll().ToList();
    

            return Json(new { data = applicationUsers });
        }
        #endregion

        // GET: ClientController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ClientController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ClientController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ClientController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ClientController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ClientController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ClientController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
