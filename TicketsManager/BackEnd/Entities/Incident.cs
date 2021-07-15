using System;
using System.Collections.Generic;

#nullable disable

namespace BackEnd.Entities
{
    public partial class Incident
    {
        public Incident()
        {
            Sesions = new HashSet<Sesion>();
        }

        public int Id { get; set; }
        public string UserId { get; set; }
        public string RequestById { get; set; }
        public string Theme { get; set; }
        public string Description { get; set; }
        public int PriorityId { get; set; }
        public int? StatusId { get; set; }
        public DateTime Created { get; set; }
        public DateTime Resolved { get; set; }
        public DateTime Attended { get; set; }

        public virtual Priority Priority { get; set; }
        public virtual Status Status { get; set; }
        public virtual ICollection<Sesion> Sesions { get; set; }
    }
}
