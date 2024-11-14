using API_Back.Datos.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Negocio.Servicio
{
    public class TpBdConsultasServicios
    {
        TPbdConsultasDAO consultasBD=new TPbdConsultasDAO();

        public DataTable Consulta1(DateOnly fechaInicio,DateOnly fechaFin)
        {
            return consultasBD.Consulta1(fechaInicio, fechaFin);
        }

        public DataTable Consulta2(int duracion)
        {
            return consultasBD.Consulta2(duracion);
        }

        public DataTable Consulta3(int idPelicula, bool asientosLibres)
        {
            return consultasBD.Consulta3(idPelicula, asientosLibres);
        }

        public DataTable Consulta4(int idSala)
        {
            return consultasBD.Consulta4(idSala);
        }

        public DataTable Consulta5(decimal montoMinimo)
        {
            return consultasBD.Consulta5(montoMinimo);
        }
    }
}
