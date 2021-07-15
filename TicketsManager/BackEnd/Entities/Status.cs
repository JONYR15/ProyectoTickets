using System;
using System.Collections.Generic;

#nullable disable

namespace BackEnd.Entities
{
    public partial class Status
    {
        public Status()
        {
            Incidents = new HashSet<Incident>();
            Sesions = new HashSet<Sesion>();
        }

        public int Id { get; set; }
        public string Description { get; set; }

        public virtual ICollection<Incident> Incidents { get; set; }
        public virtual ICollection<Sesion> Sesions { get; set; }
    }
}
