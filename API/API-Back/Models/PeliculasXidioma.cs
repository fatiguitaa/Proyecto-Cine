﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace API_Back.Models;

public partial class PeliculasXidioma
{
    public int IdPeliculaXidioma { get; set; }

    public int IdPelicula { get; set; }

    public int IdIdioma { get; set; }

    public virtual Idioma IdIdiomaNavigation { get; set; }

    public virtual Pelicula IdPeliculaNavigation { get; set; }
}