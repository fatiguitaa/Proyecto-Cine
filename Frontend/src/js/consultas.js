

document.addEventListener("DOMContentLoaded", function () {
    const select = document.getElementById('consultaSelect');
    const contentDiv = document.getElementById('content');
    const inputConsulta = document.getElementById('input');
    const fechaini = document.getElementById('fechaini');
    const fechafin = document.getElementById('fechafin');
    const boolConsulta = document.getElementById('bool');
    const error = document.getElementById('error');
    const consultaParrafo = document.getElementById('consultaParrafo');
    const accionBtn = document.getElementById('accionBtn');
    const dataTable = document.getElementById('dataTable');
    const tableBody = dataTable.querySelector('tbody');
    const thead = dataTable.querySelector('thead');

   
    select.addEventListener('change', function mostrarContenido() {
       
        
        if (select.value) 
            {
           
       
            tableBody.innerHTML = '';
            
            dataTable.style.display = 'none';
             if (select.value ==1 )
                {
                   
                    consultaParrafo.textContent = 'Crear un procedimiento almacenado que muestre el total de ventas de las películas desde una fecha “a” hasta una fecha “b” . Y consultarlo:';
                    contentDiv.style.display = 'block';
                    boolConsulta.style.display = 'none';
                    inputConsulta.style.display = 'none';
                    fechaini.style.display = 'block';
                    fechafin.style.display = 'block';
                    
                }

            else if (select.value ==2 )
                {
                    
                    consultaParrafo.textContent = 'Mostrar Datos y monto total generado de aquellas peliculas cuya duracion sea mayor a los minutos seleccionados a continuacion:';
                        contentDiv.style.display = 'block';
                        inputConsulta.style.display = 'block'; 
                        boolConsulta.style.display = 'none';
                        fechaini.style.display = 'none';
                        fechafin.style.display = 'none';
                    
                 }

            else if (select.value ==3 )
            {
                
                consultaParrafo.textContent = 'Obtener la sala que tiene el mayor número de asientos libres para una reproducción específica:';
                contentDiv.style.display = 'block';
                inputConsulta.style.display = 'block'; 
                boolConsulta.style.display = 'block';
                fechaini.style.display = 'none';
                fechafin.style.display = 'none';
                
            }
            else if (select.value ==4 )
            {
                
                consultaParrafo.textContent = 'Muestra todos los empleados, encasillandolos en sí estuvieron alguna vez en una reproducción o no. Funciona por medio de una vista llamada "EmpleadosEnReproduccion”:';
                contentDiv.style.display = 'block';              
                boolConsulta.style.display = 'block';
                inputConsulta.style.display = 'none'; 
                fechaini.style.display = 'none';
                fechafin.style.display = 'none';
               
                
            }
            else if (select.value ==5 )
            {
                
                consultaParrafo.textContent = 'Busca las películas que han sido proyectadas en varios idiomas, la cantidad de reproducciones y el total facturado por película en cada idioma (solo las películas que han generado más de una cierta cantidad de ingresos en total):';
                contentDiv.style.display = 'block';
                inputConsulta.style.display = 'block'; 
                boolConsulta.style.display = 'none';
                fechaini.style.display = 'none';
                fechafin.style.display = 'none';
                  
            }
            inputConsulta.value = '';
            fechaini.value = '';
            fechafin.value = '';
            boolConsulta.checked = false;
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
    accionBtn.addEventListener('click', async function accionBoton () {
        const queryValue = select.value;  
       
        let value = boolConsulta.checked ? "true" : "false";
        if (!queryValue) {
           
            return;
        }

        try {
            if (queryValue==2)
            {
                const response = await fetch(`https://localhost:7220/api/TpBd/consulta2?duracionMin=${inputConsulta.value}`);
            
                if (!response.ok) {
                    throw new Error('Error al obtener los datos');
                }
    
                const data = await response.json();
                 
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
            else if (queryValue==1)
            {
                const response = await fetch(`https://localhost:7220/api/TpBd/consulta1?fechaInicio=${fechaini.value}&fehchaFin=${fechafin.value}`);
            
                if (!response.ok) {
                    throw new Error('Error al obtener los datos');
                }
    
                const data = await response.json();
                 
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
            
            else if (queryValue==3)
                {
                    const response = await fetch(`https://localhost:7220/api/TpBd/consulta3?idPelicula=${inputConsulta.value}&asientosLibres=${value}`);
                    console.log('Valor de la consulta:', value);
                    if (!response.ok) {
                        throw new Error('Error al obtener los datos');
                    }
        
                    const data = await response.json();
                     
                    tableBody.innerHTML = '';
                    thead.innerHTML = '';
        
                    if (thead && thead.children.length === 0)
                        {
                        const table = document.createElement('tr');
                        table.innerHTML = `
                            <th>idReproduccion</th>
                            <th>numeroSala</th>
                            <th>idPelicula</th>
                            <th>Idioma</th>
                            <th>horarioInicio</th>
                            
                        `;
                        thead.appendChild(table);}
                        data.forEach(item => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <td>${item.idReproduccion}</td>
                            <td>${item.numeroSala}</td>
                            <td>${item.idPelicula}</td>
                            <td>${item.Idioma}</td>
                            <td>${item.horarioInicio}</td>
                            
                        `;
                        tableBody.appendChild(row);
                    });
        
                    
                    dataTable.style.display = 'table';
                }
                else if (queryValue==4)
                    {
                        console.log('Valor de la consulta:', value);
                        const response = await fetch(`https://localhost:7220/api/TpBd/consulta4?mostrarEmpleadosQueYaestuvieronEnReproduccion=${value}`);
                        
                        if (!response.ok) {
                            throw new Error('Error al obtener los datos');
                        }
            
                        const data = await response.json();
                        console.log('Datos recibidos:', data);
                        tableBody.innerHTML = '';
                        thead.innerHTML = '';
            
                        if (thead && thead.children.length === 0)
                            {
                            const table = document.createElement('tr');
                            table.innerHTML = `
                                <th>nombre</th>
                                <th>apellido</th>
                                <th>tipo</th>
                               
                                
                            `;
                            thead.appendChild(table);}
                            data.forEach(item => {
                            const row = document.createElement('tr');
                            row.innerHTML = `
                                <td>${item.nombre}</td>
                                <td>${item.apellido}</td>
                                <td>${item.tipo}</td>
                            
                                
                            `;
                            tableBody.appendChild(row);
                        });
            
                        
                        dataTable.style.display = 'table';
                    }

                    else if (queryValue==5)
                        {
                            const response = await fetch(`https://localhost:7220/api/TpBd/Consulta5?montoMinimo=${inputConsulta.value}`);
                        
                            if (!response.ok) {
                                throw new Error('Error al obtener los datos');
                            }
                
                            const data = await response.json();
                             
                            tableBody.innerHTML = '';
                            thead.innerHTML = '';
                
                            if (thead && thead.children.length === 0)
                                {   
                                const table = document.createElement('tr');
                                table.innerHTML = `
                                    <th>Pelicula</th>
                                    <th>Idioma</th>
                                    <th>TotalReproducciones</th>
                                   <th>IngresoTotal</th>
                                    
                                `;
                                thead.appendChild(table);}
                                data.forEach(item => {
                                const row = document.createElement('tr');
                                row.innerHTML = `
                                    <td>${item.Pelicula}</td>
                                    <td>${item.Idioma}</td>
                                    <td>${item.TotalReproducciones}</td>
                                    <td>${item.IngresoTotal}</td>
                                    
                                `;
                                tableBody.appendChild(row);
                            });
                
                            
                            dataTable.style.display = 'table';
                        }
                        if (response == null)
                        {
                            error.textContent = 'No se encontro ningun resultado';  
                            error.display='block';
                            tableBody.innerHTML = '';
                            thead.innerHTML = '';    
                        }
                        scroll(550)
        } catch (a) {
            console.error(a);
            
            error.textContent = 'No se pueden obtener los datos';  
            error.display='block';
            tableBody.innerHTML = '';
            thead.innerHTML = '';
            scroll(100)
            
        }
    });
});