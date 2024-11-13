using API_Back.Models;
using API_Back.Models.DTO;
using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_Back.Repositories
{
    public class SalaRepository : ISalaRepository
    {
        private CineDBContext _context;
        public SalaRepository(CineDBContext context)
        {
            _context = context;
        }
        public AsientoSala[][] LLamarAsientos(int idSala, int idReproduccion)
        {
            int Y = _context.Filas.Where(F => F.NumeroSala == idSala).Count();
            var X = _context.Filas
                .Where(F => F.NumeroSala == idSala)
                .Select(F => new
                {
                    TotalAsientos = F.Asientos.Count()
                })
                .OrderByDescending(F => F.TotalAsientos)
                .FirstOrDefault();
            AsientoSala[][] Array = new AsientoSala[Y][];
            List<Fila> ListaFilas = _context
                            .Filas
                            .Where(F => F.NumeroSala == idSala)
                            .ToList();
            for (int i = 0; i < Array.Length; i++)
            {
                
                List<int> IDs = new List<int>();
                IDs.AddRange(_context.Asientos
                    .Where(A => A.IdFila == ListaFilas[i].IdFila)
                    .ToList()
                .Select(A => A.IdAsiento));
                
                List<int> Ocupados = new List<int>();
                Ocupados.AddRange(_context.AsientosXreproducciones
                    .Where(AXR => AXR.IdReproduccion == idReproduccion && IDs.Contains(AXR.IdAsiento) && AXR.Libre == false)
                    .ToList().Select(O => O.IdAsiento));
                List<AsientoSala> ListaAsientos = new List<AsientoSala>();
                int CantAsientos = 0;
                foreach(int A in IDs)
                {
                    CantAsientos++;
                    char Letra;
                    Letra =(char)('A' + i);

                    AsientoSala Asiento = new AsientoSala() { Id = A, Nombre= Letra.ToString()+CantAsientos };
                    
                    
                    if (Ocupados.Contains(A))
                    {
                        Asiento.Ocupado = true;
                    }
                    ListaAsientos.Add(Asiento);
                }
                Array[i] = ListaAsientos.ToArray();
            }
            return Array;
        }
    }
}
