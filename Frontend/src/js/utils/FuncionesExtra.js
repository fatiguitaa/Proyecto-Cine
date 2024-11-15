console.log("pene")
const CargarCombo= async function(select,tabla,columna) {

    console.log(select)
    console.log(tabla)
    
    //const select = document.querySelector("#nombreCategoria");
    const url = `http://localhost:5141/api/${tabla}`;

    fetch(url, {
    method: 'GET',
    })
    .then(res => res.json())
    .then(lista_de_categorias => {
    console.log("Las categorías son:", lista_de_categorias);
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
