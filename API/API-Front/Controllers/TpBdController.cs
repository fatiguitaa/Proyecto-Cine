using Microsoft.AspNetCore.Mvc;
using API_Back.Negocio.Servicio;
using System.Data;
using Newtonsoft.Json;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class TpBdController : ControllerBase
    {
        private TpBdConsultasServicios _repository=new TpBdConsultasServicios();
        [HttpGet("consulta2")]
        public IActionResult GetDuracion(int duracionMin)
        {
            try
            {
                DataTable dt = new DataTable(); 
                dt= _repository.Consulta2(duracionMin);
                if(dt == null)
                {
                    return NotFound("UPS! parece no haber ninguna pelicula de menos de "+duracionMin+" minutos");
                }
                var json = JsonConvert.SerializeObject(dt);
                return Ok(json);
            }
            catch(Exception ex)
            {
                return StatusCode(500, "error interno: "+ex);
            }
        }
    }
}
