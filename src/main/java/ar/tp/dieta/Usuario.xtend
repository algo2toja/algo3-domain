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
		String rutina
		List<Condicion> condicionesPreexistentes
		List<String> preferencias
		List<String> cosasQueNoMeGustan

		new(double peso, double altura, Date fechaNacimiento, String sexo, String nombre){
			setAltura(altura)
			setFechaNacimiento(fechaNacimiento)
			setSexo(sexo)
			setNombre(nombre)
			setRutina(rutina)
		}
		
		def void agregarCondicion(Condicion unaCondicion) {
			condicionesPreexistentes.add(unaCondicion)
		}

		def indiceDeMasaCorporal() {
			peso / (Math.pow(altura, 2))
		}		
		
		def boolean meGustaLaFruta(){
			preferencias.contains("frutas")
		}
		
		
		def todasLasValidaciones() {
		}

		def camposObligatorios() {
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
		
		def subsanaTodasLasCondiciones(){
			//T o F. Segun si las condiciones preexistentes estan subsanadas.
			!condicionesPreexistentes.exists[condicion | !condicion.seSubsana(this)]
		}
		

		

}