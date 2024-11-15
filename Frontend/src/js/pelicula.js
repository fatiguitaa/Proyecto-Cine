const cargarPelicula = async function () {
    const urlParams = new URLSearchParams(window.location.search);

    const id = urlParams.get('id');
    
    return fetch(`http://localhost:5141/api/Pelicula/${id}`)
    .then(response => response.json())
    .then(pelicula => {
        $(".titulo").textContent = pelicula.nombre
        $(".imagen").src = pelicula.urlPortada
        $(".descripcion").textContent = pelicula.sinopsis
        $(".duracion").textContent = "Duracion: "+pelicula.duracionMinutos+" Minutos"
        $(".fecha").textContent = "Fecha de estreno: "+pelicula.fechaEstreno
       let IdGenero = pelicula.idGenero
       return fetch(`http://localhost:5141/api/genero/${IdGenero}`)
       .then(response => response.json())
       .then(Genero => {
            $(".genero").textContent = Genero.nombre
       })
   
    })
}

document.addEventListener("DOMContentLoaded", cargarPelicula)