"use strict";

document.addEventListener("DOMContentLoaded", async () => {
    const emailCookie = obtenerCookie("email")
    const contrasenaCookie = obtenerCookie("contrasena")

    if (emailCookie && contrasenaCookie){
        const response = await fetch(`http://localhost:5141/api/Usuario/login`, { method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                "eMail": emailCookie,
                "contrasenia": contrasenaCookie
            })
        })
        

        if (response.status === 204) {
            document.cookie = `idUsuario=a; expires=Thu, 01 Jan 1970 00:00:00 UTC`
            document.cookie = `email=a; expires=Thu, 01 Jan 1970 00:00:00 UTC`
            document.cookie = `contrasena=a; expires=Thu, 01 Jan 1970 00:00:00 UTC`
            document.cookie = `nombre=a; expires=Thu, 01 Jan 1970 00:00:00 UTC`
            document.cookie = `apellido=a; expires=Thu, 01 Jan 1970 00:00:00 UTC`
            document.cookie = `fechaNac=a; expires=Thu, 01 Jan 1970 00:00:00 UTC`
            document.cookie = `telefono=a; expires=Thu, 01 Jan 1970 00:00:00 UTC`
            document.cookie = `admin=false; expires=Thu, 01 Jan 1970 00:00:00 UTC`

            window.location.href = window.location.origin
        }
        else if (window.location.pathname === "/gestor.html"){
            const admin = await response.json().then(usuario => usuario.esAdmin)
            
            if (!admin) {
                window.location.pathname = "/inicio.html"
            }
        }
        else {
            if (window.location.pathname === "/") {
                window.location.pathname = "/inicio.html"
            }
        }
    }
    else {
        if (window.location.pathname !== "/" && window.location.pathname !== "/registrar.html") {
            window.location.href = window.location.origin
        }
    }

    if ((obtenerCookie("admin") === "true")){
        const linkGestor = document.createElement("li")
        linkGestor.innerHTML = "<a href=\"./gestor.html\">Gestor</a>"
        $(".nav-links").appendChild(linkGestor)
    }
    
})

window.addEventListener("load", () => {
    $("body").classList.remove("cargando")

    $(".carga").addEventListener("transitionend", () => {
        $(".carga").remove()
    })
})
