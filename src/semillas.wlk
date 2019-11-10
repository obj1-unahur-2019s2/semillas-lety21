class Planta {
	var property anioObtencion
	var property altura
	
	method horasDeSolQueTolera()
	method esFuerte() { return self.horasDeSolQueTolera() > 10 }
	method daNuevasSemillas() { return self.esFuerte() }	
}

class Menta inherits Planta {
	override method horasDeSolQueTolera() { return 6 }
	override method daNuevasSemillas() { return super() or self.altura() > 0.4 }
	method espacioQueOcupa() { return self.altura() * 3 }
}

class Soja inherits Planta {
	override method horasDeSolQueTolera() { 
		if (self.altura() < 0.5) {
			return 6
		} else if (self.altura().between(0.5, 1)) {
			return 7
		} else {
			return 9
		}
	}
	override method daNuevasSemillas() { 
		return super() or (self.altura() > 1 and self.anioObtencion() > 2007)
	}
	method espacioQueOcupa() { return self.altura() / 2 }
}

class Quinoa inherits Planta {
	var property horasDeSolQueTolera
	
	override method daNuevasSemillas() { return super() or self.anioObtencion() < 2005 }
	method espacioQueOcupa() { return 0.5 }
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() { return false }
}

class Hierbabuena inherits Menta {
	override method espacioQueOcupa() { return super() * 2 }
}





















