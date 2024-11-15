using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AreaController : ControllerBase
    {
        private IAreaRepository _areaRepository;
        public AreaController(IAreaRepository areaRepository)
        {
            _areaRepository = areaRepository;
        }
        // GET: api/<AreaController>
        [HttpGet]
        public IActionResult GetAll()
        {
            try
            {
                return Ok(_areaRepository.GetAll());
            }
            catch 
            {

                return StatusCode(500, "error interno");
            }
        }


    }
}
