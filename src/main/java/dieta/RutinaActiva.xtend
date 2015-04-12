package dieta

import dieta.Rutina

class RutinaActiva extends Rutina {
	
	override rutinaSaludable(Usuario unUsuario){
		((super.indiceSaludable(unUsuario) && super.noTengoCondiciones(unUsuario)) || (super.soyVeganoYMeGustaLaFruta(unUsuario) && !(super.soyHipertenso(unUsuario))))
	}
}