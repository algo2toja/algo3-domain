package ar.tp.dieta

import com.google.gson.Gson
import com.google.gson.JsonArray

class JsonSimpleReader {
		
	String nombre 
	String[] ingredientes
	int tiempoPreparacion
	int totalCalorias
	String dificultad
	String autor
	int anioReceta
	
	
	public def parseJson(String jsonArray){
		var Gson gson = new Gson()
		var queComemos.entrega3.dominio.Receta receta = gson.fromJson(jsonArray, queComemos.entrega3.dominio.Receta)            
		receta
	}
}

/*{
"nombre":"pure mixto",
"ingredientes": ["papa","zanahoria","calabaza","aceite"],
"tiempoPreparacion":0,
"totalCalorias":25,
"dificultadReceta":"MEDIANA",
"autor":"Yannick Benneteau",
"anioReceta":2015
}
 */