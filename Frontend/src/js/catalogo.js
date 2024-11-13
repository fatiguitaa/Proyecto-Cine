"use strict";

const cargarPeliculas = async function () {
    return fetch("http://localhost:5141/api/pelicula")
    .then(response => response.json())
    .then(peliculas => {
        if ($(".previsualizacion")) {
            for (let i = 0; i < 4; i++) {
                const peliculaCard = document.createElement("div")
                peliculaCard.classList.add("pelicula")
                peliculaCard.setAttribute("pelicula-id", peliculas[i].idPelicula)
    
                peliculaCard.innerHTML = `
                    <img src="${peliculas[i].urlPortada}" class="pelicula__imagen">
                    <div class="pelicula__info">
                        <p class="pelicula__titulo">${peliculas[i].nombre}</p>
                        <p class="pelicula__descripcion">${peliculas[i].sinopsis}</p>
                    </div>`
    
                $(".previsualizacion__peliculas").appendChild(peliculaCard)
            }
        }
        else if(".catalogo") {
            peliculas.forEach(pelicula => {
                const peliculaCard = document.createElement("div")
                peliculaCard.classList.add("pelicula")
                peliculaCard.setAttribute("pelicula-id", pelicula.idPelicula)
    
                peliculaCard.innerHTML = `
                    <img src="${pelicula.urlPortada}" class="pelicula__imagen">
                    <div class="pelicula__info">
                        <p class="pelicula__titulo">${pelicula.nombre}</p>
                        <p class="pelicula__descripcion">${pelicula.sinopsis}</p>
                    </div>`
    
                $(".catalogo__peliculas").appendChild(peliculaCard)
            });
        }
        
    })
}

document.addEventListener("DOMContentLoaded", cargarPeliculas)