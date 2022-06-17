
class Plato{
	method peso()
	method esVegetariano()
	method valoracion()
	method esAbundante(){
		return self.peso() > 250
	}
}
class Provoleta inherits Plato{
	var tieneEspecias
	var esCompleta 
	const property peso
	override method esVegetariano(){
		return !esCompleta
	}
	override method valoracion(){
		if (self.esEspecial()){
			return 120
		}else{
			return 85
		}
	}
	method esEspecial(){
		return self.esAbundante() && tieneEspecias || esCompleta
	}
}

class HamburguesaCarne inherits Plato{
	var property pan
	override method peso(){
		return 250
	}
	override method esVegetariano(){
		return false
	}
	override method valoracion(){
		return 60 + pan.puntos()
	}
}

class HamburguesaVegana inherits platos.HamburguesaCarne{
	var legumbre 
	override method esVegetariano(){
		return true
	}
	override method valoracion(){
		return super()+ legumbre.size()*2
	}
}

class Parrillada inherits Plato{
	var cantCortes
	override method peso(){
		return 250 * cantCortes
	}
	override method esVegetariano(){
		return false
	}
	override method valoracion(){
		if (cantCortes>=6){
			return 140
		}else if (cantCortes.between(4,5)){
			return 100
		}
		else {
			return 70
		}
	}
	
}





object industrial{
	method puntos(){
		return 0
	}
}
object casero{
	method puntos(){
		return 20
	}
}
object masaMadre{
	method puntos(){
		return 45
	}
}






