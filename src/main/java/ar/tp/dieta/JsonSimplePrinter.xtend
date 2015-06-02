package ar.tp.dieta

import org.json.simple.JSONArray
import org.json.simple.JSONObject

class JsonSimplePrinter {

	//Agregar una sola receta    
    public def void printUnaSolaReceta(Receta unaReceta){
    	var JSONArray recetasJson = new JSONArray()
    	this.agregarRecetaAJson(recetasJson, unaReceta)
    	System.out.println(recetasJson)
    }
    
    //Agregar una lista de recetas
    public def void printListaDeRecetas(Iterable<Receta> listaDeRecetas){
		val JSONArray recetasJson = new JSONArray()
		listaDeRecetas.forEach[ receta | this.agregarRecetaAJson(recetasJson, receta)]
	    System.out.println(recetasJson);
	}
	
	protected def void agregarRecetaAJson(JSONArray unArrayJson, Receta unaReceta){
		unArrayJson.add(this.formatRecetas(unaReceta))
	}

    protected def formatRecetas(Receta unaReceta){
        var StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append(JSONObject.escape("Nombre"));
		sb.append(":");
		sb.append("\"" + JSONObject.escape(unaReceta.nombreDeLaReceta) + "\"");
		sb.append(",");
		sb.append(JSONObject.escape("Lista de Ingredientes"));
		sb.append(":");
		sb.append(unaReceta.ingredientesAString);
        sb.append(",");
		sb.append(JSONObject.escape("Tiempo de preparacion"));
		sb.append(":");
		sb.append(unaReceta.tiempoPreparacion);
        sb.append(",");
		sb.append(JSONObject.escape("Calorias"));
		sb.append(":");
		sb.append(unaReceta.calorias);
        sb.append(",");
		sb.append(JSONObject.escape("Dificultad"));
		sb.append(":");
		sb.append(unaReceta.dificultadDePreparacion);
        sb.append(",");
		sb.append(JSONObject.escape("Autor"));
		sb.append(":");
		sb.append(unaReceta.autor)
		sb.append(",");
		sb.append(JSONObject.escape("Año de creacion"));
		sb.append(":");
		sb.append(unaReceta.añoDeCreacion)
		sb.append("}");
        return sb.toString();
    }
}
