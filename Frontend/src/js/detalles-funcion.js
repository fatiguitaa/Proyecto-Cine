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
        const contenedorFila= document.createElement("div")
        contenedorFila.classList.add("justify-self")
        const filaAsientos = document.createElement("div")
        filaAsientos.classList.add('d-flex')
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
              
            
                const label = document.createElement("label")
                label.classList.add('d-flex','flex-column')
                label.appendChild(asiento)
                label.appendChild(document.createTextNode(columna.nombre));
                label.id="TxT-"+asiento.name
                filaAsientos.appendChild(label);
                
                asiento.addEventListener('change',(event)=>
                {
                    console.log(CantidadDetalles)
                    if(event.currentTarget.checked)
                    {
                       // $("#Lista-Detalles").appendChild(event.currentTarget.firstChild)
                        CantidadDetalles++

                    }
                    else
                    {
                       // event.currentTarget.appendChild($("#TxT-"+event.currentTarget.name))
                        CantidadDetalles--
                    }
                    $("#Cantidad-Detalles").textContent="Cantidad de Asientos: x"+CantidadDetalles
                    $("#Total-Detalles").textContent="= $"+CantidadDetalles*2000//aca iria algo para buscar el precio de la entrada
                })
            }

          
        

        document.getElementById("Tabla-Asientos").appendChild(contenedorFila)
        contenedorFila.appendChild(filaAsientos)
    }
}

document.addEventListener("DOMContentLoaded", cargarAsientos)