package ar.tp.dieta

import com.google.gson.JsonParser
import com.google.gson.JsonElement
import com.google.gson.JsonArray
import com.google.gson.JsonObject

class JsonSimpleReader {
		
	public def parseJson(String recetaString){
		var JsonArray jsonArray = this.stringToJsonArray(recetaString)
		var JsonObject jobject = jsonArray.get(0).getAsJsonObject()
		return jobject.get("nombre").toString()
    	
	}
	
	protected def stringToJsonArray(String aString){
		var JsonParser parser = new JsonParser()
		var JsonElement tradeElement = parser.parse(aString)
		return tradeElement.getAsJsonArray()
	}
}