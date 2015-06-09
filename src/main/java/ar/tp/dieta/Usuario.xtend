package ar.tp.dieta

import java.util.ArrayList
import java.util.Calendar
import java.util.GregorianCalendar
import java.util.Iterator
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.dominio.Dificultad
import queComemos.entrega3.repositorio.BusquedaRecetas
import queComemos.entrega3.repositorio.RepoRecetas

//ENTREGA 1
@Accessors
class Usuario extends Miembro {
	Double peso
	Double altura
	GregorianCalendar fechaDeNacimiento
	GregorianCalendar diaDeHoy
	String sexo
	Rutina rutina
	List<Condicion> condicionesPreexistentes = new ArrayList<Condicion>
	List<String> comidasQueNoMeGustan = new ArrayList<String>
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Grupo> misGrupos = new ArrayList<Grupo>
	List<Receta> recetasFavoritas = new ArrayList<Receta>
	BusquedaRecetas busqueda = new BusquedaRecetas
	Registro registro
	
	// Punto 1 y 2 validacion usuario
	public def validacionUsuario() {
		(this.validarCampos() && this.condicionesValidas())
	}
	
	// Metodo de validacion final
	protected def validarCampos() {
		((this.validarNombre) && (this.validarPeso) && (this.validarAltura) && (this.validarRutina) && (this.validarFechaDeNacimiento))
	}

	protected def boolean validarRutina() {
		!(rutina.equals(null))
	}

	protected def boolean validarNombre(){
		!(nombre.equals(null) && (nombre.length<=4))
	//Probar solo con funcion length
	}

	protected def boolean validarPeso() {
		!peso.equals(0)
	}

	protected def boolean validarAltura() {
		!altura.equals(0)
	}

	protected def validarFechaDeNacimiento() {
		!((fechaDeNacimiento.equals(null)) && (0 <= fechaDeNacimiento.compareTo(this.getDiaDeHoy)))
	}

	public def setFechaDeNacimiento(int ano, int mes, int diaDelMes) {
		fechaDeNacimiento = new GregorianCalendar(ano, mes, diaDelMes)
	}

	protected def getDiaDeHoy() {
		// Seteo el dia de la fecha en el momento que se pide validar, y devuelvo el dia de la fecha
		// diaDeHoy = new GregorianCalendar(Calendar.YEAR, Calendar.MONTH, Calendar.DAY_OF_MONTH)
		diaDeHoy = new GregorianCalendar()
	}

	// Calcular indice de masa corporal
	public def indiceDeMasaCorporal() {
		peso / (Math.pow(altura, 2))
	}
	
	protected def validarIMC() {
		(18 >= this.indiceDeMasaCorporal) && (this.indiceDeMasaCorporal <= 30)
	}

	public def boolean sigoUnaRutinaSaludable(){
		rutina.rutinaSaludable(this)
	} 
	
	//Agregar condiciones preexistentes
	public def void agregarCondicion(Condicion unaCondicion) {
		condicionesPreexistentes.add(unaCondicion)
	}

	public def void agregarPreferencia(String unaComida) {
		preferencias.add(unaComida)
	}

	public def void agregarComidaQueMeDisgusta(String unaComida) {
		comidasQueNoMeGustan.add(unaComida)
	}

	protected def subsanaTodasLasCondiciones() {
		// T o F. Segun si las condiciones preexistentes estan subsanadas.
		(condicionesPreexistentes.exists[ condicion | !condicion.seSubsana(this)])			
	}

	// Punto 3 usuario validacion usuario
	protected def boolean condicionesValidas(){
		!(condicionesPreexistentes.exists[condicion | condicion.validarCondicion(this).equals(false)])
	}

	protected def rutinaEsIntensiva() {
		rutina.rutinaEsIntensiva
	}

	protected def rutinaEsActiva() {
		rutina.rutinaEsActiva
	}
	
	protected def boolean meGustaLaCarne(){
		preferencias.contains("carne")
	}
	
	protected def boolean meGustaLaFruta(){
		preferencias.contains("fruta")
	}
	
	//Copiar una recetaPublica a la coleccion de recetas del usuario
	public def void agregarRecetaPublicaAMiColeccion(String nombreReceta) {
		var Receta recetaNueva = new Receta
		misRecetas.add(recetario.copiarReceta(recetaNueva, nombreReceta))
	}

	public def void agregarRecetaDeGrupo(Grupo unGrupo, String nombreReceta){
		var Receta recetaNueva = new Receta
		misRecetas.add(unGrupo.copiarReceta(this, unGrupo, recetaNueva,nombreReceta))
		
	}
		
	// Crear una receta privada
	public def void crearReceta(String nombre, double calorias, String proceso, String dificultad, String temporada) {
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
	public def devolverReceta(String nombre) {// tambien buscar sobre las que puede ver
		var Receta receta = misRecetas.findFirst[receta|receta.devolverNombre.equals(nombre)]
		if (receta.equals(null)) {
			throw new BusinessException("No existe la receta en la lista de recetas.")
		}
		receta
	}
	
	//Devuelve una subreceta
	public def devolverSubReceta(String nombreReceta,String nombreSubreceta){
		var ElementoDeReceta subReceta = devolverReceta(nombreReceta).elementosDeReceta.findFirst[subReceta | subReceta.getNombre.equals(nombreSubreceta)] 
		if(subReceta.equals(null)){
			throw new BusinessException("No existe la subreceta en la lista de subrecetas.")
		}
		subReceta
	}

	// Modificacion de receta.
	public def void modificarReceta(String nombreOriginal, String nombreNuevo, int calorias, String proceso,
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
	
	def boolean meConvieneReceta(Receta receta) {
		receta.esInadecuadaParaUsuario(this) 
	}
	
						////////////////////////RECETA FAVORITA//////////////////////////////
	def void agregarRecetaFavoritaDeRecetario(String nombre){
		recetasFavoritas.add(recetario.busquedaReceta(nombre))
	}
	
	def void agregarRecetaFavoritaDeGrupo(Grupo unGrupo, String nombre){
		recetasFavoritas.add(unGrupo.devolverRecetaDeMiembro(nombre))
	}

						//////////////////////RECETAS QUE PUEDO VER//////////////////////////
	def List<Receta> recetasQuePuedoVer(){
		val List<Receta> recetasQueVeo = new ArrayList<Receta>
		
		recetario.recetas.forEach[receta | recetasQueVeo.add(receta)]//esta probada
		
		misGrupos.forEach[grupo | recetasQueVeo.addAll[grupo.recetasDelGrupoPara(this).iterator]]
		
		recetasQueVeo.addAll[misRecetas.iterator]
		recetasQueVeo
	}
	
	def tePuedoSugerirEstaReceta(Receta receta){
		!(receta.esInadecuadaParaUsuario(this)) && !noMeGustaEstaReceta(receta)
		
	}
	
	def noMeGustaEstaReceta(Receta receta){
		(comidasQueNoMeGustan.exists[ingrediente | receta.elementosDeReceta.exists(elem | elem.getNombre.equals(ingrediente))])
	}
	
	def tieneSobrepeso() {
		indiceDeMasaCorporal >= 30
	}
	
	def boolean tenesEstaCondicion(Condicion unaCondicion){
		//Si existe un objeto de la misma clase que alguna de las condiciones en la coleccion condicionesPreexistentes, devuelvo true.
		condicionesPreexistentes.exists[ condicion | condicion.getClass().equals(unaCondicion.getClass()) ]
	}
	
	///////////////////////////////  METODOS PARA OBTENER RECETAS JSON //////////////////////////////////////////
	
	public def getRecetas(RepoRecetas repo, String nombre){
 		busqueda.setNombre(nombre)
 		val Receta receta = jsonReader(repo.getRecetas(busqueda))
 		this.actualizarRegistro(receta,busqueda)
		repo.getRecetas(busqueda)
 	}
 	
 	public def getRecetas(RepoRecetas repo, String nombre, Dificultad dificultad){
		busqueda => [
			setNombre(nombre)
			setDificultad(dificultad)
		]
		//observadores.forEach[it.actualizar(this,jsonReader(repo.getRecetas(busqueda))]
		this.actualizarRegistro(receta,busqueda)
		repo.getRecetas(busqueda)		
 	}
 	
 	public def getRecetas(RepoRecetas repo, String nombre, Dificultad dificultad, List<String> palabrasClave){
		busqueda => [
			setNombre(nombre)
			setDificultad(dificultad)
		]
		palabrasClave.forEach[ palabraClave | busqueda.agregarPalabraClave(palabraClave) ]
		//observadores.forEach[it.actualizar(this,jsonReader(repo.getRecetas(busqueda))]
		this.actualizarRegistro(receta,busqueda)
		repo.getRecetas(busqueda)
 	}
 	
/////////////////////////////////////ACTUALIZAR EL REGISTRO////////////////////////////// 	
/////////////////////AGREGAMOS EL COMPORTAMIENTO A LA CLASE USUARIO////////////////// 	

 	protected def actualizarRegistro(Receta receta, BusquedaRecetas busqueda){
 		//en lugar de una receta entera, se puede usar solo el nombre que devuelve el json
 		actualizarBusquedaPorHora()
 		actualizarBusquedaPorSexo(receta)
 		actualizarBusqueda(receta)
 		actualizarBusquedaPorVegano(busqueda)
 		registro.agregarNobreDeReceta(receta.devolverNombre)
 	}
	
	def actualizarBusqueda(Receta receta){
		registro.incrementarBusqueda(receta.devolverNombre)
	}
	
	def actualizarBusquedaPorVegano(BusquedaRecetas busqueda){
		if(this.tenesEstaCondicion(new CondicionVegano) && busqueda.getDificultad().equals("Dificil") && !busqueda.dificultad.equals(null)){
			registro.incrementarBusquedaPorVegano()
		}
		
	}
	
	def actualizarBusquedaPorSexo(Receta receta) {
		if(sexo.equals("M")){
			registro.incrementarBusquedaPorHombre(receta.devolverNombre)
		}else{
			registro.incrementarBusquedaPorMujer(receta.devolverNombre)
		}
	}
 	
 	protected def actualizarBusquedaPorHora(){
 		val Calendar calendario = new GregorianCalendar()
 		val int hora = calendario.get(Calendar.HOUR_OF_DAY)
 		registro.incrementarConsultaPorHora(hora)
 	
 	}

 	
 	///////////////////////////////////// METODO PARA FILTRAR BUSQUEDAS /////////////////////////////////////
 	
 	def List<Receta> busquedaFiltrada(){
		var List<Receta> recetasFiltradas = recetasQuePuedoVer()
	
		if(!misBusquedas.empty){
			var Iterator<Busqueda> iterBusqueda = misBusquedas.iterator()
	 		while(iterBusqueda.hasNext){
	   			recetasFiltradas = (iterBusqueda.next).aplicarBusquedaUsuario(this,recetasFiltradas)
			}
		}
		recetasFiltradas
	}
	
}