using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models
{
    public class PasswordViewModel
    {
        [Required(ErrorMessage ="Obligatorio")]
        [Display(Name = "Contraseña actual")]
        [DataType(DataType.Password)]
        public string PasswordActual { get; set; }
        
        [Required(ErrorMessage = "Obligatorio")]
        [Display(Name = "Nueva contraseña")]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }
        
        [Compare("NewPassword", ErrorMessage =
            "La contraseña nueva y su confirmación no coinciden")]

        [Display(Name = "Confirmar nueva contraseña")]
        [DataType(DataType.Password)]
        public string ComfirmPassword { get; set; }
    }
}
