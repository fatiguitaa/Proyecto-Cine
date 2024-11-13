using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class EmpleadosRepository : IEmpleadosRepository
    {
        private CineDBContext _context;
        private EmpleadosRepository(CineDBContext context)
        {
            _context = context;
        }

        public bool Create(string nombre, string apellido, string telefono, int idArea, int? idUsuario)
        {
            Empleado empleado = new Empleado();
            empleado.Nombre = nombre;
            empleado.Apellido = apellido;
            empleado.Telefono = telefono;
            empleado.IdArea = idArea;
            _context.Empleados.Add(empleado);
            return _context.SaveChanges()==1;
        }

        public List<Empleado>? GetAll()
        {
            return _context.Empleados.ToList();
        }

        public Empleado? GetByIdUsuario(int idUsuario)
        {
            return _context.Empleados.Where(X=> X.IdUsuario==idUsuario).FirstOrDefault();
        }

        public bool Update(string nombre, string apellido, string telefono, int idArea, int? idUsuario)
        {
            Empleado? empleado = _context.Empleados.Where(X=>X.IdUsuario==idUsuario).FirstOrDefault();
            if (empleado != null)
            {
                empleado.Nombre= nombre;
                empleado.Apellido= apellido;
                empleado.Telefono= telefono;
                empleado.IdArea= idArea;
            }
            return _context.SaveChanges() == 1;
        }
    }
}
