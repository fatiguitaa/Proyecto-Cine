"use strict";

const validarEmail = function (email){
    const emailRegex = /[-A-Za-z0-9!#$%&'*+\/=?^_`{|}~]+(?:\.[-A-Za-z0-9!#$%&'*+\/=?^_`{|}~]+)*@(?:[A-Za-z0-9](?:[-A-Za-z0-9]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[-A-Za-z0-9]*[A-Za-z0-9])?/i 
    return emailRegex.test(email)
}

const validarContrasena = function (contrasena){
    if (contrasena.length < 8) return "El largo de la contraseña debe ser mayor a 8."

    let tieneMayuscula
    let tieneNumero

    for (let caracter of contrasena){
        
        if (/[A-Z]/.test(caracter)) {
            tieneMayuscula = true
        }
        
        else if (/\d/.test(caracter)) { 
            tieneNumero = true
        }
    }
    
    if (!tieneMayuscula) return "La contraseña debe contener al menos una letra mayúscula."
    else if (!tieneNumero) return "La contraseña debe contener al menos un número."
}

const mostrarError = function (mensaje) {
    if ($(".login__error__mensaje")) $(".login__error__mensaje").remove()
        
    const error = document.createElement("p")
    error.textContent = mensaje
    error.classList.add("login__error__mensaje")

    $(".login__error").appendChild(error)
}

$(".login__panel__enviar").addEventListener("click", evento => {
    evento.preventDefault()

    const email = $(".login__panel__email").value

    if (!validarEmail(email)) {
        mostrarError("Correo electrónico inválido: nombre@dominio.tld")
        return
    }

    const contrasena = $(".login__panel__contrasena").value
    const contrasenaInvalid = validarContrasena(contrasena)

    if (contrasenaInvalid) {
        mostrarError(contrasenaInvalid)
        return
    }

    window.location.href = "../panel.html"
})

$(".login__panel__visibilidad").addEventListener("click", evento => {
    evento.preventDefault()

    $(".login__panel__visibilidad").classList.toggle("mostrar")

    if ($(".login__panel__contrasena").type === "password") $(".login__panel__contrasena").type = "text" 
    else $(".login__panel__contrasena").type = "password"
})
