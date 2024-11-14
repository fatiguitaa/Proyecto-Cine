var CantidadDetalles = 0;

const cargarAsientos = async function () {
    const urlParams = new URLSearchParams(window.location.search);

    const idSala = urlParams.get('idSala');
    const idReproduccion = urlParams.get('idReproduccion');
    $("#InputCliente").Value=idReproduccion

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
            asiento.classList.add("Asiento")
            asiento.setAttribute("NombreAsiento",columna.nombre)
            asiento.name = columna.id
            asiento.checked = columna.ocupado

            

            
            
              
            
                const label = document.createElement("label")
                label.classList.add('d-flex','flex-column')
                label.appendChild(asiento)
                label.appendChild(document.createTextNode(columna.nombre));
                label.id="TxT-"+asiento.name
                filaAsientos.appendChild(label);
                
                const Icono= document.createElement("label")
                Icono.innerHTML="<svg version='1.2' class='AsientoIcono AsientoIconoLibre' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 188 151' width='188' height='151' style='transform: rotate(180deg);'> <title>New Project</title><style>.s0 { fill: #cdcdcd } .s1 { fill: #ffffff } </style><path id='Shape 2' class='s0' d='m49 5.3h90c9.9 0 18 8.1 18 18v88.4h-126v-88.4c0-9.9 8.1-18 18-18z'/>      <path id='Shape 1' class='s1' d='m28.5 109.5h131c11.3 0 20.5 9.2 20.5 20.5 0 11.3-9.2 20.5-20.5 20.5h-131c-11.3 0-20.5-9.2-20.5-20.5 0-11.3 9.2-20.5 20.5-20.5z'/>      <path id='Shape 3' class='s1' d='m16.5 2c8.6 0 15.5 6.9 15.5 15.5v77c0 8.6-6.9 15.5-15.5 15.5-8.6 0-15.5-6.9-15.5-15.5v-77c0-8.6 6.9-15.5 15.5-15.5zm0 0c8.6 0 15.5 6.9 15.5 15.5v77c0 8.6-6.9 15.5-15.5 15.5-8.6 0-15.5-6.9-15.5-15.5v-77c0-8.6 6.9-15.5 15.5-15.5z'/>      <path id='Shape 3 copy' class='s1' d='m171.5 2c8.6 0 15.5 6.9 15.5 15.5v77c0 8.6-6.9 15.5-15.5 15.5-8.6 0-15.5-6.9-15.5-15.5v-77c0-8.6 6.9-15.5 15.5-15.5zm0 0c8.6 0 15.5 6.9 15.5 15.5v77c0 8.6-6.9 15.5-15.5 15.5-8.6 0-15.5-6.9-15.5-15.5v-77c0-8.6 6.9-15.5 15.5-15.5z'/></svg>"
                label.appendChild(Icono)
                label.setAttribute("for",asiento.name)

                if (columna.ocupado)
                    {
                        asiento.disabled=true
                        Icono.childNodes[0].classList.add("AsientoIconoOcupado")
                    }

                asiento.addEventListener('change',(event)=>
                {
                    
                    if(event.currentTarget.checked)
                    {
                       // $("#Lista-Detalles").appendChild(event.currentTarget.firstChild)
                        CantidadDetalles++
                        event.currentTarget.parentElement.childNodes[2].childNodes[0].classList.add("AsientoIconoSeleccionado")
                        event.currentTarget.parentElement.childNodes[2].childNodes[0].classList.remove("AsientoIconoLibre")
                    }
                    else
                    {
                       // event.currentTarget.appendChild($("#TxT-"+event.currentTarget.name))
                        CantidadDetalles--
                        event.currentTarget.parentElement.childNodes[2].childNodes[0].classList.remove("AsientoIconoSeleccionado")
                        event.currentTarget.parentElement.childNodes[2].childNodes[0].classList.add("AsientoIconoLibre")
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