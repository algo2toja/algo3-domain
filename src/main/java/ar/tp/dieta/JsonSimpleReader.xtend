package ar.tp.dieta

import com.google.gson.JsonParser
import com.google.gson.JsonElement
import com.google.gson.JsonArray
import com.google.gson.JsonObject

class JsonSimpleReader {
		
	public def parseJsonNombre(String recetaString){
		var JsonArray jsonArray = this.stringToJsonArray(recetaString)
		var JsonObject jobject = jsonArray.get(0).getAsJsonObject()
		return jobject.get("nombre").toString()
    	
	}
	
	public def parseJsonDificultad(String recetaString){
		var JsonArray jsonArray = this.stringToJsonArray(recetaString)
		var JsonObject jobject = jsonArray.get(0).getAsJsonObject()
		return jobject.get("dificultadReceta").toString()
    	
	}
	
	protected def stringToJsonArray(String aString){
		var JsonParser parser = new JsonParser()
		var JsonElement tradeElement = parser.parse(aString)
		return tradeElement.getAsJsonArray()
	}
}