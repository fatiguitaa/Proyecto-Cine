using API_Back.Models;
using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadoController : ControllerBase
    {
        IEmpleadosRepository _repository;
        public EmpleadoController(IEmpleadosRepository repository)
        {
            _repository = repository;
        }

        [HttpPost("crear")]
        public IActionResult Crear([FromBody] Empleado oEmpleado)
        {
            try
            {
                return Ok(_repository.Create(oEmpleado.Nombre,oEmpleado.Apellido, oEmpleado.FechaNac,oEmpleado.Telefono,oEmpleado.IdArea,oEmpleado.IdUsuario));
            }
            catch {
                return StatusCode(500, "error interno");
            }
        }

        [HttpGet("All")]
        public IActionResult GetAll()
        {
            try
            {
                return Ok(_repository.GetAll());
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpGet("GetByIdUsuario")]
        public IActionResult GetByIdUsuario(int idUsuario)
        {
            try
            {
                return Ok(_repository.GetByIdUsuario(idUsuario));
            }
            catch (Exception ex)
            {

                return StatusCode(500, "error interno: "+ex);
            }
        }

        [HttpPut("Update")]
        public IActionResult Update([FromBody] Empleado oEmpleado)
        {
            try
            {
                return Ok(_repository.Update(oEmpleado));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }
    }
}
