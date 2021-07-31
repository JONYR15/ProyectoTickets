using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models
{
    public class IncidentViewModel
    {
        [Key]
        public int Id { get; set; }

        [Display(Name ="Usuario")]
        public string User { get; set; }

        [Display(Name = "Solicitud de usuario por")]
        public string UserRequestBy { get; set; }

        [Display(Name = "Tema")]
        public string Theme { get; set; }

        [Display(Name = "Prioridad")]
        public string Priority { get; set; }

        [Display(Name = "Estado")]
        public string Status { get; set; }

        [Display(Name = "Creado")]
        public DateTime Created { get; set; }

        [Display(Name = "Atendido")]
        public DateTime Attended { get; set; }

    }
}
