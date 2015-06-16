package ar.tp.dieta

import com.google.gson.JsonArray
import com.google.gson.JsonParser
import com.google.gson.JsonElement
import java.util.ArrayList
import java.util.List

class JsonSimpleReader {
		
	public def parseJsonNombre(String recetaString){
		var List<String> nombresRecetas = new ArrayList<String>
		var JsonArray jsonArray = this.stringToJsonArray(recetaString)
		var int i=0
		while(i<jsonArray.size()){
			nombresRecetas.add(jsonArray.get(i).getAsJsonObject().get("nombre").toString())
			i++
		}
		nombresRecetas
	}
	
	protected def stringToJsonArray(String aString){
		var JsonParser parser = new JsonParser()
		var JsonElement tradeElement = parser.parse(aString)
		return tradeElement.getAsJsonArray()
	}
}