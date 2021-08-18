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
            [Display(Name = "Incidente")]
            public IncidentViewModel incident { get; set; }
        }

        public class SesionCreateViewModel
        {
            [Display(Name = "Id Usuario")]
            public string UserId { get; set; }

            [Display(Name = "Id Incidente")]
            public int IncidentId { get; set; }

            [Display(Name = "Descripción")]
            public string Description { get; set; }

            [Display(Name = "Hora")]
            public int Hour { get; set; }

            public bool Finalizado { get; set; }

            [Display(Name = "Creado")]
            public DateTime Created { get; set; }
        }
    }
}
