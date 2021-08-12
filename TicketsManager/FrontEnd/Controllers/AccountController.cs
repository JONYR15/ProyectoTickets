﻿using Backend.Entities;
using Backend.Models;
using FrontEnd.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Controllers
{

    public class AccountController : Controller
    {

        private readonly UserManager<ApplicationUser> userManager;
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly RoleManager<IdentityRole> roleMngr;
        private readonly TicketsManagerContext db = new TicketsManagerContext();


        public AccountController(UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager, RoleManager<IdentityRole> roleMngr)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.roleMngr = roleMngr;
        }

        [HttpGet]
        public IActionResult Register()
        {
            ViewBag.Name = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(roleMngr.Roles.ToList(), "Name", "Name");
            ViewBag.Departments = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(db.Departments.Select(y=> y.Name).ToList());
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {
  
            ViewBag.Name = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(roleMngr.Roles.ToList(), "Name", "Name");
            ViewBag.Departments = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(db.Departments.Select(y => y.Name).ToList());

            if (ModelState.IsValid)
            {
                // Copy data from RegisterViewModel to ApplicationUser
                var user = new ApplicationUser
                {
                    UserName = model.Email,
                    Email = model.Email,
                };

                // Store user data in AspNetUsers database table
                var result = await userManager.CreateAsync(user, model.Password);

                //Assign Role to User
                await this.userManager.AddToRoleAsync(user, model.UserRoles);

                // If user is successfully created, sign-in the user using
                // SignInManager and redirect to index action of HomeController
                if (result.Succeeded)
                {
                    await signInManager.SignInAsync(user, isPersistent: false);
                    return RedirectToAction("index", "home");
                }

                // If there are any errors, add them to the ModelState object
                // which will be displayed by the validation summary tag helper
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
            }

            return View(model);
        }



        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();
            return RedirectToAction("index", "home");
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await signInManager.PasswordSignInAsync(
                    model.Email, model.Password, model.RememberMe, false);

                if (result.Succeeded)
                {
                    var Usuario = userManager.FindByEmailAsync(User.Identity.Name);
                    TempData["Id"] = Usuario.Id;
                    return RedirectToAction("index", "home");
                }

                ModelState.AddModelError(string.Empty, "Invalid Login Attempt");
            }

            return View(model);
        }

        [HttpGet]
        public IActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ChangePassword(PasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var usuario = await userManager.GetUserAsync(User);
                if (usuario == null)
                {
                    return RedirectToAction("index", "home");
                }

                var result = await userManager.ChangePasswordAsync(usuario,
                    model.PasswordActual, model.NewPassword);

                if (!result.Succeeded)
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }
                    return View();
                }

                await signInManager.RefreshSignInAsync(usuario);
                return View(model);
            }
            return View(model);
        }

        public IActionResult Edit(string Id)
        {
            TicketsManagerContext db = new TicketsManagerContext();
            IdentityUser user;

            user = db.aspUsers.Find(Id);

            return View(user);
        }


        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<JsonResult> ListUser()
        {
            TicketsManagerContext db = new TicketsManagerContext();
            List<ApplicationUser> users;

            users = db.aspUsers.ToList();

            return Json(new { data = users });
        }
    }
}
