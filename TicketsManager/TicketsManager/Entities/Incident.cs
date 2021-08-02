using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Entities
{
    public partial class Incident
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string RequestById { get; set; }
        public int CategoryId { get; set; }
        public string Theme { get; set; }
        public string Description { get; set; }
        public int PriorityId { get; set; }
        public int? StatusId { get; set; }
        public DateTime Created { get; set; }
        public DateTime? Resolved { get; set; }
        public DateTime? Attended { get; set; }

        public virtual Category Category { get; set; }
        public virtual Priority Priority { get; set; }
        public virtual Status Status { get; set; }
    }
}
