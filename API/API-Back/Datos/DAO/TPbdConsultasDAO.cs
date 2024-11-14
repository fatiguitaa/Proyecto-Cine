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
        public DataTable Consulta1(DateOnly fechaInicio,DateOnly fechaFin)
        {
            DataTable dt=new   DataTable();
            List<ParametroSQL> listaParametros = new List<ParametroSQL>();
            listaParametros.Add(new ParametroSQL("@fechaInicio", fechaInicio));
            listaParametros.Add(new ParametroSQL("@fechaFin", fechaFin));
            dt = DataHelper.GetInstance().ExecuteSPQuery("consulta1", listaParametros);
            return dt;
        }

        public DataTable Consulta2(int valor)
        {
            DataTable dt = new DataTable();
            List<ParametroSQL> listaParametros = new List<ParametroSQL>();
            listaParametros.Add(new ParametroSQL("@duracion", valor));
            dt = DataHelper.GetInstance().ExecuteSPQuery("dbo.consulta2",listaParametros);
            return dt;
        }

        public DataTable Consulta3(int idPelicula, bool asientosLibres)
        {
            DataTable dt = new DataTable();
            List<ParametroSQL> listaParametros = new List<ParametroSQL>();
            listaParametros.Add(new ParametroSQL("@idPelicula", idPelicula));
            listaParametros.Add(new ParametroSQL("@asientoLibre", asientosLibres));
            dt = DataHelper.GetInstance().ExecuteSPQuery("dbo.consulta3", listaParametros);
            return dt;
        }
        
        public DataTable Consulta4(int idSala)
        {
            DataTable dt = new DataTable();
            List<ParametroSQL> listaParametros = new List<ParametroSQL>();
            listaParametros.Add(new ParametroSQL("@idsala", idSala));
            dt = DataHelper.GetInstance().ExecuteSPQuery("dbo.consulta4", listaParametros);
            return dt;
        }

        public DataTable Consulta5(decimal montoMinimo)
        {
            DataTable dt = new DataTable();
            List<ParametroSQL> listaParametros = new List<ParametroSQL>();
            listaParametros.Add(new ParametroSQL("@montoMinimo", montoMinimo));
            dt = DataHelper.GetInstance().ExecuteSPQuery("dbo.consulta5", listaParametros);
            return dt;
        }
    }
}
