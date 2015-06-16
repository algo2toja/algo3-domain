package ar.tp.dieta

import ar.tp.dieta.Accion
import queComemos.entrega3.repositorio.BusquedaRecetas
import java.util.List

class AgregaResultadosAFavoritos implements Accion {
	
	override execute(Usuario usuario, BusquedaRecetas busqueda, List<String> nombresRecetas) {
		if(usuario.resultadoDeConsultasAFavoritos){
			nombresRecetas.forEach[ receta | usuario.agregarRecetaFavorita(receta) ]
		}
	}
	
}