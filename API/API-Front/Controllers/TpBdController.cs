using Microsoft.AspNetCore.Mvc;
using API_Back.Negocio.Servicio;
using System.Data;
using Newtonsoft.Json;
using API_Back.Negocio;
using API_Back.Models;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class TpBdController : ControllerBase
    {
        private TpBdConsultasServicios _repository=new TpBdConsultasServicios();

        [HttpGet("consulta1")]
        public IActionResult GetTotalVentasEfechas(string fechaInicio, string fehchaFin)
        {
            try
            {
                DateOnly doFechaInicio = DateOnly.Parse(fechaInicio);
                DateOnly doFechaFin=DateOnly.Parse(fehchaFin);


                DataTable dt = new DataTable();
                dt = _repository.Consulta1(doFechaInicio, doFechaFin);
                if (dt == null)
                {
                    return NotFound("UPS! parece no haber ninguna pelicula entre esas fechas.");
                }
                //var diccionario = Serealizar.GetDict(dt);
                var json = JsonConvert.SerializeObject(dt);
                return Ok(json);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpGet("consulta2")]
        public IActionResult GetDuracion(int duracionMin)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = _repository.Consulta2(duracionMin);
                if (dt == null)
                {
                    return NotFound("UPS! parece no haber ninguna pelicula de menos de " + duracionMin + " minutos.");
                }
                //var diccionario = Serealizar.GetDict(dt);
                var json = JsonConvert.SerializeObject(dt);
                return Ok(json);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "error interno: " + ex);
            }
        }

        [HttpGet("consulta3")]
        public IActionResult GetMaxReproduccion(int idPelicula,bool asientosLibres)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = _repository.Consulta3(idPelicula, asientosLibres);
                if (dt == null)
                {
                    return NotFound("UPS! parece no haber ningun registro con los parametros ingresados.");
                }
                //var diccionario = Serealizar.GetDict(dt);
                var json = JsonConvert.SerializeObject(dt);
                return Ok(json);
            }
            catch (Exception ex)
            {

                return StatusCode(500, "error interno");
            }
        }

        [HttpGet("consulta4")]
        public IActionResult GetEmpleadosEnReproduccion(bool mostrarEmpleadosQueYaestuvieronEnReproduccion)
        {
            try
            {

                DataTable dt = new DataTable();
                //Console.WriteLine("pene");
                dt = _repository.Consulta4(mostrarEmpleadosQueYaestuvieronEnReproduccion);
                
                if (dt == null)
                {
                    if (mostrarEmpleadosQueYaestuvieronEnReproduccion)
                    {
                        return NotFound("UPS! Parece que ningun empleado estuvo en reproduccion todavia!");
                    }
                    else
                    {
                        return NotFound("UPS! Parece ser que todos los empleados ya estuvieron en reproduccion.");
                    }
                    
                }
                //var diccionario = Serealizar.GetDict(dt);
                var json = JsonConvert.SerializeObject(dt);
                return Ok(json);
            }
            catch (Exception ex)
            {

                return StatusCode(500, "error interno: "+ex);
            }
        }

        [HttpGet("Consulta5")]
        public IActionResult GetConsulta5(decimal montoMinimo)
        {
            try
            {
                Console.WriteLine(montoMinimo);
                DataTable dt = new DataTable();
                dt = _repository.Consulta5(montoMinimo);
                if (dt == null)
                {
                    return NotFound("UPS! parece no haber ningun registro con el parametro ingresado.");
                }
                //var diccionario = Serealizar.GetDict(dt);
                var json = JsonConvert.SerializeObject(dt);
                return Ok(json);
            
            }
            catch (Exception ex)
            {
                return StatusCode(500, "error interno");
                
            }
        }
    }

}
