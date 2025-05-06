import camion2.*
object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1
    method consecuenciaDeLaCarga() {}
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
    method bultos() = 2
    method consecuenciaDeLaCarga() {estaTransformado = true}
}
object ladrillos{
    var cantidad = 300
    method peso() = cantidad * 2
    method cantidad(unaCantidad){cantidad = unaCantidad}
    method peligrosidad() = 2 
    method bultos() = if (cantidad <= 100) 1 
                      else if (cantidad.between(101, 301)) 2
                      else 3
    method consecuenciaDeLaCarga() {cantidad += 12}
}

object arena{
    var property peso = 500
    //method peso() = peso
    //method peso(unPeso) {peso = unPeso}
    method peligrosidad() = 1
    method bultos() = 1
    method consecuenciaDeLaCarga() {peso = peso - 10.max(0)}
}

object bateriaAntiaerea{
    var tieneMisiles = true
    method sacarMisiles(){tieneMisiles = false}
    method cargarMisiles(){tieneMisiles = true}
    method peso() = if(tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0
    method bultos() = if (tieneMisiles) 2 else 1
    method consecuenciaDeLaCarga() {self.cargarMisiles()}
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
    method bultos() = 1 + cosasAdentro.sum({c => c.bultos()})
    method consecuenciaDeLaCarga() {cosasAdentro.forEach({c => c.consecuenciaDeLaCarga()})}
}

object residuosRadioactivos{
    var property peso = 100
    method peligrosidad() = 200
    method bultos() = 1
    method consecuenciaDeLaCarga() {peso += 15}
}

object embalaje{
    var cosaEmbalada = bateriaAntiaerea
    method otroEmbalaje(unaCosa){cosaEmbalada = unaCosa}
    method peso() = cosaEmbalada.peso()
    method peligrosidad() = cosaEmbalada.peligrosidad() / 2
    method bultos() = 2
    method consecuenciaDeLaCarga() {}
}

