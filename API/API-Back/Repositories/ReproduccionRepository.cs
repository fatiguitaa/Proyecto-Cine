using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class ReproduccionRepository : IReproduccionRepository
    {
        private CineDBContext _context;

        public ReproduccionRepository(CineDBContext context)
        {
            _context = context;
        }
        public List<Reproduccion> GetAll()
        {
            return _context.Reproducciones.ToList();
        }

        public bool OcuparAsiento(int idAsiento, int idReproduccion)
        {
            AsientosXreproduccione? AXR = _context.AsientosXreproducciones.Where(X => X.IdAsiento == idAsiento && X.IdReproduccion == idReproduccion).FirstOrDefault();
            if (AXR != null)
            {
                AXR.Libre = false;
            }
            return _context.SaveChanges() == 1;
        }
        public List<Reproduccion>? GetByCartelera(int idCartelera, int idPelicula,bool Finalizadas)
        {
            Cartelera? oCartelera = _context.Carteleras.Find(idCartelera);
            if (oCartelera != null)
            {
                var Temp=_context.Reproducciones.Where(R => R.HorarioInicio > oCartelera.FechaInicio && R.HorarioInicio < oCartelera.FechaFin && R.IdPelicula == idPelicula);
                if (!Finalizadas)
                {
                     Temp = Temp.Where(R => R.HorarioInicio > DateTime.Now);
                }
                return Temp.ToList();
            }
            return null;

        }

        public List<Reproduccion> GetToDate(DateTime fecha)
        {
            return _context.Reproducciones.Where(X => X.HorarioInicio > fecha).ToList();
        }
    }
}
