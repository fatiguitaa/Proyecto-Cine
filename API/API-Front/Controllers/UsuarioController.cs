using API_Back.Models;
using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        IUsuarioRepository _repository;
        public UsuarioController(IUsuarioRepository clienteRepository) 
        {
               _repository = clienteRepository;
        }

        [HttpGet("email/{email}")]
        public IActionResult GetEmail(string email)
        {
            try
            {
                return Ok(_repository.GetByMail(email));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] Usuario oUsuario) 
        {
            try
            {
                return Ok(_repository.Login(oUsuario.EMail, oUsuario.Contrasenia));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpPost("registrar")]
        public IActionResult Register([FromBody] Usuario oUsuario)
        {
            try
            {
                Usuario usuario = new Usuario();
                usuario.Contrasenia = oUsuario.Contrasenia;
                usuario.EMail = oUsuario.EMail;
                return Ok(_repository.Register(usuario));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }

        }
    }
}
