package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class Grupo {
	String nombre
	List<String> preferencias = new ArrayList<String>
	List<Usuario> miembros = new ArrayList<Usuario>
	
	
	def void eliminarUsuario(Usuario unUsuario){
		miembros.remove(unUsuario)
		unUsuario.misGrupos.remove(this)
	}
	
	def boolean esMiembro(Usuario unUsuario){
		miembros.contains(unUsuario)
	}
	
	def Receta devolverRecetaDeMiembro(Usuario unUsuario, String nombreReceta){
		var Usuario miembro
		if(esMiembro(unUsuario)){
			miembro = miembros.findFirst[usuario | usuario.devolverReceta(nombreReceta) != null]
			miembro.devolverReceta(nombreReceta)	
		}
	}
	
	
	def Receta copiarReceta(Usuario unUsuario, Grupo unGrupo,Receta unaReceta, String nombreReceta){
		var Receta recetaTemporal = this.devolverRecetaDeMiembro(unUsuario, nombreReceta)
		
		unaReceta.setNombreDeLaReceta(recetaTemporal.getNombreDeLaReceta())
		unaReceta.setCalorias(recetaTemporal.getCalorias())
		unaReceta.setProcesoDePreparacion(recetaTemporal.getProcesoDePreparacion())
		unaReceta.setDificultadDePreparacion(recetaTemporal.getDificultadDePreparacion())
		unaReceta.setTemporadaALaQueCorresponde(recetaTemporal.getTemporadaALaQueCorresponde())
		//unaReceta.subRecetas = recetaTemporal.subRecetas.clone()
		
		//Workaround para ArrayList, en vez de usar clone se inicializa un nuevo ArrayList con el mismo contenido que recetaTemporal
		unaReceta.ingredientes = new ArrayList<Ingrediente>(recetaTemporal.ingredientes)
		unaReceta.condimentos = new ArrayList<Condimento>(recetaTemporal.condimentos)
		unaReceta.subRecetas = new ArrayList<Receta>(recetaTemporal.subRecetas)
		
		//Devuelvo el objeto
		unaReceta
	}
	
}