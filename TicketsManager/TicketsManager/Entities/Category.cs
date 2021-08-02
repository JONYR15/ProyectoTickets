using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Entities
{
    public partial class Category
    {
        public Category()
        {
            Incidents = new HashSet<Incident>();
        }

        public int Id { get; set; }
        public string CategoryName { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<Incident> Incidents { get; set; }
    }
}
