using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models.Departament
{
    public class DepartmentViewModel
    {
        [Key]
        public int Id { get; set; }

        [Display(Name="Nombre")]
        public string Name { get; set; }
    }
}
