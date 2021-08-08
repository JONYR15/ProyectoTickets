using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models
{
    public class PasswordViewModel
    {
        [Required(ErrorMessage ="Oblogatorio")]
        [Display(Name = "Contraseña actual")]
        [DataType(DataType.Password)]
        public string PasswordActual { get; set; }
        
        [Required(ErrorMessage = "Oblogatorio")]
        [Display(Name = "Nueva contraseña")]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }
        
        [Compare("NewPassword", ErrorMessage =
            "La contraseña nueva y su comfirmación no coinciden")]
        [Display(Name = "Comfirmar nueva contraseña")]
        [DataType(DataType.Password)]
        public string ComfirmPassword { get; set; }
    }
}
