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
    [Route("api/[controller]")]
    [ApiController]
    public class PadronController : ControllerBase
    {
        // GET: api/<PadronController>
        [HttpGet]
        public JsonResult Get()
        {
            IEnumerable<PadronCompleto> padronCompletoList;
            using (UnidadDeTrabajo<PadronCompleto> unidad = new UnidadDeTrabajo<PadronCompleto>(new Padron_ElectoralContext()))
            {
                padronCompletoList = unidad.genericDAL.GetAll();
            }


            return new JsonResult(padronCompletoList);
        }

        // GET api/<PadronController>/5
        [HttpGet("{cedula}")]
        public JsonResult Get(int cedula)
        {
            PadronCompleto padronCompleto;
            using (UnidadDeTrabajo<PadronCompleto> unidad = new UnidadDeTrabajo<PadronCompleto>(new Padron_ElectoralContext()))
            {
                padronCompleto = unidad.genericDAL.Get(cedula);
            }

            return new JsonResult(padronCompleto);
        }


    }
}