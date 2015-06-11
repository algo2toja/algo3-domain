package ar.tp.dieta

import com.google.gson.JsonArray
import com.google.gson.JsonElement
import com.google.gson.JsonParser
import com.google.gson.JsonObject
import com.google.gson.Gson
import java.util.Map
import com.google.gson.GsonBuilder
import org.eclipse.xtend.lib.macro.declaration.Type
import java.util.List
import com.google.gson.reflect.TypeToken
import queComemos.entrega3.creacionales.RecetaBuilder

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
		var RecetaBuilder receta = gson.fromJson(jsonArray, RecetaBuilder)            
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