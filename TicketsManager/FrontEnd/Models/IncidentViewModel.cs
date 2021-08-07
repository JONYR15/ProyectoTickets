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

    public class IncidentViewModelCreate
    {
        public string UserId { get; set; }
        public string RequestById { get; set; }
        public string Category { get; set; }
        public string Theme { get; set; }
        public string Description { get; set; }
        public string Priority { get; set; }
        public DateTime Created { get; set; }
    }

    public class IncidentViewModelEdit
    {
        [Display(Name = "Numero de caso")]
        public int Id { get; set; }
        [Display(Name = "Actualizado por")]
        public string RequestById { get; set; }
        public string Category { get; set; }
        public string Theme { get; set; }
        public string Description { get; set; }
        public string Priority { get; set; }
        public string StatusId { get; set; }
        public string Status { get; set; }
        public DateTime Created { get; set; }
        public DateTime? Resolved { get; set; }
        public DateTime? Attended { get; set; }
    }
}
