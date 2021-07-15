using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Entities
{
    public partial class Priority
    {
        public Priority()
        {
            Incidents = new HashSet<Incident>();
        }

        public int Id { get; set; }
        public string Description { get; set; }

        public virtual ICollection<Incident> Incidents { get; set; }
    }
}
