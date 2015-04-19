package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.GregorianCalendar
import java.util.Calendar

@Accessors
class Usuario {
		Double peso
		Double altura
		GregorianCalendar fechaDeNacimiento
		GregorianCalendar diaDeHoy
        int diaDelMes
        int mes
        int ano
		String sexo
		String nombre
		Rutina rutina
		List<Condicion> condicionesPreexistentes
		List<String> preferencias
		List<String> malasPreferencias
		List<String> cosasQueNoMeGustan

		new(double peso, double altura, int diaDelMes, int mes, int ano, String sexo, String nombre, Rutina unaRutina){
			setPeso(peso)
			setAltura(altura)
	        fechaDeNacimiento.set(ano, mes, diaDelMes)
	        setSexo(sexo)
			setNombre(nombre)
			setRutina(unaRutina)
		}
		
				
		def validarFechaDeNacimiento(){
			(this.getFechaDeNacimiento != null) && (this.getFechaDeNacimiento != (this.getDiaDeHoy))
		}
		
		def getDiaDeHoy(){
			//Seteo el dia de la fecha en el momento que se pide validar, y devuelvo el dia de la fecha
			diaDeHoy.set(Calendar.YEAR, Calendar.MONTH, Calendar.DAY_OF_MONTH)
			diaDeHoy
		}
		 
		def void agregarCondicion(Condicion unaCondicion) {
			condicionesPreexistentes.add(unaCondicion)
		}
		
		def void establecerRutina(Rutina unaRutina){
			rutina = unaRutina
		}
		
		def void agregarPreferencia(String unaComida){
			preferencias.add(unaComida)
		}
		
		def void agregarComidaQueNoMeGusta(String unaComida){
			cosasQueNoMeGustan.add(unaComida)
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
			condicionesPreexistentes.exists( [ condicion | condicion.esDiabetes() ] )
		}

		def validarSexo() {
			//T o F si esta seteado el sexo.
			(this.getSexo != null)
		}

		//Punto 1. Validaciones.
				
		def validarNombre(){
			//Nombre debe existir y debe ser mayor a 4 letras.
			(getNombre != null) && (this.getNombre.length>4)
		}

		def validarPeso(){
			(this.getPeso != null)
		}
		
		def validarAltura(){
			(this.getAltura != null)
		}

		def validarRutina(){
			(this.getRutina != null)
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
			preferencias.exists[ comida | comida == "carne" || comida == "chori" || comida == "chivito" || comida == "pollo"]
		}
		
		//Revisa si se cumple soyVegano y si no le gusta la carne
		def soyVeganoYTengoBuenasPreferencias(){
			(this.soyVegano() && !meGustaLaCarne)
			
		}
		
}