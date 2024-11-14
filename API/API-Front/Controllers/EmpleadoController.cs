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
        private EmpleadoController(IEmpleadosRepository repository)
        {
            _repository = repository;
        }

        [HttpPut("crear")]
        public IActionResult Crear(string nombre, string apellido,DateOnly fechaNac, string telefono, int idArea,int idUsuario)
        {
            try
            {
                return Ok(_repository.Create(nombre,apellido, fechaNac,telefono,idArea,idUsuario));
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
            catch 
            {

                return StatusCode(500, "error interno");
            }
        }

        [HttpPut("Update")]
        public IActionResult Update(string nombre, string apellido,DateOnly FechaNac, string telefono, int idArea, int idUsuario)
        {
            try
            {
                return Ok(_repository.Update(nombre, apellido,FechaNac,telefono,idArea,idUsuario));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }
    }
}
