using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Entities
{
    public partial class Department
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool? Active { get; set; }

    }
}
