﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace API_Back.Models;

public partial class DetalleFactura
{
    public int IdDetalleFacturas { get; set; }

    public int Precio { get; set; }

    public int IdFactura { get; set; }

    public int IdAsiento { get; set; }

    public int IdReproduccion { get; set; }

    public int IdPromocion { get; set; }

    public virtual Asiento IdAsientoNavigation { get; set; }

    public virtual Factura IdFacturaNavigation { get; set; }

    public virtual Promocione IdPromocionNavigation { get; set; }

    public virtual Reproduccione IdReproduccionNavigation { get; set; }
}