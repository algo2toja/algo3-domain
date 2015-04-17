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
		Rutina rutina
		List<Condicion> condicionesPreexistentes
		List<String> preferencias
		List<String> cosasQueNoMeGustan

		new(double peso, double altura, Date fechaNacimiento, String sexo, String nombre, Rutina unaRutina){
			setPeso(peso)
			setAltura(altura)
			setFechaNacimiento(fechaNacimiento)
			setSexo(sexo)
			setNombre(nombre)
			setRutina(unaRutina)
		}
		
		def void agregarCondicion(Condicion unaCondicion) {
			condicionesPreexistentes.add(unaCondicion)
		}

		def indiceDeMasaCorporal() {
			peso / (Math.pow(altura, 2))
		}		
		
		def meGustaComida(String unaComida){
			preferencias.contains(unaComida)
		}
		
		
		def todasLasValidaciones() {
		}

		def camposObligatorios() {
 		}
 		
 		def subsanaTodasLasCondiciones(){
			//T o F. Segun si las condiciones preexistentes estan subsanadas.
			!condicionesPreexistentes.exists[condicion | !condicion.seSubsana(this)]
		}

		//Punto 3 usuario.
		def soyDiabetico() {

			// T o F. si existe condicion en condicionesPreexistentes que cumpla con diabetico
			condicionesPreexistentes.exists([condicion|condicion.esDiabetes()])
		}

		def validarSexo() {

			//T o F si esta seteado el sexo.
			(this.sexo != null)

		}

		def diabeticoConSexo() {

			// T o F si se cumplen simultaneamente diabetico y sexo seteado.
			this.soyDiabetico() && this.validarSexo()
		}

	
		//Punto 4 Usuario.
		def soyHipertenso() {

			// T o F. si existe condicion en condicionesPreexistentes que cumpla con hioertenso
			condicionesPreexistentes.exists[condicion|condicion.esHipertension()]
		}

		def soyHipertensoODiabeticoYTienePreferenciasAlimenticias() {

			//T o F. Evalua si es (diabetico o hipertenso) tiene que tener preferencias
			if ( this.soyHipertenso() || this.soyDiabetico()) {
				!(preferencias.empty)
			}
			 else true
		}
		
		//Punto 5 Usuario
		def soyVegano(){
			
			//T o F. si existe condicion en condicionesPreexistentes que cumpla con vegano
			condicionesPreexistentes.exists[condicion | condicion.esVegano]
		}
		//Revisa si en la coleccion preferencias esta carne, pollo, chivito o chori
		def meGustaLaCarne(){
			preferencias.exists[comida | comida == "carne" || comida == "chori" || comida == "chivito" || comida == "pollo"]
		}
		
		//Revisa si se cumple soyVegano y si no le gusta la carne
		def soyVeganoYTengoBuenasPreferencias(){
			(this.soyVegano() && !meGustaLaCarne)
			
		}


}