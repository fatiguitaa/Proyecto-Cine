﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace API_Back.Models;

public partial class TiposSala
{
    public int IdTipoSala { get; set; }

    public string Nombre { get; set; }

    public virtual ICollection<Sala> Salas { get; set; } = new List<Sala>();
}