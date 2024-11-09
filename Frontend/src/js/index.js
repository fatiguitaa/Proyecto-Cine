"use strict";

const $ = element => document.querySelector(element)
const $$ = element => document.querySelectorAll(element)

const validarEmail = email => {
    const emailRegex = /[-A-Za-z0-9!#$%&'*+\/=?^_`{|}~]+(?:\.[-A-Za-z0-9!#$%&'*+\/=?^_`{|}~]+)*@(?:[A-Za-z0-9](?:[-A-Za-z0-9]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[-A-Za-z0-9]*[A-Za-z0-9])?/i
    return emailRegex.test(email)
}

const validarContrasena = contrasena => {
    if (contrasena.length < 8) return "El largo de la contraseña debe ser mayor a 8."

    let tieneMayuscula
    for (let caracter of contrasena){
        
        if (/[AZ]/.test(caracter)) {
            tieneMayuscula = true
        }
    }

    if (!tieneMayuscula) return "La contraseña debe contener al menos 1 mayuscula."
    
    let tieneNumero
    for (let caracter of contrasena){
        
        if (/\d/.test(caracter)) {
            tieneNumero = true
        }
    }

    if (!tieneNumero) return "La contraseña debe contener al menos 1 numero."
}



$(".login__enviar").addEventListener("click", async evento => {
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




document.addEventListener