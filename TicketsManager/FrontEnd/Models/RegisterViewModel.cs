
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models
{
    public class RegisterViewModel
    {
        [Required(ErrorMessage ="Debe ingresar un correo")]
        [EmailAddress]
        public string Email { get; set; }

        [Required(ErrorMessage = "Debe ingresar una clave")]
        [Display(Name = "Clave")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Debe ingresar un número de cédula")]
        [Display(Name = "Número de cédula")]
        public string DocumentNumber { get; set; }

        [Required(ErrorMessage ="Debe ingresar un nombre")]
        [Display(Name = "Nombre")]
        public string Name { get; set; }

        [Required(ErrorMessage ="Debe ingresar los apellidos")]
        [Display(Name = "Apellidos")]
        public string LastName { get; set; }

        [DataType(DataType.Password)]
        [Required(ErrorMessage ="Debe confirmar la clave nueva")]
        [Display(Name ="Confirmar nueva clave")]
        [Compare("Password",ErrorMessage = "La contraseña nueva y su confirmación no coinciden")]
        public string ComfirmPassword { get; set; }

        [Required(ErrorMessage ="Debe seleccionar un rol")]
        [Display(Name = "Rol")]
        public string UserRoles { get; set; }

        [Required(ErrorMessage ="Debe seleccionar un departamento")]
        [Display(Name = "Departmento")]
        public int DepartmentId { get; set; }
    }

    public class PadronViewModel
    {
        public string Cedula { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Correo { get; set; }
    }
}
