﻿using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public interface IEmpleadosRepository
    {
        bool Create(string nombre, string apellido, string telefono,int idArea, int? idUsuario);
        List<Empleado>? GetAll();
        bool Update(string nombre, string apellido, string telefono,int idArea, int? idUsuario);
        Empleado? GetByIdUsuario(int idUsuario);
    }
}
