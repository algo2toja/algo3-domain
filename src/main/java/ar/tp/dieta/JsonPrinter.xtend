package ar.tp.dieta

import org.json.simple.JSONArray
import java.util.List

class JsonSimplePrinter {

	//Agregar una sola receta    
    public def void printUnaSolaReceta(Receta unaReceta){
    	var JSONArray recetasJson = new JSONArray()
    	this.agregarRecetaAJson(recetasJson, unaReceta)
    }
    
    //Agregar una lista de recetas
    public def void printListaDeRecetas(List<Receta> listaDeRecetas){
		var JSONArray recetasJson = new JSONArray()
		listaDeRecetas.forEach[ receta | this.agregarRecetaAJson(recetasJson, receta)]
		System.out.println(recetasJson);
	}
	
	protected def void agregarRecetaAJson(JSONArray unArrayJson, Receta unaReceta){
		unArrayJson.add(unaReceta)

	}

}
