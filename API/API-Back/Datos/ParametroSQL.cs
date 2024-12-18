﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Datos
{
    public class ParametroSQL
    {
        public string Nombre { get; set; }
        public object? Valor { get; set; }
        public SqlDbType? Tipo { get; set; }
        public ParametroSQL(string nombre, object valor)
        {
            Nombre = nombre;
            Valor = valor;
        }
        public ParametroSQL(string nombre,SqlDbType tipo)
        {
            Tipo = tipo;
            Nombre= nombre;
        }
    }
}
