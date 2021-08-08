using System.ComponentModel.DataAnnotations;

namespace FrontEnd.Models.Priority
{
    public class PriorityViewModel
    {
        public int Id { get; set; }
        [Required]
        public string Description { get; set; }

    }
}
