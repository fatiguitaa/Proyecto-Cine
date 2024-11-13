using API_Back.Models;
using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PeliculaController : ControllerBase
    {
        private IPeliculaRepository _repository;
        public PeliculaController(IPeliculaRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public IActionResult GetAll() 
        {
            try
            {
                return Ok(_repository.GetAll());
            }
            catch(Exception ex)
            {
                return StatusCode(500,"Error interno "+ex);
            }
        }
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
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

        [HttpGet("Cartelera/{idCartelera}")]
        public IActionResult GetByCartelera(int idCartelera) 
        {
            try
            {
                return Ok(_repository.GetAllByCartelera(idCartelera));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpPost]
        public IActionResult Create(Pelicula pelicula)
        {
            try
            {
                return Ok(_repository.Update(pelicula));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpPut]
        public IActionResult Update(Pelicula pelicula)
        {
            try
            {
                return Ok(_repository.Update(pelicula));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpDelete]
        public IActionResult Delete(int idPelicula)
        {
            try
            {
                return Ok(_repository.Delete(idPelicula));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }
    }
}
