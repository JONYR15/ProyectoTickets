using Backend.Entities;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Backend.Models
{
    public class ApplicationUser: IdentityUser
    {
        public int DepartmentId { get; set; }

        public string DocumentNumber { get; set; }

        public string Name { get; set; }

        public string LastName { get; set; }

        [ForeignKey("DepartmentId")]
        public Department Department { get; set; }
    }
}
