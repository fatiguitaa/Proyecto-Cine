using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AsientoController : ControllerBase
    {

        private IAsientoRepository _repository;
        public AsientoController(IAsientoRepository repository)
        {
            _repository = repository;
        }
        // GET api/<AsientoController>/5
        [HttpGet("Nombre/{id}")]
        public IActionResult GetNombre(int id)
        {
            try
            {
                return Ok(_repository.GetNombre(id));
            }
            catch (Exception ex)
            {
                {
                    return StatusCode(500, "error interno" + ex.Message);
                }

            }

        }
    }
}
