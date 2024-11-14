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
    if ($(".registrar__error__mensaje")) $(".registrar__error__mensaje").remove()
        
    const error = document.createElement("p")
    error.textContent = mensaje
    error.classList.add("registrar__error__mensaje")

    $(".registrar__error").appendChild(error)
}

const registrar = function (email, contrasena, nombre, apellido, edad, telefono) {

}

$(".registrar__panel__enviar").addEventListener("click", async evento => {
    evento.preventDefault()

    const email = $(".registrar__panel__email").value

    if (!validarEmail(email)) {
        mostrarError("Correo electrónico inválido: nombre@dominio.tld")
        return
    }

    const contrasena = $(".registrar__panel__contrasena").value
    const contrasenaInvalid = validarContrasena(contrasena)

    if (contrasenaInvalid) {
        mostrarError(contrasenaInvalid)
        return
    }

    const contrasenaRepetida = $(".registrar__panel__repetir").value

    if (contrasena !== contrasenaRepetida) return mostrarError("Las contraseñas no coinciden.")

    const nombre = $(".registrar__panel__nombre").value

    if (!nombre) return mostrarError("El nombre es obligatorio.")

    const apellido = $(".registrar__panel__apellido").value

    if (!apellido) return mostrarError("El apellido es obligatorio.")

    const fechaNac = new Date($(".registrar__panel__fecha").value)
    const hoy = new Date().setHours(0, 0, 0, 0)

    if (fechaNac > hoy || isNaN(fechaNac)) return mostrarError("Fecha invalida.")
    
    if (await !fetch("http://localhost:5141/api/Usuario/email")
    .then(response => response.json())) return mostrarError("Ya existe un usu")
    
})

$(".registrar__panel__visibilidad").addEventListener("click", evento => {
    evento.preventDefault()

    $(".registrar__panel__visibilidad").classList.toggle("mostrar")

    if ($(".registrar__panel__contrasena").type === "password") {
        $(".registrar__panel__contrasena").type = "text"
        $(".registrar__panel__repetir").type = "text"
    }
    else { 
        $(".registrar__panel__contrasena").type = "password" 
        $(".registrar__panel__repetir").type = "password"
    }
})
