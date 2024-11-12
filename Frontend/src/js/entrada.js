window.addEventListener("load", () => {
    $("body").classList.remove("cargando")

    $(".carga").addEventListener("transitionend", () => {
        $(".carga").remove()
    })
})
