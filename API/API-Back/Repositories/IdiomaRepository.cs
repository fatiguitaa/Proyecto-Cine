using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class IdiomaRepository
    {
        private CineDBContext _context;
        public IdiomaRepository(CineDBContext context)
        {
            _context = context;
        }
        public List<Idioma> Getall()
        {
            return _context.Idiomas.ToList();
        }

        public Idioma? GetById(int id)
        {
            return _context.Idiomas.Where(G => G.IdIdioma == id).FirstOrDefault();
        }
    }
}
