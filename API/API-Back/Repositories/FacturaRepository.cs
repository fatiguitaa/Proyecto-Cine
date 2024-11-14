using API_Back.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class FacturaRepository : IFacturaRepository
    {
        private CineDBContext _context;
        public FacturaRepository(CineDBContext context)
        {
            _context = context;
        }
        public bool Create(DateTime Fecha,int IdCliente,List<DetalleFactura> Detalles)
        {
            Factura oFactura = new Factura(Fecha,IdCliente);
            foreach (DetalleFactura oDetalle in Detalles)
            {
                oFactura.DetalleFacturas.Add(oDetalle);
            }
            return _context.SaveChanges()>0;
            
        }
    }
}
