const $ = element => document.querySelector(element)
const $$ = element => document.querySelectorAll(element)

function obtenerCookie(nombre) {
    let cookies = document.cookie.split(';');

    for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i].trim(); 
        
        if (cookie.startsWith(nombre + "=")) {
            return cookie.substring(nombre.length + 1); 
        }
    }
}
