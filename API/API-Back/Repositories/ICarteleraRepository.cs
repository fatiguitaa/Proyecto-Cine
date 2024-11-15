using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public interface ICarteleraRepository
    {
        List<Cartelera> GetAllByFecha(DateTime Fecha);

        bool SacarPelicula(int IdCartelera, int IdPelicula);
        bool AgregarPelicula (int IdCartelera,int Pelicula);
    }
}
