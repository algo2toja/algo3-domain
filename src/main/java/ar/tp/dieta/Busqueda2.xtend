package ar.tp.dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Busqueda2 {

	Boolean aplicarFiltro
	String dificultad
	String nombre
	String ingrediente
	Integer caloriasMinimas
	Integer caloriasMaximas
	String temporada
	Busqueda busquedaFinal = new Busqueda
	
	def List<String> getDificultades(){
		#[RecetaBuilder.FACIL,RecetaBuilder.MEDIA,RecetaBuilder.DIFICIL]
	}
	
	def List<String> getTemporadas(){
		#[RecetaBuilder.INVIERNO,RecetaBuilder.PRIMAVERA,RecetaBuilder.VERANO,RecetaBuilder.OTOÑO,RecetaBuilder.TODOELAÑO]
	}
	
	def filtrar(List<Receta> recetas){
		
		this.filtrarPorNombre
		this.filtrarPorDificultad
		this.filtrarPorIngrediente
		this.filtrarPorCalorias
		this.filtrarPorTemporada
		this.filtrarPorFiltroUsuario
			
	}
	
	def filtrarPorNombre(){
		if(!(nombre == null)){
			busquedaFinal.agregarFiltro(new FiltroPorNombre(nombre))
		}
	}

	def filtrarPorDificultad(){
		if(!(dificultad == null)){
			busquedaFinal.agregarFiltro(new FiltroPorDificultad(dificultad))
		}
	}
	
	def filtrarPorIngrediente(){
		if(!(ingrediente == null)){
			busquedaFinal.agregarFiltro(new FiltroPorIngrediente(ingrediente))
		}
	}
	
	def filtrarPorTemporada(){
		if(!(temporada == null)){
			busquedaFinal.agregarFiltro(new FiltroPorTemporada(temporada))
		}
	}
	
	def filtrarPorCaloriasMinimas(){
		if(!(caloriasMinimas == null)){
			busquedaFinal.agregarFiltro(new FiltroPorCaloriasMaximas(caloriasMinimas))
		}
	}		

	def filtrarPorCaloriasMaximas(){
		if(!(caloriasMaximas == null)){
			busquedaFinal.agregarFiltro(new FiltroPorCaloriasMaximas(caloriasMaximas))
		}
	}	
}