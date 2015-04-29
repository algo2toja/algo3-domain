package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.GregorianCalendar
import java.util.ArrayList


//ENTREGA 1
@Accessors
class Usuario {
	Double peso
	Double altura
	GregorianCalendar fechaDeNacimiento
	GregorianCalendar diaDeHoy
	String sexo
	String nombre
	Rutina rutina
	List<Condicion> condicionesPreexistentes = new ArrayList<Condicion>
	List<String> preferencias = new ArrayList<String>
	List<String> cosasQueNoMeGustan = new ArrayList<String>
	List<Receta> misRecetas = new ArrayList<Receta>
	val String[] carnes = #["carne", "chivito", "chori"]
	val String[] frutas = #["kiwi", "manzana", "pera"]
	
	new(String unNombre, Double unPeso, Double unaAltura,Rutina unaRutina,GregorianCalendar unaFechaDeNacimiento,List<Condicion> CondicionesPreexistentes,List<String> preferencias){
		
		if(!validacionUsuario(unNombre, unPeso, unaAltura, unaRutina, unaFechaDeNacimiento, CondicionesPreexistentes,preferencias)){
			throw new BusinessException("El usuario no es valido")
		}
		peso = unPeso
		altura = unaAltura
		nombre = unNombre
		rutina = unaRutina
	 	fechaDeNacimiento= unaFechaDeNacimiento
	 	condicionesPreexistentes = new ArrayList<Condicion>
	 	preferencias = new ArrayList<String>
	 	misRecetas = new ArrayList<Receta>
	 	sexo = null
		condicionesPreexistentes.validarUsuario(this)
	}
	
	new(String unNombre, Double unPeso, Double unaAltura,Rutina unaRutina,GregorianCalendar unaFechaDeNacimiento,List<Condicion> CondicionesPreexistentes,List<String> preferencias,String unSexo){
		if(!validacionUsuario(unNombre, unPeso, unaAltura, unaRutina, unaFechaDeNacimiento, CondicionesPreexistentes,preferencias)){
			throw new BusinessException("El usuario no es valido")
		}
		peso = unPeso
		altura = unaAltura
		nombre = unNombre
		rutina = unaRutina
	 	fechaDeNacimiento= unaFechaDeNacimiento
	 	condicionesPreexistentes = new ArrayList<Condicion>
	 	preferencias = new ArrayList<String>
	 	misRecetas = new ArrayList<Receta>
	 	sexo = unSexo
		condicionesPreexistentes.validarUsuario(this)
	}
	def boolean meGustaLaCarne(){
		preferencias.contains(carnes)
	}
	
	def boolean meGustaLaFruta(){
		preferencias.contains(frutas)
	}
	
	// Metodo de validacion final
	def validarCampos(String unNombre, Double unPeso, Double unaAltura,Rutina unaRutina,GregorianCalendar unaFechaDeNacimiento,List<Condicion> CondicionesPreexistentes) {
		!((this.validarNombre(unNombre)) && (this.validarPeso(unPeso)) && (this.validarAltura(unaAltura)) && (this.validarRutina(unaRutina)) &&
			(this.validarFechaDeNacimiento(unaFechaDeNacimiento))
		)

	}

	def boolean validarRutina(Rutina rutina) {
		(rutina.equals(null))
	}

	def boolean validarNombre(String nombre) {
		(nombre.equals(null) && nombre.length() <= 4)
	}

	def boolean validarPeso(double peso) {
		(peso == 0)
	}

	def boolean validarAltura(double altura) {
		(altura == 0)
	}

	def validarFechaDeNacimiento(GregorianCalendar fechaDeNacimiento) {
		((fechaDeNacimiento.equals(null)) && (0 <= fechaDeNacimiento.compareTo(this.getDiaDeHoy)))
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
			this.validarIMC()
		} else
			this.subsanaTodasLasCondiciones
	}
	
	def validarIMC() {
		(18 >= this.indiceDeMasaCorporal) && (this.indiceDeMasaCorporal <= 30)
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

	/*def meGustaComida(Preferencia unaComida) {
		preferencias.contains(unaComida)
	}*/
	
	// Punto 1 y 2 validacion usuario
	def validacionUsuario(String unNombre, Double unPeso, Double unaAltura,Rutina unaRutina,GregorianCalendar unaFechaDeNacimiento,List<Condicion> CondicionesPreexistentes,List<String> preferencias) {
		(this.validarCampos(unNombre, unPeso, unaAltura, unaRutina, unaFechaDeNacimiento, CondicionesPreexistentes) && this.diabeticoConSexo() && this.validarDiabetesEHipertensionConPrefencias() &&
			this.soyVeganoYTengoBuenasPreferencias()
		)
	}

	def subsanaTodasLasCondiciones() {
		// T o F. Segun si las condiciones preexistentes estan subsanadas.
		(condicionesPreexistentes.exists[ condicion | !condicion.seSubsana(this) ])
			
	}

	// Punto 3 usuario validacion usuario
	def soyDiabetico() {
		// T o F. si existe condicion en condicionesPreexistentes que cumpla con diabetico
		condicionesPreexistentes.exists([condicion|condicion.esDiabetes()])
	}

	def validarSexo() {
		// T o F si esta seteado el sexo.
		(sexo != null)
	}

	def diabeticoConSexo() {
		// T o F si se cumplen simultaneamente diabetico y sexo seteado.
		!this.soyDiabetico() || ((this.soyDiabetico() && this.validarSexo()))
	}

	def soyHipertenso() {

		// T o F. si existe condicion en condicionesPreexistentes que cumpla con hioertenso
		condicionesPreexistentes.exists[condicion|condicion.esHipertension()]
	}

	def validarDiabetesEHipertensionConPrefencias(){
		// T o F. Evalua si es (diabetico o hipertenso) y no tiene preferencias
		if( ((this.soyHipertenso) || (this.soyDiabetico()) && (preferencias.empty)) ){
			throw new BusinessException("La fecha ingresada es incorrecta")
		}
			true
	}
	
	// Revisa si se cumple soyVegano y si no le gusta la carne
	def soyVeganoYTengoBuenasPreferencias() {
		if((this.soyVegano() && this.meGustaLaFruta())){
			throw new BusinessException("Sos vegano y carnivoro. Asesino!")	
		}
		true
	}

	def soyVegano() {
		// T o F. si existe condicion en condicionesPreexistentes que cumpla con vegano
		condicionesPreexistentes.exists[condicion|condicion.esVegano]
	}

	def rutinaEsIntensiva() {
		rutina.rutinaEsIntensiva
	}

	def rutinaEsActiva() {
		rutina.rutinaEsActiva
	}
	
	//Copiar una recetaPublica a la coleccion de recetas del usuario
	def void agregarRecetaPublicaAMiColeccion(String nombreReceta, RecetarioPublico recetario) {
		var Receta recetaNueva = new Receta
		misRecetas.add(recetario.copiarReceta(recetaNueva, nombreReceta))
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
		]

		misRecetas.add(nuevaReceta)
	}

	// Devuelve una receta buscandola por su nombre.
	def devolverReceta(String nombre) {
		var Receta receta = misRecetas.findFirst[receta|receta.devolverNombre == nombre]
		if (receta.equals(null)) {
			throw new BusinessException("No existe la receta en la lista de recetas.")
		}
		receta
	}
	
	//Devuelve una subreceta
	def devolverSubReceta(String nombreReceta,String nombreSubreceta){
		
		var Receta subreceta = devolverReceta(nombreReceta).subRecetas.findFirst[subreceta | subreceta.devolverNombre == nombreSubreceta] 
		if(subreceta.equals(null)){
			throw new BusinessException("No existe la subreceta en la lista de subrecetas.")
		}
		subreceta
	}

	// Modificacion de receta.
	def void modificarReceta(String nombreOriginal, String nombreNuevo, int calorias, String proceso,
		String dificultad, String temporada) {
	
		var Receta nuevaReceta = new Receta
		nuevaReceta = devolverReceta(nombreOriginal) //nuevaReceta ahora apunta a la receta buscada (si es que existe)
		
		nuevaReceta =>[
			setProcesoDePreparacion(proceso)
			setCalorias(calorias)
			setDificultadDePreparacion(dificultad)
			setTemporadaALaQueCorresponde(temporada)
			cambiarNombre(nombreNuevo)
		]
	}

}