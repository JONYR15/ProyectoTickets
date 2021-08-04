using System;
using System.Collections.Generic;

#nullable disable

namespace BackEnd.Entities
{
    public partial class PadronCompleto
    {
        public string Cedula { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Correo { get; set; }
    }
}
