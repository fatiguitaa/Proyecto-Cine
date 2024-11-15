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
        private ICarteleraRepository _repository;
        public CarteleraController(ICarteleraRepository carteleraRepository)
        {
            _repository = carteleraRepository;
        }
        [HttpGet("{fecha}")]
        public IActionResult CartelerasDesdeFecha(DateTime fecha)
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

        [HttpPost]
        public IActionResult Create([FromBody]Cartelera oCartelera)
        {
            try
            {
                return Ok(_repository.Create(oCartelera));
            }
            catch
            {
                return StatusCode(500, "error intenro");
            }
        }

        [HttpPut]
        public IActionResult Update([FromBody]Cartelera oCartelera)
        {
            try
            {
                return Ok(_repository.Update(oCartelera));
            }
            catch
            {
                return StatusCode(500, "error intenro");
            }
        }
        [HttpPut("Pelicula")]
        public IActionResult AgregarPelicula(int idCartelera, int IdPelicula)
        {
            try
            {
                return Ok(_repository.AgregarPelicula(idCartelera,IdPelicula));
            }
            catch
            {
                return StatusCode(500,"error interno");
            }

        }
        [HttpDelete("Pelicula")]
        public IActionResult SacarPelicula(int idCartelera, int IdPelicula)
        {
            try
            {
                return Ok(_repository.SacarPelicula(idCartelera, IdPelicula));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }

        }
    }
}
