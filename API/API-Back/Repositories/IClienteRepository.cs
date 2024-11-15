using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public interface IClienteRepository
    {
        bool Create(string nombre, string apellido,DateOnly? FechaNac, string? telefono, int? idUsuario);
        List<Cliente> GetAll();
        bool Update(Cliente oEmpleado);
        Cliente? GetByIdUsuario(int idUsuario);
    }
}
