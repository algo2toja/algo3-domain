package dieta

import dieta.Rutina

class RutinaActivaConEjercicio extends Rutina {
	
		override rutinaSaludable(Usuario unUsuario){
			((super.indiceSaludable(unUsuario) && super.noTengoCondiciones(unUsuario)) || (super.soyVeganoYMeGustaLaFruta(unUsuario)))
		}
	
}