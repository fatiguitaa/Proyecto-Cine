using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public interface IPeliculaRepository
    {
        List<Pelicula> GetAll();
        Pelicula? GetById(int id);
        List<Pelicula> GetAllByCartelera(int IdCartelera);
        bool Create(Pelicula oPelicula);
        bool Update(Pelicula oPelicula);
        bool Delete(int id);
        string GetNombre(int id);
    }
}
