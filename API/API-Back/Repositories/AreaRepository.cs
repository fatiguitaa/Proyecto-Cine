using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class AreaRepository : IAreaRepository
    {
        private CineDBContext _context;
        public AreaRepository(CineDBContext context)
        {
            _context = context;
        }
        public List<Area> GetAll()
        {
           return _context.Areas.ToList();
        }
    }
}
