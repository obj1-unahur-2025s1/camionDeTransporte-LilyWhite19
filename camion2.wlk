object camion {
    const carga = []
    method cargarCosa(unaCosa){
        carga.add(unaCosa)
        unaCosa.consecuenciaDeLaCarga()
    }
    method descargarCosa(unaCosa){
        carga.remove(unaCosa)
    }
    method pesoTotal() = 1000 + self.pesoDeLaCarga()
    method pesoDeLaCarga(){
        return carga.sum({c => c.peso()})
    }
    method listaDePesosDeLasCosas(){
        return carga.map({c => c.peso()})
    }
    method listaDePeligrosidadDeLasCosas(){
        return carga.map({c => c.peligrosidad()})
    }
    method losPesosSonPares(){
        return self.listaDePesosDeLasCosas().all({c => c.even()})
    }
    method hayUnaCosaPesa(unValor){
        return self.listaDePesosDeLasCosas().any({c => c == unValor})
    }
    method cosaConUnValorDePeligrosidad(unaPeligrosidad){
        return carga.find({c => c.peligrosidad() == unaPeligrosidad})
    }
    method cosasConMayorPeligrosidad(unaPeligrosidad){
        return carga.filter({c => c.peligrosidad() > unaPeligrosidad})
    }
    method cosasConMayorNivelDePeligrosidadQueUnaCosa(unaCosa){
        return carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    }
    method seExedioDePeso() {
        return self.pesoTotal() > 2500
    }
    method puedeCircularEnRuta(nivelDePeligrosidad){
        return !self.seExedioDePeso() && 
        self.cosasConMayorPeligrosidad(nivelDePeligrosidad).isEmpty()
    }
    method unCosaCosaPesaEntreValores(min, max){
        return self.listaDePesosDeLasCosas().any({c => c.between(min, max)})
    }
    method laCosaMasPesada(){
        return carga.max({c => c.peso()})
    }
}