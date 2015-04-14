package ar.tp.dieta

import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	int edad
	double peso
	double altura
	Date fechaDeNacimiento
	String sexo
	String nombre
	List<String> preferenciasAlimenticias
	List<String> comidasQueDisgustan
	List<String> condicionesPreexistentes
	Rutina rutina
	List<Receta> recetas

	def soyValido() {
		if ((noTengoPeso || noTengoAltura || malaFechaDeNacimiento || noTengoRutina || soyDiabeticoSinSexo ||
			sinNombreONombreCorto || soyHipertensoODiabeticoSinPreferencia || soyVeganoConMalasPreferencias) == true) {
				false
			}
		}

		def noTengoPeso() {
			peso == 0
		}

		def noTengoAltura() {
			altura == 0
		}

		def malaFechaDeNacimiento() {
			fechaDeNacimiento.before(new Date())
		}

		def noTengoRutina() {
			rutina == null
		}

		def soyDiabeticoSinSexo() {
			(condicionesPreexistentes.contains("diabetico") && sexo == null
			)
		}

		def soyHipertensoODiabeticoSinPreferencia() {
			((condicionesPreexistentes.contains("diabetico") || condicionesPreexistentes.contains("hipertenso")) &&
				preferenciasAlimenticias.size == 0
			)
		}

		def sinNombreONombreCorto() {
			(nombre.length <= 4
			)
		}

		/*		def soyVeganoConMalasPreferencias() {
		 * 			(condicionesPreexistentes.contains("vegano") && preferenciasAlimenticias.exists([ingrediente |  ingrediente.getNombre() == "pollo" ||
		 * 																											ingrediente.getNombre() == "carne" ||
		 * 																											ingrediente.getNombre() == "chivito" ||
		 * 																											ingrediente.getNombre() == "chori"]))
		 * 			
		 * 								
		 * 		}
		 * 
		 */
		 
		 def soyVeganoConMalasPreferencias() {
		(condicionesPreexistentes.contains("vegano") && (preferenciasAlimenticias.contains("carne") || preferenciasAlimenticias.contains("chori") ||
					preferenciasAlimenticias.contains("chivito") || preferenciasAlimenticias.contains("pollo")))
				}
		 
		def indiceDeMasaCorporal() {
			peso / (Math.pow(altura,2))
		}

		def noTengoCondiciones() {
			if (condicionesPreexistentes.size == 0) {
				true
			}
		}

		def meGustaLaFruta() {
			if (preferenciasAlimenticias.contains("fruta") == true) {
				true
			}

		}

		def soyVegano() {
			condicionesPreexistentes.contains("vegano")
		}

		def soyHipertenso() {
			condicionesPreexistentes.contains("hipertenso")
		}

		def soyDiabetico() {
			condicionesPreexistentes.contains("diabetico")
		}

		def soyCeliaco() {
			condicionesPreexistentes.contains("celiaco")
		}

		def rutinaSaludable() {
			rutina.rutinaSaludable(this)
		}

		def agregarReceta(String nombre, String proceso, int calorias, String dificultad, String epoca) {

			var Receta receta = new Receta(nombre, proceso, calorias, dificultad, epoca)

			receta.agregarCondimentos()
			receta.agregarIngredientes()
			
			

			if((receta.getCalorias() >= 10 && receta.getCalorias() <=5000) && receta.tieneIngredientes()){
				 recetas.add(receta)
			}
		}
		
		def puedeModificarReceta(Receta receta){
			receta.creador == this
		}
		
		def puedeVerReceta(Receta receta){
			(receta.creador == this || receta.esPublica())
		}
		
		def modificarReceta(Receta receta){
			if (this.puedeVerReceta(receta) && this.puedeModificarReceta(receta)){				
				
				receta.creador = this  // implementar la modificacion de cada uno de los campos
				}
		}
		

	}




