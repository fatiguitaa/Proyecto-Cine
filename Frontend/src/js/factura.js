const Factura = async () => {
const url= window.location.href
const params = new URL(url).searchParams
const numbersList = Array.from(params.keys()).map(Number)
numbersList.splice(0,4)
console.log(numbersList)
const _precio = params.get("precio")
const _idReproduccion = params.get("idReproduccion")
const _idpromocion = params.get("idPromocion")
const _idCliente = params.get("idcliente")

var ListaDetalles=[]

numbersList.forEach(_IdAsiento =>
{
    const oDetalle={IdAsiento : _IdAsiento,precio : _precio,idReproduccion : _idReproduccion,idPromocion:_idpromocion}
    ListaDetalles.push(oDetalle)
    console.log(oDetalle)
});

console.log(_idCliente)
console.log(ListaDetalles)
const fechaFormateada = new Date().toISOString();
console.log(fechaFormateada);

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

        }
        Factura()