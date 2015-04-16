package ar.tp.dieta

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Usuario {
	double peso
	double altura
	Date fechaNacimiento
	String sexo
	String nombre
	List<Condicion> condicionesPreexistentes
	List<String> preferencias
	List<String> cosasQueNoMeGustan
	
//	new(double peso, double altura, Date fechaNacimiento, String sexo, String nombre)
	
	//poner en 0
	
//	def validar(double peso, double altura, Date fechaNacimiento, sexo, nombre){
		//implementar if
		
//	}
	
	def void agregarCondicion(Condicion unaCondicion){
		condicionesPreexistentes.add(unaCondicion)
	}
	
	def soyHipertensoODiabetico(){
		if( this.soyHipertenso() || this.soyDiabetico() ){ //
			preferencias.size !=		
		}
	}
	
	def soyHipertenso(){
		condicionesPreexistentes.exists[ condicion | condicion.esHipertension() ]
	}
	
	def soyDiabetico(){
		if(condicionesPreexistentes.exists[ condicion | condicion.esDiabetes() ]){
			this.validarSexo()
		}
	}
	
	def validarSexo(){
		//Tiene que devolver true o false segun el atributo sexo este seteado o no.
	}
	
	
	def indiceDeMasaCorporal() {
		peso / (Math.pow(altura,2))
	}
	
}