object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee{
    var estaTransformado = false
    method estaTransformado() = estaTransformado
    method transformarse() {estaTransformado = !estaTransformado}
    method peso() = 800
    method peligrosidad() {
        return if (estaTransformado){
            30
        }
        else{
            15
        }
    }
}
object ladrillos{
    var cantidad = 300
    method peso() = cantidad * 2
    method cantidad(unaCantidad){cantidad = unaCantidad}
    method peligrosidad() = 2 
}

object arena{
    var property peso = 500
    //method peso() = peso
    //method peso(unPeso) {peso = unPeso}
    method peligrosidad() = 1
}

object bateriaAntiaerea{
    var tieneMisiles = true
    method sacarMisiles(){tieneMisiles = false}
    method cargarMisiles(){tieneMisiles = true}
    method peso() = if(tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0
}   

object contenedor{
    const cosasAdentro = []
    method cargarCosas(unaCosa) {cosasAdentro.add(unaCosa)}
    method descargarCosas(unaCosa) {cosasAdentro.remove(unaCosa)}
    method agregarVariasCosas(unaListaDeCosas){
        cosasAdentro.addAll(unaListaDeCosas)
    }
    method peso() = 100 + cosasAdentro.sum({c => c.peso()})
    method peligrosidad() = if (cosasAdentro.isEmpty()) 0 
        else cosasAdentro.max({c => c.peligrosidad()}) 
}

object residuosRadioactivos{
    var property peso = 100
    method peligrosidad() = 200
}

object embalaje{
    var cosaEmbalada = bateriaAntiaerea
    method otroEmbalaje(unaCosa){cosaEmbalada = unaCosa}
    method peso() = cosaEmbalada.peso()
    method peligrosidad() = cosaEmbalada.peligrosidad() / 2
}

