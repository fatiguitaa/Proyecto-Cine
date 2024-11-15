"use strict";

const mostrarError = function (mensaje) {
    if ($(".login__error__mensaje")) $(".login__error__mensaje").remove()
        
    const error = document.createElement("p")
    error.textContent = mensaje
    error.classList.add("login__error__mensaje")

    $(".login__error").appendChild(error)
}

$(".login__panel__enviar").addEventListener("click", async evento => {
    evento.preventDefault()

    const email = $(".login__panel__email").value
    const contrasena = $(".login__panel__contrasena").value
    
    if (email && contrasena){

        const contrasenaHash = CryptoJS.MD5(contrasena).toString(CryptoJS.enc.Hex)

        const response = await fetch(`http://localhost:5141/api/Usuario/login`, { method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                "eMail": email,
                "contrasenia": contrasenaHash
            })
        })

        if (response.status === 200) {
            let idUsuario
            let nombre
            let apellido
            let fechaNac
            let telefono
            let admin

            await response.json().then(usuario => {
                idUsuario = usuario.idUsuario,
                admin = usuario.esAdmin
            })

            document.cookie = `idUsuario=${idUsuario}`
            document.cookie = `email=${email}`
            document.cookie = `contrasena=${contrasenaHash}`

            await fetch(`http://localhost:5141/api/Cliente/GetByIdUsuario?idUsuario=${idUsuario}`).then(response => response.json()).then(cliente => {
                nombre = cliente.nombre
                apellido = cliente.apellido
                fechaNac = cliente.fechaNac
                telefono = cliente.telefono
            })

            document.cookie = `nombre=${nombre}`
            document.cookie = `apellido=${apellido}`
            document.cookie = `fechaNac=${fechaNac}`
            document.cookie = `telefono=${telefono}`
            document.cookie = `admin=${admin}`

            window.location.pathname = "/inicio.html"
        }
        else return mostrarError("Correo electronico o contraseña incorrectos.")
    }
    else {
        mostrarError("Correo electronico y contraseña obligatorios.")
    }
})

$(".login__panel__visibilidad").addEventListener("click", evento => {
    evento.preventDefault()

    $(".login__panel__visibilidad").classList.toggle("mostrar")

    if ($(".login__panel__contrasena").type === "password") $(".login__panel__contrasena").type = "text" 
    else $(".login__panel__contrasena").type = "password"
})
