using System;
using System.Collections.Generic;
using System.Text;

namespace Backend.Models
{
    public class EmailConfigurationModel
    {
        public string Host { get; set; }

        public int Port { get; set; }

        public bool SSL { get; set; }

        public string User { get; set; }

        public string Password { get; set; }
    }
}
