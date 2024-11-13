using API_Back.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public interface ISalaRepository
    {
        AsientoSala[][] LLamarAsientos(int idSala, int idReproduccion);
    }
}
