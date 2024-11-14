using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Models.DTO
{
    public class UsuarioLogin
    {
        public UsuarioLogin(int idUsuario,string EMail,bool esAdministrador)
        {
            IdUsuario= idUsuario;
            this.EMail= EMail;
            //this.Contrasenia= contrasenia;
            this.esAdministrador= esAdministrador;
        }
        public int IdUsuario { get; set; }

        public string EMail { get; set; }

        public string Contrasenia { get; set; }

        private bool esAdministrador;

		public bool EsAdmin
		{
			get { return esAdministrador; }
			set { esAdministrador = value; }
		}

	}
}
