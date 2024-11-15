"use strict";

const cargarFunciones = async function () {
    const urlParams = new URLSearchParams(window.location.search);

    const idCartelera = urlParams.get('idCartelera');
    const idPelicula = urlParams.get('idPelicula');

    if (!idCartelera || !idPelicula){
        const fechaISO = new Date().toISOString();

        return await fetch(`http://localhost:5141/api/Reproduccion?fecha=${fechaISO}`)
        .then(response => response.json())
        .then(funciones => {
            $("h1").textContent = "Proximas funciones"
            const funcionesTarget = funciones.slice(0, 11)
    
            funcionesTarget.forEach(funcion => {
                const horario = document.createElement("a")
                horario.href = window.location.origin+`/detalles-funcion.html?idSala=${funcion.numeroSala}&idReproduccion=${funcion.idReproduccion}`
                horario.textContent = funcion.horarioInicio
                document.body.appendChild(horario)
            });
        })
    }
    
    const funciones= await fetch(`http://localhost:5141/api/Reproduccion/Cartelera?idCartelera=${idCartelera}&idPelicula=${idPelicula}`)
    .then(response => response.json());

    
    let funcionPrincipal = funciones[0]; 

   
    const peliResponse = await fetch(`http://localhost:5141/api/Pelicula/Nombre/${funcionPrincipal.idPelicula}`);
    if (!peliResponse.ok) {
        throw new Error('Error al obtener los datos de la reproducción');
    }
    const peliData = await peliResponse.text();

        $("h1").textContent = `Funciones para : "${peliData}" hasta fin de mes:`

        funciones.forEach(funcion => {
            console.log(funcion)
            
            const horario = document.createElement("a")
            horario.href = window.location.origin+`/detalles-funcion.html?idSala=${funcion.numeroSala}&idReproduccion=${funcion.idReproduccion}`
            horario.style.display = "block"
            horario.innerHTML = `${funcion.horarioInicio}  Sala  ${funcion.numeroSala}`
            document.body.appendChild(horario)
        });
    
}

document.addEventListener("DOMContentLoaded", cargarFunciones)