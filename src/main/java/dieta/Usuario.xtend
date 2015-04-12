package dieta

import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	int edad
	int peso
	int altura
	Date fechaDeNacimiento
	String sexo
	String nombre
	List<String> preferenciasAlimenticias
	List<String> comidasQueDisgustan
	List<String> condicionesPreexistentes
	Rutina rutina
	List<Receta> recetas

	def soyValido(){
		if((noTengoPeso || noTengoAltura || malaFechaDeNacimiento || noTengoRutina || soyDiabeticoSinSexo || sinNombreONombreCorto || soyHipertensoODiabeticoSinPreferencia || soyVeganoConMalasPreferencias) == true){
			false	
		}
	}
	
	def noTengoPeso(){
		if(peso == 0){
			true
		}
	}
	
	def noTengoAltura(){
		if(altura == 0){
			true
		}
	}		
		
	def malaFechaDeNacimiento(){
		if((fechaDeNacimiento == 0 || (fechaActual - fechaDeNacimiento <=0)) == true){//FALTA TERMINAR TEMA DE FECHAS
			true
		}
	}
	
	def noTengoRutina(){
		if(rutina == null){
			true
		}
	}
	
	def soyDiabeticoSinSexo(){
		if(condicionesPreexistentes.contains("diabetico") && sexo == null){
			true
		}
	}
	
	def soyHipertensoODiabeticoSinPreferencia(){
		if((condicionesPreexistentes.contains("diabetico") || condicionesPreexistentes.contains("hipertenso")) && preferenciasAlimenticias.size == 0){
			true
		}
	}
	
	def sinNombreONombreCorto(){
		if(nombre.length <= 4){
			true
		}
	}
	
	def soyVeganoConMalasPreferencias(){
		if((condicionesPreexistentes.contains("vegano") && (preferenciasAlimenticias.contains("carne") || preferenciasAlimenticias.contains("chori") || preferenciasAlimenticias.contains("chivito") || preferenciasAlimenticias.contains("pollo")))==true){
			true
		}
	}
	
	def indiceDeMasaCorporal(){
		peso/(altura*altura)
	}
	
	def noTengoCondiciones(){
		if(condicionesPreexistentes.size==0){
			true			
		}
	}
	
	def meGustaLaFruta(){
		if(preferenciasAlimenticias.contains("fruta") == true){
			true			
		}
		
	}
	
	def soyVegano(){
		condicionesPreexistentes.contains("vegano")
	}

	def soyHipertenso(){
		condicionesPreexistentes.contains("hipertenso")
	}
	
	def soyDiabetico(){
		condicionesPreexistentes.contains("diabetico")
	}
	
	def soyCeliaco(){
		condicionesPreexistentes.contains("celiaco")
	}

	def rutinaSaludable(){
		rutina.rutinaSaludable(this)
	}

	def nuevaReceta(){
		
	}


}


