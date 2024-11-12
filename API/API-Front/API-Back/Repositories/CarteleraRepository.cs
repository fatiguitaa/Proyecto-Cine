using API_Back.Models;
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
        public List<Cartelera> GetAllByFecha(DateOnly Fecha)
        {
            return _context.Carteleras.Where(C => C.FechaFin >= Fecha).ToList();
        }
    }
}
