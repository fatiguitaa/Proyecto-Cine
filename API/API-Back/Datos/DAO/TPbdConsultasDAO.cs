using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Datos.DAO
{
    internal class TPbdConsultasDAO
    {
        public DataTable Consulta2(int valor)
        {
            DataTable dt = new DataTable();
            List<ParametroSQL> listaParametros = new List<ParametroSQL>();
            listaParametros.Add(new ParametroSQL("@duracion", valor));
            dt = DataHelper.GetInstance().ExecuteSPQuery("dbo.consulta2",listaParametros);
            
            return dt;
        }


        
    }
}
