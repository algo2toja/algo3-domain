package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List

@Accessors
class FiltroBase implements Filtro{
	
	List<Receta> recetasFiltradas = new ArrayList<Receta>

	override getRecetasFromUsuario(Usuario unUsuario) {
		recetasFiltradas = unUsuario.recetasQuePuedoVer()
	}
		
	override getRecetasFromGrupo(Grupo unGrupo) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override aplicarFiltro(Usuario unUsuario) {
		getRecetasFromUsuario(unUsuario)
		recetasFiltradas
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo){
		recetasFiltradas = unGrupo.devolverRecetas
	}
	
	override getFiltro() {
		this
	}

}