using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class ClienteRepository : IClienteRepository
    {
        private CineDBContext _context;

        public ClienteRepository(CineDBContext context)
        {
            _context = context;
        }

        public bool Create(string nombre, string apellido, int edad, string? telefono, int? idUsuario)
        {
            Cliente cliente=new Cliente();
            cliente.Nombre = nombre;
            cliente.Apellido = apellido;
            cliente.Edad = edad;
            cliente.Telefono = telefono;   
            cliente.IdUsuario = idUsuario;
            _context.Clientes.Add(cliente);
            return _context.SaveChanges()==1;
        }

        public List<Cliente> GetAll()
        {
            return _context.Clientes.ToList();
        }

        public Cliente? GetByIdUsuario(int idUsuario)
        {
            return _context.Clientes.Where(X => X.IdUsuario == idUsuario).FirstOrDefault();
        }

        public bool Update(string nombre, string apellido, int edad, string? telefono, int? idUsuario)
        {
            Cliente? cliente = _context.Clientes.Where(X => X.IdUsuario == idUsuario).FirstOrDefault();

            if (cliente != null)
            {
                cliente.Telefono = telefono;
                cliente.Apellido = apellido;
                cliente.Nombre = nombre;
                cliente.Edad = edad;
            }
            return _context.SaveChanges()==1;

        }
    }
}
