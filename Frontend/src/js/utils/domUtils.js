const $ = element => document.querySelector(element)
const $$ = element => document.querySelectorAll(element)

function obtenerCookie(nombre) {
    let cookies = document.cookie.split(';');

    for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i].trim(); 
        
        if (cookie.startsWith(nombre + "=")) {
            return cookie.substring(nombre.length + 1); 
        }
    }
}


const CargarCombo= async function(select,tabla,columna) {
    
    //const select = document.querySelector("#nombreCategoria");
    const url = `http://localhost:5141/api/${tabla}`;

    fetch(url, {
    method: 'GET',
    })
    .then(res => res.json())
    .then(lista_de_categorias => {
    // alert('HAY ' + lista_de_categorias.length) Puedes poner este alert para ver si la llamada POST te devuelve algo

    for (let categoria of lista_de_categorias) {
      let nuevaOpcion = document.createElement("option");
      nuevaOpcion.value = Object.values(categoria)[0];
      nuevaOpcion.text = Object.values(categoria)[columna];
      select.add(nuevaOpcion);
      // select.appendChild(nuevaOpcion); <-- Así tambien funciona
    }
  })
  .catch(function(error) {
    console.error("¡Error!", error);
  })

}

