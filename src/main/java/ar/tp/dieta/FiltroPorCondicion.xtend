package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorCondicion implements Filtro {
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetas){
		recetas.forEach[receta | if(receta.esInadecuadaParaUsuario(unUsuario)){
			recetas.remove(receta)}]
		recetas
		
		}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
		val List<Receta> recetasFiltradas = new ArrayList<Receta>
		recetasSinFiltrar.forEach[receta | if(!receta.esInadecuadaParaGrupo(unGrupo)){
			recetasFiltradas.add(receta)
			}
		]
		recetasFiltradas
	}
		
}