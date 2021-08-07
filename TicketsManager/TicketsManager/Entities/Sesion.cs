using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Entities
{
    public partial class Sesion
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public int IncidentId { get; set; }
        public string Description { get; set; }
        public int Hour { get; set; }
        public DateTime Created { get; set; }

        public virtual Incident Incident { get; set; }
    }
}
