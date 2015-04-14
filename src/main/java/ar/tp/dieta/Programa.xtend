package ar.tp.dieta

import java.util.List

class Programa {
	List<Usuario> usuarios
	List<Receta> recetario
	
	def nuevoUsuario(Usuario unUsuario){
		usuarios.add(unUsuario)
	}
	
	def nuevaReceta(Receta unaReceta){
		recetario.add(unaReceta)
	}
	
}