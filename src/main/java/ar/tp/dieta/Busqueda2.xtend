package ar.tp.dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Busqueda2 {

	String dificultad
	String nombre
	String ingrediente
	Integer caloriasMinimas
	Integer caloriasMaximas
	String temporada
	
	def List<String> getDificultades(){
		#[RecetaBuilder.FACIL,RecetaBuilder.MEDIA,RecetaBuilder.DIFICIL]
	}
	
	def List<String> getTemporadas(){
		#[RecetaBuilder.INVIERNO,RecetaBuilder.PRIMAVERA,RecetaBuilder.VERANO,RecetaBuilder.OTOÑO,RecetaBuilder.TODOELAÑO]
	}
}