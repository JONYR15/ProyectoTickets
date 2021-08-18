using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Debe ingresar un correo")]
        [EmailAddress]
        public string Email { get; set; }

        [Required(ErrorMessage ="Debe ingresar una clave")]
        [DataType(DataType.Password)]
        [Display(Name = "Clave")]
        public string Password { get; set; }

        [Display(Name = "Recordar")]
        public bool RememberMe { get; set; }
    }
}
