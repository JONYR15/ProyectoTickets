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
        public string User { get; set; }
        public string UserRequestBy { get; set; }
        public string Theme { get; set; }
        public string Priority { get; set; }
        public string Status { get; set; }
        public DateTime Created { get; set; }
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
