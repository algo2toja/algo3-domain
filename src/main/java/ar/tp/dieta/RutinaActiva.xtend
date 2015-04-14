package ar.tp.dieta

import ar.tp.dieta.Rutina

class RutinaActiva extends Rutina {
	
	override rutinaSaludable(Usuario unUsuario){
		((super.indiceSaludable(unUsuario) && super.noTengoCondiciones(unUsuario)) || (super.soyVeganoYMeGustaLaFruta(unUsuario) && !(super.soyHipertenso(unUsuario))))
	}
}