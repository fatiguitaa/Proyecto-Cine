using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class GeneroRepository : IGeneroRepository
    {
        private CineDBContext _context;
        public GeneroRepository(CineDBContext context)
        {
            _context = context;
        }
        public List<Genero> Getall()
        {
            return _context.Generos.ToList();
        }

        public Genero? GetById(int id)
        {
            return _context.Generos.Where(G => G.IdGenero == id).FirstOrDefault();
        }
    }
}
