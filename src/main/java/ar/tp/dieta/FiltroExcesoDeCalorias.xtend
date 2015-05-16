package ar.tp.dieta

import java.util.List
import java.util.ArrayList

class FiltroExcesoDeCalorias extends FiltroDecorator {

	new(Filtro decorado) {
		super(decorado)
	}

	override aplicarFiltro(Usuario unUsuario) {
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
		recetasFiltradas.forEach[receta|
			if (!(unUsuario.tieneSobrepeso && receta.exesoDeCalorias)) {
				recetasFinal.add(receta)
			}]
		recetasFinal
	}

	override aplicarFiltroGrupo(Grupo unGrupo) {
		recetasFiltradas = decorado.aplicarFiltroGrupo(unGrupo)
		recetasFiltradas		
	}
}
