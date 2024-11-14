using API_Back.Models;
using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;
using static System.Runtime.InteropServices.JavaScript.JSType;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        IClienteRepository _clienteRepository;
        public ClienteController(IClienteRepository clienteRepository)
        {
            _clienteRepository = clienteRepository;
        }

        [HttpPost("Crear")]
        public IActionResult Crear([FromBody] Cliente oCliente, string nombre, string apellido,DateOnly fechaNac, string? telefono,int? idUsuario)
        {
            try
            {
                return Ok(_clienteRepository.Create(oCliente.Nombre, oCliente.Apellido, oCliente.FechaNac, oCliente.Telefono, oCliente.IdUsuario));
            }
            catch 
            {

                return StatusCode(500, "error interno");
            }
        }

        [HttpGet("All")]
        public IActionResult GetAll()
        {
            try
            {
                return Ok(_clienteRepository.GetAll());
            }
            catch 
            {

                return StatusCode(500, "error interno");
            }
        }

        [HttpPut("Update")]
        public IActionResult Update([FromBody] Cliente oCliente)
        {
            try
            {
                return Ok(_clienteRepository.Update(oCliente.Nombre, oCliente.Apellido, oCliente.FechaNac, oCliente.Telefono, oCliente.IdUsuario));
            }
            catch 
            {

                return StatusCode(500, "error interno");
            }
        }

        [HttpGet("GetByIdUsuario")]
        public IActionResult GetByIdUsuario(int idUsuario) 
        {
            try
            {
                return Ok(_clienteRepository.GetByIdUsuario(idUsuario));
            }
            catch 
            {

                return StatusCode(500, "error interno");
            }
        }
    }
}
