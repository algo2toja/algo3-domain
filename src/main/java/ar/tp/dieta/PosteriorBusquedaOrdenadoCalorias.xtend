package ar.tp.dieta

import ar.tp.dieta.PosteriorBusqueda
import java.util.List

class PosteriorBusquedaOrdenadoCalorias extends PosteriorBusqueda {
	
	override List<Receta> procesarBusqueda(List<Receta> recetasObtenidas){
		recetasObtenidas.sortBy[calorias]
	}
}