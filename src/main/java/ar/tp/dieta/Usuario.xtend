package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.GregorianCalendar
import java.util.ArrayList

@Accessors
class Usuario {
	Double peso
	Double altura
	GregorianCalendar fechaDeNacimiento
	GregorianCalendar diaDeHoy
	String sexo
	String nombre
	Rutina rutina
	List<Condicion> condicionesPreexistentes = new ArrayList<Condicion>()

	List<String> preferencias
	List<String> malasPreferencias
	List<String> cosasQueNoMeGustan
	List<Receta> misRecetas = new ArrayList<Receta>()

	// Metodo de validacion final
	def validarUsuario() {
		((this.validarNombre) && (this.validarPeso) && (this.validarAltura) && (rutina != null) &&
			(this.validarFechaDeNacimiento)
		)

	}

	def boolean validarNombre() {
		if (nombre == null || nombre.length() <= 4) {
			throw new IllegalArgumentException("El nombre no fue ingresado o tiene menos de 4 caracteres.")
		} else
			true
	}

	def boolean validarPeso() {
		if (peso == null) {
			throw new IllegalArgumentException("El peso no fue ingresado.")
		} else
			true
	}

	def boolean validarAltura() {
		if (altura == null) {
			throw new IllegalArgumentException("La altura no fue ingresada.")
		} else
			true
	}

	def validarFechaDeNacimiento() {
		(fechaDeNacimiento != null) && (0 > fechaDeNacimiento.compareTo(this.getDiaDeHoy))
	}

	def setFechaDeNacimiento(int ano, int mes, int diaDelMes) {
		fechaDeNacimiento = new GregorianCalendar(ano, mes, diaDelMes)
	}

	def getDiaDeHoy() {
		// Seteo el dia de la fecha en el momento que se pide validar, y devuelvo el dia de la fecha
		// diaDeHoy = new GregorianCalendar(Calendar.YEAR, Calendar.MONTH, Calendar.DAY_OF_MONTH)
		diaDeHoy = new GregorianCalendar()
	}

	// Calcular indice de masa corporal
	def indiceDeMasaCorporal() {
		peso / (Math.pow(altura, 2))
	}

	def sigoUnaRutinaSaludable() {
		if (condicionesPreexistentes.empty) {
			(18 >= this.indiceDeMasaCorporal) && (this.indiceDeMasaCorporal <= 30)
		} else
			this.subsanaTodasLasCondiciones
	}

	// Agregar condiciones preexistentes
	def void agregarCondicion(Condicion unaCondicion) {
		condicionesPreexistentes.add(unaCondicion)
	}

	def void establecerRutina(Rutina unaRutina) {
		rutina = unaRutina
	}

	def void agregarPreferencia(String unaComida) {
		preferencias.add(unaComida)
	}

	def void agregarComidaQueNoMeGusta(String unaComida) {
		cosasQueNoMeGustan.add(unaComida)
	}

	def meGustaComida(String unaComida) {
		preferencias.contains(unaComida)
	}

	// Punto 1 y 2 validacion usuario
	def todasLasValidaciones() {
		(validarUsuario() && diabeticoConSexo() && soyHipertensoODiabeticoYTienePreferenciasAlimenticias() &&
			soyVeganoYTengoBuenasPreferencias()
		)
	}

	def subsanaTodasLasCondiciones() {

		// T o F. Segun si las condiciones preexistentes estan subsanadas.
		!condicionesPreexistentes.exists[condicion|!condicion.seSubsana(this)]
	}

	// Punto 3 usuario validacion usuario
	def soyDiabetico() {

		// T o F. si existe condicion en condicionesPreexistentes que cumpla con diabetico
		condicionesPreexistentes.exists([condicion|condicion.esDiabetes()])
	}

	def validarSexo() {
		// T o F si esta seteado el sexo.
		(sexo != null
		)
	}

	def diabeticoConSexo() {

		// T o F si se cumplen simultaneamente diabetico y sexo seteado.
		!soyDiabetico() || ((this.soyDiabetico() && this.validarSexo()))
	}

	def soyHipertenso() {

		// T o F. si existe condicion en condicionesPreexistentes que cumpla con hioertenso
		condicionesPreexistentes.exists[condicion|condicion.esHipertension()]
	}

	def soyHipertensoODiabeticoYTienePreferenciasAlimenticias() {
		// T o F. Evalua si es (diabetico o hipertenso) tiene que tener preferencias
		if (this.soyHipertenso() || this.soyDiabetico()) {
			!(preferencias.empty)
		} else
			true
	}

	// Punto 5 Usuario validacion usuario
	def soyVegano() {

		// T o F. si existe condicion en condicionesPreexistentes que cumpla con vegano
		condicionesPreexistentes.exists[condicion|condicion.esVegano]
	}

	// Revisa si en la coleccion preferencias esta carne, pollo, chivito o chori
	def meGustaLaCarne() {
		preferencias.exists[comida|comida == "carne" || comida == "chori" || comida == "chivito" || comida == "pollo"]
	}

	// Revisa si se cumple soyVegano y si no le gusta la carne
	def soyVeganoYTengoBuenasPreferencias() {
		(this.soyVegano() && !this.meGustaLaCarne
		)

	}

	// Agregar una receta del recetario publico a mi coleccion personal
	def void agregarRecetaPublicaAMiColeccion(String nombreReceta, RecetarioPublico recetario) {
		//misRecetas.add(recetario.elegirReceta(nombreReceta))
		var Receta receta
		receta = recetario.elegirReceta(nombreReceta)
		misRecetas.add(receta)
	}

	def rutinaEsIntensiva() {
		rutina.rutinaEsIntensiva
	}

	def rutinaEsActiva() {
		rutina.rutinaEsActiva
	}

	// Crear una receta privada
	def void crearReceta(String nombre, double calorias, String proceso, String dificultad, String temporada) {
		var Receta nuevaReceta

		nuevaReceta = new Receta => [
			cambiarNombre(nombre)
			setCalorias(calorias)
			setProcesoDePreparacion(proceso)
			setDificultadDePreparacion(dificultad)
			setTemporadaALaQueCorresponde(temporada)
		/*List<Comida> ingredientes = new ArrayList<Comida>()
		 * List<Comida> condimentos = new ArrayList<Comida>()
		 List<Receta> subRecetas = new ArrayList<Receta>()*/
		]

		misRecetas.add(nuevaReceta)
	}

	// Devuelve una receta por el nombre (falta que tire error cuando no encuentra)
	def devolverReceta(String nombre) {
		var Receta receta = misRecetas.findFirst[receta|receta.devolverNombre == nombre]
		if ( receta != null){ receta }
	}

	// Modificacion de receta. Si el parametro no cambia, se debe ingresar un 0
	def void modificarReceta(String nombreOriginal, String nombreNuevo, double calorias, String proceso,
		String dificultad, String temporada) {

		if(calorias != 0) (devolverReceta(nombreOriginal)).setCalorias(calorias)
		if(proceso != "0") (devolverReceta(nombreOriginal)).setProcesoDePreparacion(proceso)
		if(dificultad != "0") (devolverReceta(nombreOriginal)).setDificultadDePreparacion(dificultad)
		if(temporada != "0") (devolverReceta(nombreOriginal)).setTemporadaALaQueCorresponde(temporada)
		if(nombreNuevo != "0") (devolverReceta(nombreOriginal)).cambiarNombre(nombreNuevo)

	}
}