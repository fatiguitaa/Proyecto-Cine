var CantidadDetalles = 0;

const cargarAsientos = async function () {
    const urlParams = new URLSearchParams(window.location.search);

    const idSala = urlParams.get('idSala');
    const idReproduccion = urlParams.get('idReproduccion');

    if (!idSala || !idReproduccion) {
        window.location.href = "http://localhost:5500/funciones.html"
        return
    }
    const matrizAsientos = await fetch(`http://localhost:5141/api/Sala?idSala=${idSala}&idReproduccion=${idReproduccion}`)
    .then (response => response.json())
    
    for (let fila of matrizAsientos) {
        const filaAsientos = document.createElement("div")
        for (let columna of fila) { 
            const asiento = document.createElement("input")

            // asiento.setAttribute("name")
            asiento.type = "checkbox"
            asiento.setAttribute("NombreAsiento",columna.nombre)
            asiento.name = columna.id
            asiento.checked = columna.ocupado
            if (columna.ocupado)
            {
                asiento.disabled=true
            }
            else
            {
                const TextoLista = document.createElement("ul")
                TextoLista.innerHTML = "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check2' viewBox='0 0 16 16'><path d='M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0'/></svg>"+asiento.getAttribute("NombreAsiento")
                TextoLista.id="TxT-"+asiento.name
                asiento.appendChild(TextoLista)
                asiento.addEventListener('change',(event)=>
                {
                    if(event.currentTarget.checked)
                    {
                        $("#Lista-Detalles").appendChild(event.currentTarget.firstChild)
                        CantidadDetalles++
                    }
                    else
                    {
                        event.currentTarget.appendChild($("#TxT-"+event.currentTarget.name))
                        CantidadDetalles--
                    }
                    $("#Cantidad-Detalles").textContent="Cantidad de Asientos: x"+CantidadDetalles
                    $("#Total-Detalles").textContent="= $"+CantidadDetalles*2000//aca iria algo para buscar el precio de la entrada
                })
            }

            filaAsientos.appendChild(asiento)
        }

        document.getElementById("Tabla-Asientos").appendChild(filaAsientos)
    }
}

document.addEventListener("DOMContentLoaded", cargarAsientos)

