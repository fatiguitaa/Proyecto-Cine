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
            else
            {
                Sala? SalaAsiento = _context.Asientos
                    .Where(A => A.IdAsiento == idAsiento)
                    .Select(A => A.IdFilaNavigation)
                    .Select(F => F.NumeroSalaNavigation)
                    .FirstOrDefault();
                Sala? SalaReproduccion = _context.Reproducciones
                    .Where(R => R.IdReproduccion == idReproduccion)
                    .Select(R => R.NumeroSalaNavigation)
                    .FirstOrDefault();

                if (SalaAsiento != null && SalaReproduccion != null && SalaAsiento.NumeroSala == SalaReproduccion.NumeroSala)
                _context.AsientosXreproducciones.Add(new AsientosXreproduccione(idAsiento, idReproduccion, false));
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

        public string? GetNombre(int id)
        {
            Reproduccion? oReproduccion = _context.Reproducciones.Find(id);
            if (oReproduccion != null)
            {
                Pelicula? oPelicula = _context.Peliculas.Find(oReproduccion.IdPelicula);
                Idioma? oIdioma = _context.Idiomas.Find(oReproduccion.IdIdioma);
                if (oIdioma != null && oPelicula != null)
                {
                    return oPelicula.Nombre + " (" + oIdioma.Nombre + ") " + oReproduccion.HorarioInicio;
                }
            }
            return null;
        }
    }
}
