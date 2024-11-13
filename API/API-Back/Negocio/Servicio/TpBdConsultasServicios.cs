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

        public DataTable Consulta2(int duracion)
        {
            return consultasBD.Consulta2(duracion);
        }
    }
}
