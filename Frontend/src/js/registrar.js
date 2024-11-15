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

const registrar = async function (email, contrasena, nombre, apellido, fechaNac, telefono) {
    const contrasenaHash = CryptoJS.MD5(contrasena).toString(CryptoJS.enc.Hex)
    await fetch(`http://localhost:5141/api/Usuario/registrar`, { method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            "eMail": email,
            "contrasenia": contrasenaHash
        })
    })

    const idUsuario = await fetch(`http://localhost:5141/api/Usuario/email/${email}`).then(response => response.json()).then(response => response.idUsuario)

    await fetch(`http://localhost:5141/api/Cliente/crear`, {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            nombre: nombre,
            apellido: apellido,
            telefono: telefono,
            idUsuario: idUsuario,
            fechaNac: fechaNac,

        })
    })
    
    document.cookie = `idUsuario=${idUsuario}`
    document.cookie = `email=${email}`
    document.cookie = `contrasena=${contrasenaHash}`
    document.cookie = `nombre=${nombre}`
    document.cookie = `apellido=${apellido}`
    document.cookie = `fechaNac=${fechaNac}`
    document.cookie = `telefono=${telefono}`
    document.cookie = `admin=${false}`

    window.location.pathname = "/inicio.html"
}

$(".registrar__panel__enviar").addEventListener("click", async evento => {
    evento.preventDefault()

    const email = $(".registrar__panel__email").value

    if (!validarEmail(email)) {
        return mostrarError("Correo electrónico inválido: nombre@dominio.tld")
    }

    const estado = (await fetch(`http://localhost:5141/api/Usuario/email/${$(".registrar__panel__email").value}`)).status

    if (estado === 200) return mostrarError("Ya existe un usuario con ese email.")

    const contrasena = $(".registrar__panel__contrasena").value
    const contrasenaInvalid = validarContrasena(contrasena)

    if (contrasenaInvalid) return mostrarError(contrasenaInvalid)
        
    const contrasenaRepetida = $(".registrar__panel__repetir").value

    if (contrasena !== contrasenaRepetida) return mostrarError("Las contraseñas no coinciden.")

    const nombre = $(".registrar__panel__nombre").value

    if (!nombre) return mostrarError("El nombre es obligatorio.")

    const apellido = $(".registrar__panel__apellido").value

    if (!apellido) return mostrarError("El apellido es obligatorio.")

    const fechaNac = new Date($(".registrar__panel__fecha").value)
    const hoy = new Date().setHours(0, 0, 0, 0)

    if (fechaNac > hoy || isNaN(fechaNac)) return mostrarError("Fecha invalida.")

    const fechaNacISO = fechaNac.toISOString().split("T")[0]
    registrar($(".registrar__panel__email").value, 
    $(".registrar__panel__contrasena").value, 
    $(".registrar__panel__nombre").value, 
    $(".registrar__panel__apellido").value, 
    fechaNacISO, 
    $(".registrar__panel__telefono").value)

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
