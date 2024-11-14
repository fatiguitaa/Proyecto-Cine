﻿using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public interface IFacturaRepository
    {
        bool Create(DateTime Fecha, int IdCliente, List<DetalleFactura> Detalles);
    }
}
