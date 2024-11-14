using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class AsientoRepository : IAsientoRepository
    {
        private CineDBContext _context;
        public AsientoRepository(CineDBContext context)
        {
            _context = context;
        }
        public string? GetNombre(int id)
        {
            Asiento? oAsiento = _context.Asientos.Where(A => A.IdAsiento == id).FirstOrDefault();
            if (oAsiento != null)
            {
                Fila? oFila = _context.Filas.Where(F => F.IdFila == oAsiento.IdFila).FirstOrDefault();
                if (oFila != null)
                {
                    return oFila.Letra + oAsiento.NumeroAsiento + " - Sala " + oFila.NumeroSala;
                }
            }
            return null;
        }
    }
}
