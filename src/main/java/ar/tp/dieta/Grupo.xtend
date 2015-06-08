package ar.tp.dieta

import java.util.ArrayList
import java.util.Iterator
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Grupo extends Miembro{
	List<Usuario> miembros = new ArrayList<Usuario>
		
	def void eliminarUsuario(Usuario unUsuario){
		miembros.remove(unUsuario)
		unUsuario.misGrupos.remove(this)
	}
	
	def recetasDelGrupoPara(Usuario unUsuario){
		//todas las recetas de los usuarios de un grupo, exepto de unUsuario
		miembros.filter[usr | usr != unUsuario].map[misRecetas].flatten()
	}
	
	def boolean esMiembro(Usuario unUsuario){
		miembros.contains(unUsuario)
	}
	
	def agregarUsuario(Usuario unUsuario){
		miembros.add(unUsuario)
	}
	
	def Receta devolverRecetaDeMiembro(String nombreReceta){
		var Usuario miembro
		miembro = miembros.findFirst[usuario | usuario.devolverReceta(nombreReceta) != null]
		miembro.devolverReceta(nombreReceta)	
		}
	
	def Receta copiarReceta(Usuario unUsuario, Grupo unGrupo,Receta unaReceta, String nombreReceta){
		var Receta recetaTemporal = this.devolverRecetaDeMiembro(nombreReceta)
		
		unaReceta.setNombreDeLaReceta(recetaTemporal.getNombreDeLaReceta())
		unaReceta.setCalorias(recetaTemporal.getCalorias())
		unaReceta.setProcesoDePreparacion(recetaTemporal.getProcesoDePreparacion())
		unaReceta.setDificultadDePreparacion(recetaTemporal.getDificultadDePreparacion())
		unaReceta.setTemporadaALaQueCorresponde(recetaTemporal.getTemporadaALaQueCorresponde())
		//unaReceta.subRecetas = recetaTemporal.subRecetas.clone()
		
		//Workaround para ArrayList, en vez de usar clone se inicializa un nuevo ArrayList con el mismo contenido que recetaTemporal
		unaReceta.elementosDeReceta = new ArrayList<ElementoDeReceta>(recetaTemporal.elementosDeReceta)
		
		//Devuelvo el objeto
		unaReceta
	}
	
	def List<Usuario> devolverTodosLosMiembros(){
		miembros
	}
	
	def tePuedoSugerirEstaReceta(Receta receta){
		!miembros.exists[usuario | receta.esInadecuadaParaUsuario(usuario)] && meGustaEstaReceta(receta)
	}
	
	def meGustaEstaReceta(Receta receta){
		preferencias.exists[ingrediente | receta.elementosDeReceta.exists(elem | elem.getNombre.equals(ingrediente))]
	}
	
	def devolverRecetas(){
		val List<Receta> recetasDeGrupo = new ArrayList<Receta>
		recetasDeGrupo.addAll(recetario.recetas)
		recetasDeGrupo.addAll(miembros.map[misRecetas].flatten())
		recetasDeGrupo
	}
	
	def List<Receta> busquedaFiltrada(){
  		var List<Receta> recetasFiltradas = this.devolverRecetas()
		  if(!misBusquedas.empty){
		   var Iterator<Busqueda> iterBusqueda = misBusquedas.iterator()
		    while(iterBusqueda.hasNext){
		       recetasFiltradas = (iterBusqueda.next).aplicarBusquedaGrupo(this,recetasFiltradas)
		   }
		  }
		  recetasFiltradas
 }
}