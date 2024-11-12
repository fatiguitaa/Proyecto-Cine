using API_Back.Models;
using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarteleraController : ControllerBase
    {
        ICarteleraRepository _repository;
        public CarteleraController(ICarteleraRepository carteleraRepository)
        {
            _repository = carteleraRepository;
        }
        [HttpGet("hastafecha")]
        public IActionResult CartelerasDesdeFecha(DateOnly fecha)
        {
            try
            {
                return Ok(_repository.GetAllByFecha(fecha));
            }
            catch
            {
                return StatusCode(500, "Error interno");
            }
        }

        [HttpPost("agregar")]
        public IActionResult Create(Cartelera oCartelera)
        {
            return Ok("aca no hay nada pa");
        }

        [HttpPut("actualizar")]
        public IActionResult Update(Cartelera oCartelera)
        {
            return Ok("aca no hay nada pa X2");
        }
    }
}
