const cargarPelicula = async function () {
    const urlParams = new URLSearchParams(window.location.search);

    const id = urlParams.get('id');
    
    return fetch(`http://localhost:5141/api/Pelicula/${id}`)
    .then(response => response.json())
    .then(pelicula => {

        // document.body.style.backgroundImage = `url(${pelicula.urlPortada})`
        
        
        $(".pelicula__titulo").textContent = pelicula.nombre
        $(".pelicula__imagen").src = pelicula.urlPortada
        $(".movie-description").textContent = pelicula.sinopsis
        $(".pelicula__duracion").textContent = pelicula.duracionMinutos + " min / "
        $(".pelicula__fecha").textContent = pelicula.fechaEstreno
       let IdGenero = pelicula.idGenero
       return fetch(`http://localhost:5141/api/genero/${IdGenero}`)
       .then(response => response.json())
       .then(genero => {
            $(".pelicula__genero").textContent = genero.nombre + " / "
       })
   
    })
}

document.addEventListener("DOMContentLoaded", cargarPelicula)