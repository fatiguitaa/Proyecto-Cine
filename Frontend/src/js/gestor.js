"use strict";

CargarCombo($(".peliculas__borrar__id"),"Pelicula",2)
CargarCombo($(".peliculas__crear__genero"),"Genero",'1')
CargarCombo($(".peliculas__actualizar__genero"),"Genero",'1')
CargarCombo($(".peliculas__actualizar__id"),"Pelicula",2)
CargarCombo($(".carteleras__agregar__pelicula"),"Pelicula",2)
CargarCombo($(".carteleras__quitar__pelicula"),"Pelicula",2)
CargarCombo($(".empleados__crear__area"),"Area",1)

const mostrarResultadoGestor = function(padreElemento, mensaje, claseResultado) {
    if ($(padreElemento).childNodes[0]) $(padreElemento).childNodes[0].remove()

    $(padreElemento).classList.add(claseResultado)

    const mensajeResultado = document.createElement("p")

    mensajeResultado.textContent = mensaje

    $(padreElemento).appendChild(mensajeResultado)
}

$(".peliculas__borrar__enviar").addEventListener("click", async evento => {
    evento.preventDefault()
    
    if (!$(".peliculas__borrar__id").value) return mostrarResultadoGestor(".peliculas__borrar__resultado", "Id obligatorio.", "error")

    await fetch(`http://localhost:5141/api/Pelicula?idPelicula=${$(".peliculas__borrar__id").value}`, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json"
        }
    }).then(response => response.json()).then(response => {

        if(response) {
            mostrarResultadoGestor(".peliculas__borrar__resultado", "La pelicula fue borrada con exito.", "correcto")
        }
        else {
            mostrarResultadoGestor(".peliculas__borrar__resultado", "La pelicula ya esta borrada o no existe.", "error")
        }
    })
})

$(".peliculas__crear__enviar").addEventListener("click", async evento => {
    evento.preventDefault()

    const url = $(".peliculas__crear__url").value
    const nombre = $(".peliculas__crear__nombre").value
    const duracion = $(".peliculas__crear__duracion").value
    const sinopsis = $(".peliculas__crear__sinopsis").value

    if (!url
    || !nombre
    || !duracion
    || !sinopsis){
        return mostrarResultadoGestor(".peliculas__crear__resultado", "Todos los campos son obligatorios.", "error")
    }

    const fechaEstreno = new Date($(".peliculas__crear__fecha").value)
    const hoy = new Date().setHours(0, 0, 0, 0)

    if (fechaEstreno > hoy || isNaN(fechaEstreno)) return mostrarResultadoGestor(".peliculas__crear__resultado", "Fecha invalida.", "error")

    const idGenero = parseInt($(".peliculas__crear__genero").value)

    if (idGenero > 5) return mostrarResultadoGestor(".peliculas__crear__resultado", "Genero inexistente.", "error")
    
    const fechaISO = fechaEstreno.toISOString().split("T")[0]
    
    await fetch(`http://localhost:5141/api/Pelicula`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            urlPortada: url,
            nombre: nombre,
            fechaEstreno: fechaISO,
            duracionMinutos: duracion,
            sinopsis: sinopsis,
            idGenero: idGenero,
            estaActiva: true
        })
    }).then(response => response.json()).then(response => {

        if(response) {
            mostrarResultadoGestor(".peliculas__crear__resultado", "La pelicula fue creada con exito.", "correcto")
        }
        else {
            mostrarResultadoGestor(".peliculas__crear__resultado", "Ocurrio un error creando la pelicula.", "error")
            console.log(response)
        }
    })
})

$(".peliculas__actualizar__enviar").addEventListener("click", async evento => {
    evento.preventDefault()

    const idPelicula = $(".peliculas__actualizar__id").value
    const url = $(".peliculas__actualizar__url").value
    const nombre = $(".peliculas__actualizar__nombre").value
    const duracion = $(".peliculas__actualizar__duracion").value
    const sinopsis = $(".peliculas__actualizar__sinopsis").value

    if (!idPelicula
    || !url
    || !nombre
    || !duracion
    || !sinopsis){
        return mostrarResultadoGestor(".peliculas__actualizar__resultado", "Todos los campos son obligatorios.", "error")
    }

    const fechaEstreno = new Date($(".peliculas__actualizar__fecha").value)
    const hoy = new Date().setHours(0, 0, 0, 0)

    if (fechaEstreno > hoy || !fechaEstreno) return mostrarResultadoGestor(".peliculas__actualizar__resultado", "Fecha invalida.", "error")

    const idGenero = parseInt($(".peliculas__actualizar__genero").value)

    if (idGenero > 5) return mostrarResultadoGestor(".peliculas__actualizar__resultado", "Genero inexistente.", "error")
    
    const fechaISO = fechaEstreno.toISOString().split("T")[0]

    
    await fetch(`http://localhost:5141/api/Pelicula`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            idPelicula: idPelicula,
            urlPortada: url,
            nombre: nombre,
            fechaEstreno: fechaISO,
            duracionMinutos: duracion,
            sinopsis: sinopsis,
            idGenero: idGenero,
            estaActiva: true
        })
    }).then(response => response.json()).then(response => {

        if(response) {
            mostrarResultadoGestor(".peliculas__actualizar__resultado", "La pelicula fue actualizada con exito.", "correcto")
        }
        else {
            mostrarResultadoGestor(".peliculas__actualizar__resultado", "Ocurrio un error actualizando la pelicula.", "error")
        }
    })
})

$(".carteleras__crear__enviar").addEventListener("click", async evento => {
    evento.preventDefault()
    const fechaInicio = $(".carteleras__crear__inicio").value
    const fechaFin = $(".carteleras__crear__final").value

    if (!fechaInicio || !fechaFin ) return mostrarResultadoGestor(".carteleras__crear__resultado", "Todos los campos son obligatorios.", "error")

    if (fechaInicio > fechaFin) return mostrarResultadoGestor(".carteleras__crear__resultado", "La fecha de inicio no puede ser despues que la de finalizacion.", "error")

    await fetch("http://localhost:5141/api/Cartelera", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            fechaInicio: fechaInicio,
            fechaFin: fechaFin
        })})
        .then(response => response.json())
        .then(response => {
            if (response) {
                mostrarResultadoGestor(".carteleras__crear__resultado", "Cartelera creada correctamente.", "correcto")
            }
            else {
                mostrarResultadoGestor(".carteleras__crear__resultado", "Ocurrio un error creando la cartelera.", "error")
            }
    })
})

$(".carteleras__actualizar__enviar").addEventListener("click", async evento => {
    evento.preventDefault()
    const idCartelera = $(".carteleras__actualizar__id").value

    const fechaInicio = $(".carteleras__actualizar__inicio").value
    const fechaFin = $(".carteleras__actualizar__final").value


    if (!idCartelera ||!fechaInicio || !fechaFin) return mostrarResultadoGestor(".carteleras__actualizar__resultado", "Todos los campos son obligatorios.", "error")

    if (fechaInicio > fechaFin) return mostrarResultadoGestor(".carteleras__actualizar__resultado", "La fecha de inicio no puede ser despues que la de finalizacion.", "error")

    const fechaInicioDateTime = new Date(fechaInicio).toISOString()
    const fechaFinDateTime = new Date(fechaFin).toISOString()

    console.log(fechaInicioDateTime, fechaFinDateTime)
    await fetch("http://localhost:5141/api/Cartelera", {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            idCartelera: idCartelera,
            fechaInicio: fechaInicioDateTime,
            fechaFin: fechaFinDateTime
        })})
        .then(response => response.json())
        .then(response => {
            if (response) {
                mostrarResultadoGestor(".carteleras__actualizar__resultado", "Cartelera actualizada correctamente.", "correcto")
            }
            else {
                mostrarResultadoGestor(".carteleras__actualizar__resultado", "Ocurrio un error actualizando la cartelera.", "error")
            }
    })
})

$(".carteleras__agregar__enviar").addEventListener("click", async evento => {
    evento.preventDefault()
    const idCartelera = $(".carteleras__agregar__cartelera").value

    const idPelicula = $(".carteleras__agregar__pelicula").value


    if (!idCartelera ||!idPelicula) return mostrarResultadoGestor(".carteleras__agregar__resultado", "Todos los campos son obligatorios.", "error")

    await fetch(`http://localhost:5141/api/Cartelera/Pelicula?idCartelera=${idCartelera}&IdPelicula=${idPelicula}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        }})
        .then(response => response.json())
        .then(response => {
            if (response) {
                mostrarResultadoGestor(".carteleras__agregar__resultado", "Pelicula agregada correctamente.", "correcto")
            }
            else {
                mostrarResultadoGestor(".carteleras__agregar__resultado", "Ocurrio un error agregando la pelicula.", "error")
            }
    })
})

$(".carteleras__quitar__enviar").addEventListener("click", async evento => {
    evento.preventDefault()
    const idCartelera = $(".carteleras__quitar__cartelera").value

    const idPelicula = $(".carteleras__quitar__pelicula").value


    if (!idCartelera ||!idPelicula) return mostrarResultadoGestor(".carteleras__quitar__resultado", "Todos los campos son obligatorios.", "error")

    await fetch(`http://localhost:5141/api/Cartelera/Pelicula?idCartelera=${idCartelera}&IdPelicula=${idPelicula}`, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json"
        }})
        .then(response => response.json())
        .then(response => {
            if (response) {
                mostrarResultadoGestor(".carteleras__quitar__resultado", "Pelicula quitada correctamente.", "correcto")
            }
            else {
                mostrarResultadoGestor(".carteleras__quitar__resultado", "Ocurrio un error quitando la pelicula.", "error")
            }
    })
})

$(".empleados__crear__enviar").addEventListener("click", async evento => {
    evento.preventDefault()

    const nombre = $(".empleados__crear__nombre").value
    const apellido = $(".empleados__crear__apellido").value
    const telefono = $(".empleados__crear__telefono").value
    const idArea = $(".empleados__crear__area").value
    const idUsuario = $(".empleados__crear__usuario").value
    const fechaNac = $(".empleados__crear__fecha").value

    if (!nombre
        || !apellido
        || !telefono
        || !idArea
        || !idUsuario
        || !fechaNac)
        {
            return mostrarResultadoGestor(".empleados__crear__resultado", "Todos los campos son obligatorios.", "error")
        }
    
    const fechaNacDatetime = new Date(fechaNac)
    const hoy = new Date().setHours(0, 0, 0, 0)

    if (fechaNacDatetime > hoy) return mostrarResultadoGestor(".empleados__crear__resultado", "La fecha de nacimiento no puede ser despues que la de hoy.", "error")

    await fetch("http://localhost:5141/api/Empleado/crear", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            nombre: nombre,
            apellido: apellido,
            telefono: telefono,
            idArea: parseInt(idArea),
            idUsuario: parseInt(idUsuario),
            fechaNac: fechaNac
        })}).then(response => response.json())
        .then(response => {
            if (response){
                return mostrarResultadoGestor(".empleados__crear__resultado", "Empleado creado correctamente.", "correcto")
            }
            else {
                return mostrarResultadoGestor(".empleados__crear__resultado", "Ocurrio un error al crear el empleado.", "error")
            }
        })
})

