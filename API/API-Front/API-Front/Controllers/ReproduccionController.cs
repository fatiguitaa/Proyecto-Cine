using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReproduccionController : ControllerBase
    {
        IReproduccionRepository _repository;
        public ReproduccionController(IReproduccionRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public IActionResult GetToDate(DateTime fecha)
        {
            try
            {
                return Ok(_repository.GetToDate(fecha));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpPost("asiento")]
        public IActionResult Update(int idAsiento, int idReproduccion)
        {
            try
            {
                return Ok(_repository.OcuparAsiento(idAsiento, idReproduccion));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }
    }
}
