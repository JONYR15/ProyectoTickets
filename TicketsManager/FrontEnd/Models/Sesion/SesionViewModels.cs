using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models.Sesion
{
    public class SesionViewModels
    {
        public class SesionDetailViewModel
        {
            public IncidentViewModel incident { get; set; }
        }

        public class SesionCreateViewModel
        {
            public string UserId { get; set; }
            public int IncidentId { get; set; }
            public string Description { get; set; }
            public int Hour { get; set; }
            [Display(Name = "Finalize")]
            public bool Finalizado { get; set; }
            public DateTime Created { get; set; }
        }
    }
}
