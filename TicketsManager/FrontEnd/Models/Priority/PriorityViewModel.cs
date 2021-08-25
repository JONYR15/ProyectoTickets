using System.ComponentModel.DataAnnotations;

namespace FrontEnd.Models.Priority
{
    public class PriorityViewModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Debe ingresar una descripción")]
        [Display(Name = "Descripción")]
        public string Description { get; set; }

    }
}
