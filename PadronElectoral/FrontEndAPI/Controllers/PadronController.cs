using BackEnd.DAL;
using BackEnd.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEndAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    public class PadronController : ControllerBase
    {
        private readonly UnidadDeTrabajo<PadronCompleto> _unidadDeTrabajo;

        public PadronController(UnidadDeTrabajo<PadronCompleto> unidadDeTrabajo)
        {
            _unidadDeTrabajo = unidadDeTrabajo;
        }

        [HttpGet]
        public IActionResult GetPadron(string cedula)
        {
            try
            {
                PadronCompleto padronCompleto;

                padronCompleto = _unidadDeTrabajo.genericDAL.Find(x => x.Cedula.Equals(cedula)).FirstOrDefault();

                if (padronCompleto is null) return NotFound();

                padronCompleto.Nombre = padronCompleto.Nombre.Trim();
                padronCompleto.PrimerApellido = padronCompleto.PrimerApellido.Trim();
                padronCompleto.SegundoApellido = padronCompleto.SegundoApellido.Trim();
                padronCompleto.Cedula = padronCompleto.Cedula.Trim();

                return Ok(padronCompleto);
            }
            catch (Exception ex)
            {
                return Problem(ex.ToString(), null, 500);
            }
        }
    }
}