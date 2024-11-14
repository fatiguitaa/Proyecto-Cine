const cargarPelicula = async function () {
    const urlParams = new URLSearchParams(window.location.search);

    const id = urlParams.get('id'); 
    return fetch(`http://localhost:5141/api/Pelicula/${id}`)
    .then(response => response.json())
    .then(pelicula => {
        $(".titulo").textContent = pelicula.nombre
        $(".imagen").src = pelicula.urlPortada
        $(".descripcion").textContent = pelicula.sinopsis
    })
}

document.addEventListener("DOMContentLoaded", cargarPelicula)