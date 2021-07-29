﻿using FrontEnd.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;
using System.Security.Claims;

namespace FrontEnd.Controllers
{
    public class AccountController : Controller
    {

        private readonly UserManager<IdentityUser> userManager;
        private readonly SignInManager<IdentityUser> signInManager;
        private readonly RoleManager<IdentityRole> roleMngr;


        public AccountController(UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager, RoleManager<IdentityRole> roleMngr)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.roleMngr = roleMngr;
        }

        [HttpGet]
        public IActionResult Register()
        {
            ViewBag.Name = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(roleMngr.Roles.ToList(), "Name", "Name");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {
            ViewBag.Name = new Microsoft.AspNetCore.Mvc.Rendering.SelectList(roleMngr.Roles.ToList(), "Name", "Name");
            if (ModelState.IsValid)
            {
                // Copy data from RegisterViewModel to IdentityUser
                var user = new IdentityUser
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

    }
}
