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

        private string Encriptar(string contraDesencriptada)
        {
            string contraEncriptada = string.Empty;
            byte[] encryted = System.Text.Encoding.Unicode.GetBytes(contraDesencriptada);
            contraEncriptada = Convert.ToBase64String(encryted);
            return contraEncriptada;
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
        public IActionResult Login(string email, string contraseña) 
        {
            try
            {
                return Ok(_repository.Login(email, Encriptar(contraseña)));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }
        }

        [HttpPost("registrar")]
        public IActionResult Register(string email, string contraseña)
        {
            try
            {
                Usuario usuario = new Usuario();
                usuario.Contrasenia = Encriptar(contraseña);
                usuario.EMail = email;
                return Ok(_repository.Register(usuario));
            }
            catch
            {
                return StatusCode(500, "error interno");
            }

        }
    }
}
