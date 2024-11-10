"use strict";

const $ = element => document.querySelector(element)
const $$ = element => document.querySelectorAll(element)

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

$(".login__enviar").addEventListener("click", evento => {
    evento.preventDefault()

    $(".error__mensaje").textContent = ""

    const email = $(".login__email").value

    if (!validarEmail(email)) {
        $(".error__mensaje").textContent = "Correo electrónico inválido: nombre@dominio.tld"
        return
    }

    const contrasena = $(".login__contrasena").value
    const contrasenaInvalid = validarContrasena(contrasena)

    if (contrasenaInvalid) {
        $(".error__mensaje").textContent = contrasenaInvalid
        return
    }
})

$(".login__visibilidad").addEventListener("click", evento => {
    evento.preventDefault()
    $(".login__visibilidad").classList.toggle("mostrar")

    $(".login__contrasena").type === "password"
    ? $(".login__contrasena").type = "text"
    : $(".login__contrasena").type = "password"
})
