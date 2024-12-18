﻿using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public interface IReproduccionRepository
    {
        List<Reproduccion> GetAll();

        bool OcuparAsiento(int idAsiento, int idReproduccion);

        List<Reproduccion> GetToDate(DateTime fecha);

        List<Reproduccion>? GetByCartelera(int idCartelera,int idPelicula,bool Finalizadas);

        string? GetNombre(int id);

        Reproduccion? GetById(int id);

        bool Create(Reproduccion oReproduccion);
    }
}
