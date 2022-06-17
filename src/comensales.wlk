import platos.*
class Conmensal {
	var property peso
	const platosQueComio =[]
	method leAgrada(plato)
	method comer(plato){
		platosQueComio.add(plato)
	}
	method estaSastifecho(){
		return platosQueComio.all({p=>p.peso() >= peso*0.01})
	}
	method eligeComida(platos)
}
class Vegetariano inherits Conmensal{
	override method leAgrada(plato){
		return plato.esVegetariano() && plato.valoracion() >= 85
	}
	override method estaSastifecho(){
		return super() && !platosQueComio.any({p=>p.esAbundante()})
	}
	override method eligeComida(platos){
		return platos.find({p=>!p.esAbundante()})
	}
}
class HambrePopular inherits Conmensal{
	override method leAgrada(plato){
		return plato.esAbundante()
	}
	override method eligeComida(platos){
		return platos.max({p=>p.peso()})
	}
}

class PaladarFino inherits Conmensal{
	override method leAgrada(plato){
		return plato.peso().between(150,300) && plato.valoracion() >100
	}
	
	override method estaSastifecho(){
		return super() && platosQueComio.size().even()
	}
	override method eligeComida(platos){
		const ultimo = platosQueComio.last()
		if (platosQueComio.isEmpty()){
			return platos.anyOne()
		}else{
			return platos.find({p=>p.esVegetariano() == ultimo.esVegetariano()})
		}
	}
}