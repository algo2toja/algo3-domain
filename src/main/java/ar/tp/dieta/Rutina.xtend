package ar.tp.dieta

abstract class Rutina {
	
	def indiceSaludable(Usuario unUsuario){
		(unUsuario.indiceDeMasaCorporal >=18 && unUsuario.indiceDeMasaCorporal <=30)
	}
	
	def noTengoCondiciones(Usuario unUsuario){
		(unUsuario.noTengoCondiciones)
	}
	
	def soyVeganoYMeGustaLaFruta(Usuario unUsuario){
		((unUsuario.soyVegano && unUsuario.meGustaLaFruta) || !unUsuario.soyVegano)
	}
	
	def soyHipertenso(Usuario unUsuario){
		(unUsuario.soyHipertenso)
	}
	
	def soyDiabeticoYDelgado(Usuario unUsuario){
		((unUsuario.soyDiabetico || unUsuario.getPeso <=70) || !unUsuario.soyDiabetico)
	}
	
	
	def rutinaSaludable(Usuario unUsuario){
		((indiceSaludable(unUsuario) && noTengoCondiciones(unUsuario)) || (soyVeganoYMeGustaLaFruta(unUsuario) && !(soyHipertenso(unUsuario)) && soyDiabeticoYDelgado(unUsuario)))
	}	
		
}