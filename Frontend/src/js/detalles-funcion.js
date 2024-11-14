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
            asiento.textContent = columna.name
            asiento.name = columna.id
            asiento.checked = columna.ocupado
            if (columna.ocupado)
            {
                asiento.disabled=true
            }
            else
            {
                const TextoLista = document.createElement("span")
                TextoLista.textContent=asiento.name
                TextoLista.id="TxT-"+asiento.name
                asiento.appendChild(TextoLista)
                asiento.addEventListener('change',(event)=>
                {
                    if(event.currentTarget.checked)
                    {
                        $("#B").appendChild(event.currentTarget.firstChild)
                    }
                    else
                    {
                        event.currentTarget.appendChild($("#TxT-"+event.currentTarget.name))
                    }
                })
            }

            filaAsientos.appendChild(asiento)
        }

        document.getElementById("A").appendChild(filaAsientos)
    }
}

document.addEventListener("DOMContentLoaded", cargarAsientos)

