using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SalaController : ControllerBase
    {
        private ISalaRepository _repository;
        public SalaController(ISalaRepository repository)
        {
            _repository = repository;
        }


        // GET: api/<SalaController>
        [HttpGet]
        public IActionResult Get(int idSala, int idReproduccion)
        {
            try
            {
                return Ok(_repository.LLamarAsientos(idSala, idReproduccion));
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error interno");
            }
        }


    }
}
