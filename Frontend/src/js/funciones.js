"use strict";

const cargarFunciones = async function () {
    const urlParams = new URLSearchParams(window.location.search);

    const idCartelera = urlParams.get('idCartelera');
    const idPelicula = urlParams.get('idPelicula');

    if (!idCartelera || !idPelicula){
        $(".funciones__titulo").textContent = "Proximas funciones"
    
            const fechaISO = new Date().toISOString();

            const reproducciones = await fetch(`http://localhost:5141/api/Reproduccion?fecha=${fechaISO}`)
            .then(response => response.json())

            const funcionesTarget = reproducciones.slice(0, 12)
    
            funcionesTarget.forEach(async funcion => {
                const peliResponse = await fetch(`http://localhost:5141/api/Pelicula/Nombre/${funcion.idPelicula}`);

                const peliData = await peliResponse.text();
                
                const link = document.createElement("a")
                link.href = window.location.origin+`/detalles-funcion.html?idSala=${funcion.numeroSala}&idReproduccion=${funcion.idReproduccion}`
                const ticket = document.createElement("div")
                ticket.classList.add("cardWrap")
                const fechaHora = funcion.horarioInicio.split("T")[1].split(":").slice(0, 2)
                const hora = `${fechaHora[0]}:${fechaHora[1]}`
                const fecha = funcion.horarioInicio.split("T")[0]
                ticket.innerHTML = `<div class="carta cardLeft">
                <h1>Cine <span>G1</span></h1>
                <div class="title">
                    <h2>${peliData}</h2>
                    <span>pelicula</span>
                </div>
                <div class="seat">
                    <h2>${funcion.numeroSala}</h2>
                    <span>sala</span>
                </div>
                <div class="time">
                    <h2>${hora}</h2>
                    <span>hora</span>
                </div>
                <div class="time">
                    <h2>${fecha}</h2>
                    <span>fecha</span>
                </div>
                </div>
                <div class="carta cardRight">
                    <div class="number">
                    <h3>${funcion.numeroSala}</h3>
                    <span>sala</span>
                    </div>
                </div>`

                link.appendChild(ticket)
                $(".contenedor__tickets").appendChild(link)
               
            });
        }

    
    const funciones= await fetch(`http://localhost:5141/api/Reproduccion/Cartelera?idCartelera=${idCartelera}&idPelicula=${idPelicula}`)
    .then(response => response.json());

    
    let funcionPrincipal = funciones[0]; 

   
    const peliResponse = await fetch(`http://localhost:5141/api/Pelicula/Nombre/${funcionPrincipal.idPelicula}`);

        const peliData = await peliResponse.text();

        $(".funciones__titulo").textContent = `Funciones para ${peliData} hasta fin de mes:`

        funciones.forEach(funcion => {
            const link = document.createElement("a")
            link.href = window.location.origin+`/detalles-funcion.html?idSala=${funcion.numeroSala}&idReproduccion=${funcion.idReproduccion}`
            const ticket = document.createElement("div")
            ticket.classList.add("cardWrap")
            const fechaHora = funcion.horarioInicio.split("T")[1].split(":").slice(0, 2)
            const hora = `${fechaHora[0]}:${fechaHora[1]}`
            const fecha = funcion.horarioInicio.split("T")[0]

            ticket.innerHTML = `<div class="carta cardLeft">
            <h1>Cine <span>G1</span></h1>
            <div class="title">
                <h2>${peliData}</h2>
                <span>pelicula</span>
            </div>
            <div class="seat">
                <h2>${funcion.numeroSala}</h2>
                <span>sala</span>
            </div>
            <div class="time">
                <h2>${hora}</h2>
                <span>time</span>
            </div>
            <div class="time">
                <h2>${fecha}</h2>
                <span>fecha</span>
            </div>
            </div>
            <div class="carta cardRight">
                <div class="number">
                <h3>${funcion.numeroSala}</h3>
                <span>sala</span>
                </div>
            </div>`

            link.appendChild(ticket)
            $(".contenedor__tickets").appendChild(link)
        });
    
    }

document.addEventListener("DOMContentLoaded", cargarFunciones)