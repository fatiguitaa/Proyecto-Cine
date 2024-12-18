﻿using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class PeliculaRepository : IPeliculaRepository
    {
        private CineDBContext _context;

        public PeliculaRepository(CineDBContext context)
        {
            _context = context;
        }
        public bool Create(Pelicula oPelicula)
        {
            _context.Peliculas.Add(oPelicula);
            return _context.SaveChanges() == 1;
        }

        public bool Delete(int id)
        {
           Pelicula? oPelicula = _context.Peliculas.Where(p => p.IdPelicula == id).FirstOrDefault();
           if (oPelicula != null && oPelicula.EstaActiva == true)
           {
                oPelicula.EstaActiva = false;
           }
           return _context.SaveChanges()== 1;
        }

        public List<Pelicula> GetAll()
        {
            return _context.Peliculas.Where(P => P.EstaActiva == true).ToList();
        }

        public List<Pelicula> GetAllByCartelera(int IdCartelera)
        {
            return _context.Carteleras.Where(C => C.IdCartelera == IdCartelera).SelectMany(C => C.PeliculasXcarteleras).Select(X => X.IdPeliculaNavigation).Where(P=>P.EstaActiva==true).ToList();
        }

        public Pelicula? GetById(int id)
        {
            return _context.Peliculas.Where(p => p.IdPelicula == id).FirstOrDefault();
        }

        public string GetNombre(int id)
        {
            Pelicula? oPelicula = _context.Peliculas.Where(p => p.IdPelicula == id).FirstOrDefault();
            if (oPelicula != null)
            {
                return oPelicula.Nombre;
            }
            else
            {
                return "no existe la pelicula";
            }
        }

        public bool Update(Pelicula oModificado)
        {
            Pelicula? oPelicula = _context.Peliculas.Where(p => p.IdPelicula == oModificado.IdPelicula).FirstOrDefault();
            if (oPelicula != null)
            {
                _context.Entry(oPelicula).CurrentValues.SetValues(oModificado);
            }

            return _context.SaveChanges() == 1;

        }
    }
}
