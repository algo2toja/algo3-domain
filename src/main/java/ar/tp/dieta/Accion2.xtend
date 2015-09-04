package ar.tp.dieta

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Accion2{
	
	public Map<Receta,Integer> recetasMasConsultadas = new HashMap<Receta,Integer>()
	public String nombreMaximo
	List<Receta> recetasAux = new ArrayList<Receta>
	//List<ContadorRecetas> contadores = new ArrayList<ContadorRecetas>
	List<Receta> recetasFinales = new ArrayList<Receta>

	def seRealizoBusqueda(List<Receta> recetas){
		recetas.forEach [ receta | if(!recetasMasConsultadas.containsKey(receta))
										{recetasMasConsultadas.put(receta,1)
										recetasAux.add(receta)	
										}
										else{recetasMasConsultadas.put(receta,recetasMasConsultadas.get(receta)+1)}
						]
		//this.ordenar
	}
	
	def ordenar(){
			
			val recetasTemporales = new ArrayList<Receta>
			val contadores = new ArrayList<ContadorRecetas>	
			recetasAux.forEach[ rec | contadores.add((new ContadorRecetas) => [
										receta = rec
										cantidad = recetasMasConsultadas.get(rec)])
								]
			contadores.sortBy[cantidad]
			contadores.forEach[ contador | recetasTemporales.add(contador.receta)]
			return recetasTemporales
	}

	def getRecetasFinales(){
		recetasFinales = this.ordenar
		return recetasFinales
	}
}

	