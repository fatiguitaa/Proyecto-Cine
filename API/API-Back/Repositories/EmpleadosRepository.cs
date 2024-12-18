﻿using API_Back.Models;
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
        public EmpleadosRepository(CineDBContext context)
        {
            _context = context;
        }

        public bool Create(string nombre, string apellido,DateOnly? FechaNac, string telefono, int idArea, int? idUsuario)
        {
            Empleado empleado = new Empleado();
            empleado.Nombre = nombre;
            empleado.Apellido = apellido;
            empleado.Telefono = telefono;
            empleado.IdArea = idArea;
            empleado.FechaNac = FechaNac;
            empleado.IdUsuario = idUsuario;
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

        public bool Update(Empleado oModificado)
        {
            Empleado? empleado = _context.Empleados.Where(X=>X.IdUsuario==oModificado.IdUsuario).FirstOrDefault();
            if (empleado != null)
            {
                _context.Entry(empleado).CurrentValues.SetValues(oModificado);
            }
            return _context.SaveChanges() == 1;
        }
    }
}
