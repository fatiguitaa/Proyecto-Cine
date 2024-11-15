using API_Back.Models;
using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class CarteleraRepository : ICarteleraRepository
    {
        private CineDBContext _context;

        public CarteleraRepository(CineDBContext context)
        {
            _context = context;
        }

        public bool AgregarPelicula(int IdCartelera, int IdPelicula)
        {
            _context.PeliculasXcarteleras.Add(new PeliculasXcartelera(IdPelicula, IdCartelera));
            return _context.SaveChanges()==1;
        }
        public bool SacarPelicula(int IdCartelera, int IdPelicula)
        {
            PeliculasXcartelera? PxC = _context.PeliculasXcarteleras.Where(PXC => PXC.IdPelicula==IdPelicula && PXC.IdCartelera==IdCartelera).FirstOrDefault();
            if (PxC != null)
            {
                _context.PeliculasXcarteleras.Remove(PxC);
            }
            return _context.SaveChanges() == 1;
            
        }

        public List<Cartelera> GetAllByFecha(DateTime Fecha)
        {
            return _context.Carteleras.Where(C => C.FechaFin >= Fecha).OrderBy(C => C.FechaInicio).ToList();
        }

        public bool Create(Cartelera oCartelera)
        {
            _context.Carteleras.Add(oCartelera);
            return _context.SaveChanges() == 1;
        }

        public bool Update(Cartelera Modificado)
        {
            Cartelera? oCartelera = _context.Carteleras.Find(Modificado.IdCartelera);
            if (oCartelera!=null)
            {
                oCartelera = Modificado;
            }
            return _context.SaveChanges() == 1;
        }
    }
}
