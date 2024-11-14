"use strict";

document.addEventListener("DOMContentLoaded", function () {
    const select = document.getElementById('consultaSelect');
    const contentDiv = document.getElementById('content');
    const inputConsulta = document.getElementById('input');
    const fechaini = document.getElementById('fechaini');
    const fechafin = document.getElementById('fechafin');
    const boolConsulta = document.querySelector('.radiobtn');
    const error = document.getElementById('error');
    const consultaParrafo = document.getElementById('consultaParrafo');
    const accionBtn = document.getElementById('accionBtn');
    const dataTable = document.getElementById('dataTable');
    const thead = dataTable.querySelector('thead');
    const tableBody = dataTable.querySelector('tbody');
    const label1 = document.querySelector('#labelinp1');
    const label2 = document.querySelector('#labelinp2');
    const label3 = document.querySelector('#labelinp3');
    let value;
    function desmarcarRadios() {
       
        const radio = document.getElementById('ocupado');    
        const radio2 = document.getElementById('libre');           
         radio.checked = false;
         radio2.checked = true;
    }

    function verificarEstado() {
        // Obtener el radio button de "Ocupado" y "Libre"
        let ocupado = document.getElementById('ocupado');
        let libre = document.getElementById('libre');
            
         value = ocupado.checked ? false : libre.checked ? true : false;

       
    }
    select.addEventListener('change', function mostrarContenido() {
       
        
        if (select.value) 
            {
           
       
            tableBody.innerHTML = '';
            
            dataTable.style.display = 'none';
             if (select.value ==1 )
                {
                   
                    consultaParrafo.textContent = 'Mostrar el total de ventas de las películas desde una fecha “a” hasta una fecha “b”';
                    contentDiv.style.display = 'block';
                    boolConsulta.style.display = 'none';
                    inputConsulta.style.display = 'none';
                    label1.style.display = 'block';
                    label2.style.display = 'block';
                    label3.style.display = 'none';
                    label1.textContent='Fecha de Inicio:';
                    label2.textContent='Fecha de Fin:';
                    fechaini.style.display = 'block';
                    fechafin.style.display = 'block';
                    
                }

            else if (select.value ==2 )
                {
                    
                    consultaParrafo.textContent = 'Mostrar Datos y monto total generado de aquellas peliculas cuya duracion sea mayor a los minutos seleccionados a continuacion:';
                        contentDiv.style.display = 'block';
                        label1.style.display = 'none';
                        label2.style.display = 'block';
                        label2.textContent='Duracion:';
                        label3.style.display = 'none';
                        inputConsulta.style.display = 'block'; 
                        boolConsulta.style.display = 'none';
                        fechaini.style.display = 'none';
                        fechafin.style.display = 'none';
                        inputConsulta.placeholder="0";
                 }

            else if (select.value ==3 )
            {
                
                consultaParrafo.textContent = 'Obtener la funcion que tiene el mayor número de asientos en un estado determinado para una pelicula específica:';
                contentDiv.style.display = 'block';
                label1.style.display = 'none';
                label2.style.display = 'block';
                label3.style.display = 'block';
                label2.textContent='ID de la Pelicula:';
                label3.textContent='Asientos:';
                inputConsulta.style.display = 'block'; 
                boolConsulta.style.display = 'flex';
                
                fechaini.style.display = 'none';
                fechafin.style.display = 'none';
                inputConsulta.placeholder="0";
               
                
            }
            else if (select.value ==4 )
            {
                
                consultaParrafo.textContent = 'Muestra la cantidad de usos de los asientos en una sala especifica y su porcentaje respecto a los demas asientos de la misma:';
                contentDiv.style.display = 'block';              
                boolConsulta.style.display = 'none';
                label1.style.display = 'none';
                label3.style.display = 'none';
                label2.style.display = 'block';
                label2.textContent='Numero de Sala:';
                inputConsulta.style.display = 'block';
                inputConsulta.placeholder="0"; 
                fechaini.style.display = 'none';
                fechafin.style.display = 'none';
               
                
            }
            else if (select.value ==5 )
            {
                
                consultaParrafo.textContent = 'Busca las películas que han sido proyectadas en varios idiomas, la cantidad de reproducciones y el total facturado por película en cada idioma (solo las películas que han generado más de una cierta cantidad de ingresos en total):';
                contentDiv.style.display = 'block';
                label1.style.display = 'none';
                label2.style.display = 'block';
                label3.style.display = 'none';
               
                label2.textContent='Monto Minimo:';
                inputConsulta.style.display = 'block'; 
                inputConsulta.placeholder="$0.00";
                boolConsulta.style.display = 'none';
                fechaini.style.display = 'none';
                fechafin.style.display = 'none';
                  
            }
            inputConsulta.value = '';
            fechaini.value = '';
            fechafin.value = '';
            desmarcarRadios();
            error.textContent='';
            scroll(100)
           
        } else {
            contentDiv.style.display = 'none';
        }
    });

    function scroll(a) {
        window.scrollBy({ top: a, // Ajusta el valor según cuánto quieras mover la página hacia abajo 
            left: 0, behavior: 'smooth' // Desplazamiento suave 
            }); 
        
    }
    accionBtn.addEventListener('click', async function accionBoton() {
        const queryValue = select.value;  
       error.textContent='';
       verificarEstado();
     
        if (!queryValue) {
           
            return;
        }

        try {
           let data, response;
            if (queryValue==2)
            {
                
                if (inputConsulta.value>=0)
                {

                
                    response = await fetch(`https://localhost:7220/api/TpBd/consulta2?duracionMin=${inputConsulta.value}`);
            
                if (!response.ok) {
                    throw new Error('Error al obtener los datos');
                }
    
                 data = await response.json();
                 
                tableBody.innerHTML = '';
                thead.innerHTML = '';
    
                if (thead && thead.children.length === 0)
                    {   
                    const table = document.createElement('tr');
                    table.innerHTML = `
                        <th>idPelicula</th>
                        <th>nombre</th>
                        <th>fechaEstreno</th>
                        <th>duracionMinutos</th>
                        <th>sinopsis</th>
                        <th>Genero</th>
                        <th>MontoGenerado</th>
                    `;
                    thead.appendChild(table);}
                    data.forEach(item => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${item.idPelicula}</td>
                        <td>${item.nombre}</td>
                        <td>${item.fechaEstreno}</td>
                        <td>${item.duracionMinutos}</td>
                        <td>${item.sinopsis}</td>
                        <td>${item.Genero}</td>
                        <td>${item.MontoGenerado}</td>
                    `;
                    tableBody.appendChild(row);
                });
    
                
                dataTable.style.display = 'table';
            }
                else if (inputConsulta.value<0)
                {
                    
                    error.textContent = 'Debe ingresar un numero mayor a 0';  
                    error.display='block';
                    tableBody.innerHTML = '';
                    thead.innerHTML = ''; 
                    return
                }
                 
            }
            else if (queryValue==1)
            {
            if (fechafin.value > fechaini.value)
                {
                
                    response = await fetch(`https://localhost:7220/api/TpBd/consulta1?fechaInicio=${fechaini.value}&fehchaFin=${fechafin.value}`);
            
                if (!response.ok) {
                    throw new Error('Error al obtener los datos');
                }
    
                 data = await response.json();
                 
                tableBody.innerHTML = '';
                thead.innerHTML = '';
    
                    if (thead && thead.children.length === 0)
                    {
                    const table = document.createElement('tr');
                    table.innerHTML = `
                        <th>idPelicula</th>
                        <th>nombre</th>      
                        <th>IngresosTotales</th>
                        
                    `;
                    thead.appendChild(table);}
                    data.forEach(item => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${item.idPelicula}</td>
                        <td>${item.nombre}</td>
                        <td>${item.ingresosTotales}</td>
                       
                        
                    `;
                    tableBody.appendChild(row);
                });
    
                
                dataTable.style.display = 'table';
            }
                else if (fechafin.value < fechaini.value)
                    {
                        
                    error.textContent = 'El rango de fechas no es valido';  
                    error.display='block';
                    tableBody.innerHTML = '';
                    thead.innerHTML = ''; 
                    return
                    }
               
            }
            
            else if (queryValue==3)
                {
                     response = await fetch(`https://localhost:7220/api/TpBd/consulta3?idPelicula=${inputConsulta.value}&asientosLibres=${value}`);
                    console.log('Valor de la consulta:', value);
                    if (!response.ok) {
                        throw new Error('Error al obtener los datos');
                    }
        
                     data = await response.json();
                     
                    tableBody.innerHTML = '';
                    thead.innerHTML = '';
        
                    if (thead && thead.children.length === 0)
                        {
                        const table = document.createElement('tr');
                        table.innerHTML = `
                            <th>idReproduccion</th>
                            <th>numeroSala</th>
                            <th>NombrePelicula</th>
                            <th>Idioma</th>
                            <th>horarioInicio</th>
                            <th>cantidadAsientos</th>
                            
                        `;
                        thead.appendChild(table);}
                        data.forEach(item => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <td>${item.idReproduccion}</td>
                            <td>${item.numeroSala}</td>
                            <td>${item.NombrePelicula}</td>
                            <td>${item.Idioma}</td>
                            <td>${item.horarioInicio}</td>
                            <td>${item.CantidadAsientos}</td>
                            
                        `;
                        tableBody.appendChild(row);
                    });
        
                    
                    dataTable.style.display = 'table';
                }
                else if (queryValue==4)
                    {
                        console.log('Valor de la consulta:', value);
                         response = await fetch(`https://localhost:7220/api/TpBd/consulta4?idSala=${inputConsulta.value}`);
                        
                        if (!response.ok) {
                            throw new Error('Error al obtener los datos');
                        }
            
                         data = await response.json();
                        console.log('Datos recibidos:', data);
                        tableBody.innerHTML = '';
                        thead.innerHTML = '';
            
                        if (thead && thead.children.length === 0)
                            {
                            const table = document.createElement('tr');
                            table.innerHTML = `
                                <th>Asiento</th>
                                <th>Usos</th>
                                <th>Porcentaje</th>
                               
                                
                            `;
                            thead.appendChild(table);}
                            data.forEach(item => {
                            const row = document.createElement('tr');
                            row.innerHTML = `
                                <td>${item.Asiento}</td>
                                <td>${item.Usos}</td>
                                <td>${item.Porcentaje}</td>
                            
                                
                            `;
                            tableBody.appendChild(row);
                        });
            
                        
                        dataTable.style.display = 'table';
                    }

                    else if (queryValue==5)
                        {
                            if (inputConsulta.value>=0)
                                {
                             response = await fetch(`https://localhost:7220/api/TpBd/Consulta5?montoMinimo=${inputConsulta.value}`);
                        
                            if (!response.ok) {
                                throw new Error('Error al obtener los datos');
                            }
                
                             data = await response.json();
                             
                            tableBody.innerHTML = '';
                            thead.innerHTML = '';
                
                            if (thead && thead.children.length === 0)
                                {   
                                const table = document.createElement('tr');
                                table.innerHTML = `
                                    <th>Pelicula</th>
                                    <th>Idioma</th>
                                    <th>TotalReproducciones</th>
                                   <th>IngresoIdioma</th>
                                   <th>IngresoTotal</th>
                                    
                                `;
                                thead.appendChild(table);}
                                data.forEach(item => {
                                const row = document.createElement('tr');
                                row.innerHTML = `
                                    <td>${item.Pelicula}</td>
                                    <td>${item.Idioma}</td>
                                    <td>${item.TotalReproducciones}</td>
                                    <td>${item.IngresoIdioma}</td>
                                    <td>${item.IngresoTotal}</td>
                                    
                                `;
                                tableBody.appendChild(row);
                            });
                
                            
                            dataTable.style.display = 'table';
                        }
                            else if (inputConsulta.value<0)
                                {
                                    
                                    error.textContent = 'Debe ingresar un numero mayor a 0';  
                                    error.display='block';
                                    tableBody.innerHTML = '';
                                    thead.innerHTML = ''; 
                                    return
                                }
                        }
                        console.log(data);
                         if (data.length === 0) {
                        
                            error.textContent = 'No se encontro ningun resultado';  
                            error.display='block';
                            tableBody.innerHTML = '';
                            thead.innerHTML = '';    
                        }
                        scroll(550)
        } catch (a) {
            console.error(a);
            
            error.textContent = 'No hay datos';  
            error.display='block';
            tableBody.innerHTML = '';
            thead.innerHTML = '';
            scroll(100)
            
        }
    });
});