using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Models
{
    public class IncidentViewModel
    {
        public int Id { get; set; }
        public string User { get; set; }
        public string UserRequestBy { get; set; }
        public string Theme { get; set; }
        public string Priority { get; set; }
        public string Status { get; set; }
        public DateTime Created { get; set; }
        public DateTime Attended { get; set; }

    }
}
