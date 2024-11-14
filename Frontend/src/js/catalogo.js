"use strict";

const cargarPeliculas = async function () {
    return fetch("http://localhost:5141/api/pelicula")
    .then(response => response.json())
    .then(peliculas => {
        peliculas.forEach(pelicula => {
            const peliculaCard = document.createElement("a")
            peliculaCard.href = `./pelicula.html?id=${pelicula.idPelicula}`
            peliculaCard.classList.add("pelicula")

            peliculaCard.innerHTML = `
            <img src="${pelicula.urlPortada}" loading="lazy" class="pelicula__imagen">
            <div class="pelicula__info">
                <p class="pelicula__titulo">${pelicula.nombre}</p>
                <p class="pelicula__descripcion">${pelicula.sinopsis}</p>
            </div>`

            $(".catalogo__peliculas").appendChild(peliculaCard)
        })
    })
}

document.addEventListener("DOMContentLoaded", cargarPeliculas)