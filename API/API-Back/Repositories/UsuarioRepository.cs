using API_Back.Models;
using API_Back.Models.DTO;
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

        public UsuarioLogin? Login(string Email, string password)
        {
            
            Usuario? oUsuario = _context.Usuarios.Where(U => U.EMail == Email && U.Contrasenia == password).FirstOrDefault();
            
            
            if (oUsuario != null)
            {
                bool admin = _context.Empleados.Where(E => E.IdUsuario == oUsuario.IdUsuario).Count() == 1;
                return new UsuarioLogin(oUsuario.IdUsuario, oUsuario.EMail, admin);
            }
            else
            {
                return null;
            }
            
        }

        public bool Register(Usuario oUsuario)
        {
            _context.Usuarios.Add(oUsuario);
            return _context.SaveChanges() == 1;
        }
    }
}
