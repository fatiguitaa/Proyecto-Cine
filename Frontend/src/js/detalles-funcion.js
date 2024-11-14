const cargarAsientos = async function () {
    const urlParams = new URLSearchParams(window.location.search);

    const idSala = urlParams.get('idSala');
    const idReproduccion = urlParams.get('idReproduccion');

    if (!idSala || !idReproduccion) {
        window.location.href = "http://localhost:5500/funciones.html"
        return
    }

    const matrizAsientos = await fetch(`http://localhost:5141/api/Sala?idSala=${idSala}&${idReproduccion}`)
    .then (response => response.json())
    
    for (let fila of matrizAsientos) {
        const filaAsientos = document.createElement("div")
        for (let columna of fila) {
            const asiento = document.createElement("input")

            // asiento.setAttribute("name")
            asiento.type = "checkbox"
            asiento.textContent = columna.nombre
            filaAsientos.appendChild(asiento)
        }

        document.body.appendChild(filaAsientos)
    }
}

document.addEventListener("DOMContentLoaded", cargarAsientos)