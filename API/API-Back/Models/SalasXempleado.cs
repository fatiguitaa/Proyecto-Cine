﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace API_Back.Models;

public partial class SalasXempleado
{
    public int IdSalaXempleado { get; set; }

    public int NumeroSala { get; set; }

    public int IdEmpleado { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; }

    public virtual Sala NumeroSalaNavigation { get; set; }
}