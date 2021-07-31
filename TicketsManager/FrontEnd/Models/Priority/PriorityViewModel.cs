using Backend.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;


namespace FrontEnd.Models.Priority
{
    public class PriorityViewModel
    {
        [Key]
        public int Id { get; set; }

        [Display(Name ="Descripción")]
        public string Description { get; set; }

    }
}
