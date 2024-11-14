using API_Back.Models;
using API_Back.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public interface IUsuarioRepository
    {
        Usuario? GetByMail(string Email);
        UsuarioLogin? Login(string Email, string password);
        bool Register(Usuario usuario);

    }
}
