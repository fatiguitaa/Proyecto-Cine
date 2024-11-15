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
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {

                    Factura oFactura = new Factura(Fecha, IdCliente);

                    _context.Facturas.Add(oFactura);
                    _context.SaveChanges();

                    foreach (DetalleFactura oDetalle in Detalles)
                    {
                        oDetalle.IdFactura = oFactura.IdFactura;
                        oFactura.DetalleFacturas.Add(oDetalle);
                        _context.DetalleFacturas.Add(oDetalle);
                    }
                    _context.SaveChanges();
                    transaction.Commit();
                    return true;
                }
                catch
                {
                    transaction.Rollback();
                    return false;
                }
            }
        }
    }
}
