



let data;
const Factura = async () => {
    console.log('porno')
const url= window.location.href
const params = new URL(url).searchParams
const numbersList = Array.from(params.keys()).map(Number)
numbersList.splice(0,4)
console.log(numbersList)
const _precio = params.get("precio")
const _idReproduccion = params.get("idReproduccion")
const _idpromocion = params.get("idPromocion")
const _idCliente = params.get("idcliente")
const dataTable = document.getElementById('dataTable');
const thead = dataTable.querySelector('thead');
const tableBody = dataTable.querySelector('tbody');
let oDetalle;
var ListaDetalles=[]
let total=0
numbersList.forEach(_IdAsiento =>
{
     oDetalle={IdAsiento : _IdAsiento,precio : _precio,idReproduccion : _idReproduccion,idPromocion:_idpromocion}
    ListaDetalles.push(oDetalle)
    console.log(oDetalle)
    total+=parseInt(_precio)
 
});
console.log('el total es', total)
console.log(_idCliente)
console.log(ListaDetalles)
const fechaFormateada = new Date().toISOString();
console.log(fechaFormateada);


const reproduccionesPromises = ListaDetalles.map(async (item) => {
    const response = await fetch(`http://localhost:5141/api/Reproduccion/Nombre/${item.idReproduccion}`);
    if (!response.ok) {
        throw new Error('Error al obtener los datos de la reproducción');
    }
    const reproduccionData = await response.text();
    item.reproduccion = reproduccionData; 
});

await Promise.all(reproduccionesPromises);
const AsientosPromises = ListaDetalles.map(async (item) => {
    const response = await fetch(`https://localhost:5141/api/Asiento/Nombre/${item.IdAsiento}`);
    if (!response.ok) {
        throw new Error('Error al obtener los datos de la reproducción');
    }
    const asientoData = await response.text();
    item.asiento = asientoData; 
});
await Promise.all(AsientosPromises);

         
            const table = document.createElement('tr');
            table.innerHTML = `
                
               
                <th>idAsiento</th>   
                <th>Reproduccion</th>
                <th>Precio</th>
                <th>Total</th>
             
               
              
            `;
            thead.appendChild(table);
           
            let bandera=true;
            let bandera2=true;
            ListaDetalles.forEach(item => {
            const row = document.createElement('tr');
            row.innerHTML += `
                
                
                <td>${item.asiento}</td>`
                if (bandera)
                    {
                        
                        row.innerHTML+=`<td rowspan= '`+ListaDetalles.length+`'>${item.reproduccion}</td>`;
                        bandera=false;
                    }
                
               row.innerHTML+=`<td>${item.precio}</td>
               `
                if (bandera2)
                    {
                        
                        row.innerHTML+=`<td rowspan= '`+ListaDetalles.length+`'>${total}</td>`
                        bandera2=false;
                    }
               
              `
                
               
                
            `;
            
            console.log(row)
            tableBody.appendChild(row);
        });

        
        dataTable.style.display = 'table';

        document.getElementById("botonFactura")?.addEventListener("click", async () => {
                    
        
        const response = await fetch(`http://localhost:5141/api/Factura?Fecha=${fechaFormateada}&IdCliente=${_idCliente}`,{
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(ListaDetalles)
            });
        
            if (!response.ok)
                {
                 throw new Error('Error al obtener los datos');
                }
        
                data = await response.json();
                alert("Compra Realizada con Exito");
            window.history.back();
                console.log('pija')
            });
            

        }
        Factura();