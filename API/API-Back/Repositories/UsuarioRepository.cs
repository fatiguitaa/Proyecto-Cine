using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class UsuarioRepository : IUsuarioRepository
    {
        private CineDBContext _context;

        public UsuarioRepository(CineDBContext context)
        {
            _context = context;
        }
        public Usuario? GetByMail(string Email)
        {
            return _context.Usuarios.Where(U => U.EMail == Email).FirstOrDefault();
        }

        public Usuario? Login(string Email, string password)
        {
            return _context.Usuarios.Where(U => U.EMail == Email && U.Contrasenia == password).FirstOrDefault();
        }

        public bool Register(Usuario oUsuario)
        {
            _context.Usuarios.Add(oUsuario);
            return _context.SaveChanges() == 1;
        }
    }
}
