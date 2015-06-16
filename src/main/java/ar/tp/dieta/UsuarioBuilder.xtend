package ar.tp.dieta

import java.util.GregorianCalendar

class UsuarioBuilder {

	Usuario usuario
	
	new(String nombreUsuario){
		usuario = new Usuario()
		usuario.setNombre(nombreUsuario)
	}		

	public def UsuarioBuilder peso(Double peso){
		usuario.setPeso(peso)
		return this
	}
	
	public def UsuarioBuilder email(String email){
		usuario.setDireccionCorreo(email)
		return this
	}

	public def UsuarioBuilder altura(Double altura){
		usuario.setAltura(altura)
		return this
	}

	public def UsuarioBuilder fechaNacimiento(int ano, int mes, int dia){
		usuario.setFechaDeNacimiento(ano, mes, dia)
		return this
	}
	
	public def UsuarioBuilder sexo(String sexo){
		usuario.setSexo(sexo)
		return this
	}
	
	public def UsuarioBuilder rutina(Rutina unaRutina){
		usuario.setRutina(unaRutina)
		return this
	}
	
	public def UsuarioBuilder condicion(Condicion unaCondicion){
		usuario.agregarCondicion(unaCondicion)
		return this
	}

	public def UsuarioBuilder preferencia(String unaPreferencia){
		usuario.agregarPreferencia(unaPreferencia)
		return this
	}
	
	protected def validarUsuario(){
		(this.validarNombreUsuario) && (this.validarPesoUsuario) && (this.validarAlturaUsuario) && (this.validarRutinaUsuario) && (this.validarFechaNacimientoUsuario) && (this.condicionesValidas)
	}
	
	protected def validarNombreUsuario(){
		(usuario.nombre.equals(null)) && (usuario.nombre.length<=4)
	}
	
	protected def validarPesoUsuario(){
		(usuario.peso.equals(null))
	}

	protected def validarAlturaUsuario(){
		(usuario.altura.equals(null))
	}
	
	protected def validarFechaNacimientoUsuario(){
		(usuario.fechaDeNacimiento.equals(null)) && (0 <= usuario.fechaDeNacimiento.compareTo(this.getDiaDeHoy))
	}
	
	protected def getDiaDeHoy() {
		new GregorianCalendar()
	}
	
	protected def boolean validarRutinaUsuario() {
		(usuario.rutina.equals(null))
	}
	
	protected def boolean condicionesValidas(){
		usuario.condicionesPreexistentes.exists[ condicion | condicion.validarCondicion(usuario).equals(false) ]
	}
	
	public def Usuario build(){
		if (this.validarUsuario()){
			throw new BusinessException("Usuario no valido")
		}
		return usuario
	}
	
}
	
