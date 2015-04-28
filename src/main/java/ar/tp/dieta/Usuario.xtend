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
	List<Condicion> condicionesPreexistentes = new ArrayList<Condicion>()
	List<Preferencia> preferencias = new ArrayList<Preferencia>
	List<String> cosasQueNoMeGustan = new ArrayList<String>
	List<Receta> misRecetas = new ArrayList<Receta>()

	// Metodo de validacion final
	def validarCampos() {
		((this.validarNombre) && (this.validarPeso) && (this.validarAltura) && (this.validarRutina) &&
			(this.validarFechaDeNacimiento)
		)

	}

	def boolean validarRutina() {
		if (rutina == null) {
			throw new BusinessException("La rutina no existe")
		}
		true
	}

	def boolean validarNombre() {
		if (nombre == null || nombre.length() <= 4) {
			throw new BusinessException("El nombre no fue ingresado o tiene menos de 4 caracteres.")
		}
		true
	}

	def boolean validarPeso() {
		if (peso == null) {
			throw new BusinessException("El peso no fue ingresado")
		}
		true
	}

	def boolean validarAltura() {
		if (altura == null) {
			throw new BusinessException("La altura no fue ingresada.")
		}
		true
	}

	def validarFechaDeNacimiento() {
		if ((fechaDeNacimiento == null) && (0 <= fechaDeNacimiento.compareTo(this.getDiaDeHoy))) {
			throw new BusinessException("La fecha ingresada es incorrecta")
		}
		true
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

	def void agregarPreferencia(Preferencia unaComida) {
		preferencias.add(unaComida)
	}

	def void agregarComidaQueNoMeGusta(String unaComida) {
		cosasQueNoMeGustan.add(unaComida)
	}

	/*def meGustaComida(Preferencia unaComida) {
		preferencias.contains(unaComida)
	}*/
	
	def meGustaLaFruta(){
		preferencias.exists[comida | comida.meGustaLaFruta()]
	}

	// Punto 1 y 2 validacion usuario
	def validacionUsuario() {
		(this.validarCampos() && this.diabeticoConSexo() && this.validarDiabetesEHipertensionConPrefencias() &&
			this.soyVeganoYTengoBuenasPreferencias()
		)
	}

	def subsanaTodasLasCondiciones() {
		// T o F. Segun si las condiciones preexistentes estan subsanadas.
		if(condicionesPreexistentes.exists[ condicion | !condicion.seSubsana(this) ]){
			throw new BusinessException("El usuario no subsana sus condiciones preexistentes.")
		}
		true
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
		if((this.soyVegano() && this.meGustaLaCarne())){
			throw new BusinessException("Sos vegano y carnivoro. Asesino!")	
		}
		true
	}

	def soyVegano() {
		// T o F. si existe condicion en condicionesPreexistentes que cumpla con vegano
		condicionesPreexistentes.exists[condicion|condicion.esVegano]
	}

	def meGustaLaCarne() {
		preferencias.exists[comida|comida.meGustaLaCarne()]
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