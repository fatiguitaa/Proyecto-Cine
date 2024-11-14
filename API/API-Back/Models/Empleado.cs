﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace API_Back.Models;

public partial class Empleado
{
    public int IdEmpleado { get; set; }

    public string Nombre { get; set; }

    public string Apellido { get; set; }

    public string Telefono { get; set; }

    public int IdArea { get; set; }

    public int? IdUsuario { get; set; }

    public DateOnly? FechaNac { get; set; }

    public virtual Area IdAreaNavigation { get; set; }

    public virtual Usuario IdUsuarioNavigation { get; set; }

    public virtual ICollection<SalasXempleado> SalasXempleados { get; set; } = new List<SalasXempleado>();
}