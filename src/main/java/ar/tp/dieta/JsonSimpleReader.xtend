package ar.tp.dieta

import com.google.gson.Gson
import com.google.gson.JsonElement
import com.google.gson.JsonParser
import com.google.gson.JsonObject
import com.google.gson.JsonArray
import java.util.ArrayList

class JsonSimpleReader {

	public def parseJson(String jsonArray){

		var JsonElement jElement = new JsonParser().parse(jsonArray)
		var JsonObject jsonObject = jElement.getAsJsonObject()
		jsonObject = jsonObject.getAsJsonObject("")
		var String nombre = jsonObject.getAsJsonArray("nombre").toString()
		var String ingredientes = jsonObject.getAsJsonArray("ingredientes").toString()
		var String tiempoPreparacion = jsonObject.getAsJsonArray("tiempoPreparacion").toString()
		var String totalCalorias = jsonObject.getAsJsonArray("totalCalorias").toString()
		var String dificultadReceta = jsonObject.getAsJsonArray("dificultadReceta").toString()
		var String autor = jsonObject.getAsJsonArray("ingredientes").toString()
		var String anioReceta = jsonObject.getAsJsonArray("anioReceta").toString()

		val String[] strings = #[nombre, ingredientes, tiempoPreparacion, totalCalorias, dificultadReceta, autor, anioReceta]
		println(strings)		
		
		/*
		    JsonElement jelement = new JsonParser().parse(jsonLine);
    JsonObject  jobject = jelement.getAsJsonObject();
    jobject = jobject.getAsJsonObject("data");
    JsonArray jarray = jobject.getAsJsonArray("translations");
    jobject = jarray.get(0).getAsJsonObject();
    String result = jobject.get("translatedText").toString();
    return result;


		String resultJSon = new Gson().toJson(result);
		return resultJSon;
 */
	}

}