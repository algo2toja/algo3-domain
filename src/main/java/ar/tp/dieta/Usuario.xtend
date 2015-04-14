package ar.tp.dieta

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	double peso
	double altura
	Date fechaNacimiento
	String sexo
	String nombre
	List<Condicion> condicionesPreexistentes
	
	new(double peso,double altura,Date fechaNacimiento,String sexo,String nombre)
	
	//poner en 0
	
	def validar(double peso, double altura, Date fechaNacimiento, sexo, nombre){
		//implementar if
		
	}
	
	def soyDiabetico(){
		condicionesPreexistentes.exists(condicion|condicion.esDiabetes())//si devuelve true debe indicar sexo distinto de null
	}
	
	
		
		
		
	
	
	
	
	def indiceDeMasaCorporal() {
		peso / (Math.pow(altura,2))
	}
	
	
	
}