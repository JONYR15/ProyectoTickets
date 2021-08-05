using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Entities
{
    public partial class Status
    {
        public Status()
        {
            Incidents = new HashSet<Incident>();
        }

        public int Id { get; set; }
        public string Description { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<Incident> Incidents { get; set; }
    }
}
