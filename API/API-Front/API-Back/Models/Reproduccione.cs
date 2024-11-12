﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace API_Back.Models;

public partial class Reproduccione
{
    public int IdReproduccion { get; set; }

    public int NumeroSala { get; set; }

    public DateTime HorarioInicio { get; set; }

    public int IdPelicula { get; set; }

    public int IdIdioma { get; set; }

    public virtual ICollection<AsientosXreproduccione> AsientosXreproducciones { get; set; } = new List<AsientosXreproduccione>();

    public virtual ICollection<DetalleFactura> DetalleFacturas { get; set; } = new List<DetalleFactura>();

    public virtual Idioma IdIdiomaNavigation { get; set; }

    public virtual Pelicula IdPeliculaNavigation { get; set; }

    public virtual Sala NumeroSalaNavigation { get; set; }
}