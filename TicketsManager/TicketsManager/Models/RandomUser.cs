using System.ComponentModel.DataAnnotations.Schema;

namespace Backend.Models
{
    [NotMapped]
    public class RandomUser
    {
        public string UserId { get; set; }
        public string Email { get; set; }

    }
}
