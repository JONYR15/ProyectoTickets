using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models
{
    public class IncidentViewModel
    {
        public int Id { get; set; }

        [Display(Name = "Usuario")]
        public string User { get; set; }

        [Display(Name = "Solicitud de usuario por ")]
        public string UserRequestBy { get; set; }

        [Display(Name = "Tema")]
        public string Theme { get; set; }

        [Display(Name = "Prioridad")]
        public string Priority { get; set; }

        [Display(Name = "Estatus")]
        public string Status { get; set; }

        [Display(Name = "Creado")]
        public DateTime Created { get; set; }

        [Display(Name = "Atendido")]
        public DateTime Attended { get; set; }

    }

    public class IncidentViewModelCreate
    {
        [Display(Name = "Id Usuario")]
        public string UserId { get; set; }

        [Display(Name = "Creado por")]
        public string RequestById { get; set; }

        [Display(Name = "Categoria")]
        public string Category { get; set; }

        [Display(Name = "Tema")]
        public string Theme { get; set; }

        [Display(Name = "Descripción")]
        public string Description { get; set; }

        [Display(Name = "Prioridad")]
        public string Priority { get; set; }

        [Display(Name = "Creado")]
        public DateTime Created { get; set; }
    }

    public class IncidentViewModelEdit
    {
        [Display(Name = "Numero de caso")]
        public int Id { get; set; }
        [Display(Name = "Actualizado por")]
        public string RequestById { get; set; }

        [Display(Name = "Categoria")]
        public string Category { get; set; }

        [Display(Name = "Tema")]
        public string Theme { get; set; }

        [Display(Name = "Descripción")]
        public string Description { get; set; }

        [Display(Name = "Prioridad")]
        public string Priority { get; set; }

        [Display(Name = "Id Estatus")]
        public string StatusId { get; set; }

        [Display(Name = "Estatus")]
        public string Status { get; set; }

        [Display(Name = "Creado")]
        public DateTime Created { get; set; }

        [Display(Name = "Resuelto")]
        public DateTime? Resolved { get; set; }

        [Display(Name = "Atendido")]
        public DateTime? Attended { get; set; }
    }
}
