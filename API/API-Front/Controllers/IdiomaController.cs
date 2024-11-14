using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IdiomaController : ControllerBase
    {
        private IIdiomaRepository _repository;

        public IdiomaController(IIdiomaRepository repository)
        {
            _repository = repository;
        }

        // GET: api/<IdiomaController>
        [HttpGet]
        public IActionResult GetAll()
        {
            try
            {
                return Ok(_repository.Getall());
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        // GET api/<IdiomaController>/5
        [HttpGet("{id}")]
        public IActionResult GetByID(int id)
        {
            try
            {
                return Ok(_repository.GetById(id));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }
    }
}
