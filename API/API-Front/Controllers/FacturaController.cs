using API_Back.Models;
using API_Back.Repositories;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Front.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacturaController : ControllerBase
    {
        private IFacturaRepository _repository;

        public FacturaController(IFacturaRepository repository)
        {
            _repository = repository;
        }

        // POST api/<ValuesController>
        [HttpPost]
        public IActionResult Create([FromBody] List<DetalleFactura>Detalles,DateTime Fecha,int IdCliente)
        {
            try
            {
                return Ok(_repository.Create(Fecha, IdCliente, Detalles));
            }
            catch
            {
                return StatusCode(500, "Error Interno");
            }
        }

        
    }
}
