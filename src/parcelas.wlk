class Parcela {
	var property largo
	var property ancho
	var property horasDeSolQueRecibe = 8
	var property plantas = []	
	
	method superficie() { return largo * ancho }
	method capacidadPlantas() {
		return if (ancho > largo) { self.superficie() / 5 } else { self.superficie() + largo }
	}
	method tieneComplicaciones() {
		return plantas.any({ planta => planta.horasDeSolQueTolera() < self.horasDeSolQueRecibe() })
	}
	
	method plantar(planta) {
		if (self.estaCompleta() or self.tieneDemasiadoSolParaPlanta(planta)) {
			self.error("No se puede plantar la planta indicada")
		}
		plantas.add(planta)
	}
	
	method estaCompleta() {
		return self.cantidadDePlantas() >= self.capacidadPlantas()
	}
	method cantidadDePlantas() {
		return plantas.size() 
	}
	method tieneDemasiadoSolParaPlanta(planta) {
//		return self.horasDeSolQueRecibe() >= planta.horasDeSolQueTolera() + 2
		// esta parece más clara
		return self.horasDeSolQueRecibe() - planta.horasDeSolQueTolera() >= 2
	}
}
