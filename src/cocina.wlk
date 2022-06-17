import platos.*

object cocina{
	const platosPreparados = []
	method tieneBuenaOferta(){
		return (self.platosVeganosServidos().size() - self.platosCarneServidos().size()).abs() <=2
	}
	
	method platoFuerteCarnivoro() {
		return self.platosCarneServidos().max({p=>p.valoracion()})
	}
	method platosQueLeGustanA(unComensal){
		return platosPreparados.filter({p=>unComensal.leAgrada(p)})
	}
	method dosPolosOpuestos(unComensal,otroComensal){
		return platosPreparados.any({p=>unComensal.leAgrada(p) && otroComensal.leAgrada(p)})
	}
	
	method platosVeganosServidos(){
		return platosPreparados.filter({p=>p.esVegetariano()})
	}
	method platosCarneServidos(){
		return platosPreparados.filter({p=>!p.esVegetariano()})
	}
	method servirPlato(unComensal){
		if (self.platosQueLeGustanA(unComensal).isEmpty()){
			self.error("No hay plato que le gusten a " + " "+ (unComensal).str())
		}
		const platoElegido = unComensal.eligeComida(self.platosQueLeGustanA(unComensal))
		platosPreparados.remove(platoElegido)
		unComensal.comer(platoElegido)
	}
	
}





