"use strict";

const cargarCarteleras = async function () {
    const fechaISO = new Date().toISOString();
    
    const cartelerasTarget = await fetch(`http://localhost:5141/api/Cartelera/${fechaISO}`)
    .then(response => response.json())
    .then(carteleras => carteleras.slice(0, 3));

    const peliculasPromises = cartelerasTarget.map(cartelera =>
        fetch(`http://localhost:5141/api/Pelicula/Cartelera/${cartelera.idCartelera}`)
            .then(response => response.json())
            .then(peliculas => ({idCartelera: cartelera.idCartelera, fechas:{
                fechaInicio: cartelera.fechaInicio.split("T")[0],
                fechaFin: cartelera.fechaFin.split("T")[0]
            }, peliculas})));

    const peliculasCarteleras = await Promise.all(peliculasPromises);

    peliculasCarteleras.forEach(({idCartelera, fechas, peliculas}) => {
        const carteleraActual = document.createElement("div")
        carteleraActual.classList.add("cartelera")

        const contenedorFechas = document.createElement("div")

        const fechaInicio = document.createElement("h2")
        fechaInicio.classList.add("cartelera__fechas")
        fechaInicio.textContent = `Desde ${fechas.fechaInicio}`

        const fechaFin = document.createElement("h2")
        fechaFin.classList.add("cartelera__fechas")
        fechaFin.textContent = `Hasta ${fechas.fechaFin}`
        contenedorFechas.appendChild(fechaInicio)
        contenedorFechas.appendChild(fechaFin)
        carteleraActual.appendChild(contenedorFechas)

        peliculas.forEach(pelicula => {
            const peliculaContainer = document.createElement("div")
            peliculaContainer.classList.add("pelicula__container")

            const peliculaCard = document.createElement("a")

            peliculaCard.href = `./pelicula.html?id=${pelicula.idPelicula}`
            peliculaCard.classList.add("pelicula")
            
            peliculaCard.innerHTML = `
            <img src="${pelicula.urlPortada}" loading="lazy" class="pelicula__imagen">
            <div class="pelicula__info">
                <p class="pelicula__titulo">${pelicula.nombre}</p>
                <p class="pelicula__descripcion">${pelicula.sinopsis}</p>
            </div>`

            const botonVerFunciones = document.createElement("a")
            botonVerFunciones.href = window.location.origin+`/funciones.html?idCartelera=${idCartelera}&idPelicula=${pelicula.idPelicula}`
            botonVerFunciones.innerHTML = "<button class=\"pelicula__container__ver boton\">Ver funciones</button>"

            peliculaContainer.appendChild(peliculaCard)
            peliculaContainer.appendChild(botonVerFunciones)

            carteleraActual.appendChild(peliculaContainer)
        })

        $(".carteleras").appendChild(carteleraActual)
    })
}

document.addEventListener("DOMContentLoaded", cargarCarteleras)
