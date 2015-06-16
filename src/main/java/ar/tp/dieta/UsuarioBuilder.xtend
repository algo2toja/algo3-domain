package ar.tp.dieta

class UsuarioBuilder {

	Receta usuario
	
		usuarioVegano.condicionesPreexistentes.add(new CondicionVegano)
		usuarioVegano.agregarComidaQueMeDisgusta("arroz")
		usuarioHipertenso.condicionesPreexistentes.add(new CondicionHipertension)
		usuarioDiabetico.condicionesPreexistentes.add(new CondicionDiabetes)
	
		repo = new RepoRecetas => [
			crearRepoRecetas
		]
		
		grupoConHipertenso.agregarUsuario(usuarioHipertenso)
		
		usuarioNormal => [
			setAltura(1.3)
			setPeso(150.0)
			setSexo("F")
			setRecetario(recetario)
		]
		
		usuarioHipertenso =>[ 
			setAltura(1.88)
			setPeso(94.3)
			setSexo("M")
			setRecetario(recetario)
		]
				nuevoUsuario = new Usuario() =>[
			setPeso(105.3)
			setAltura(1.75)
			setFechaDeNacimiento(1985, 4, 13) // Nacio el 13 de Abril de 1985
			setSexo("Masculino")
			setNombre("Marco")
			setRutina(taeBo)
			agregarCondicion(new CondicionVegano)
			agregarPreferencia("fruta")
		]
		
		usuarioVegano.setRecetario(recetario)
		
		usuarioHipertenso.setRecetario(recetario)
		
		usuarioDiabetico.setRecetario(recetario)
		
		grupoConHipertenso.setRecetario(recetario)
	
	new(String nombreUsuario){
		usuario = new Usuario()
		usuario.setNombre(nombreUsuario)
	}		

	public def UsuarioBuilder peso(Double peso){
		usuario.setPeso(peso)
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
	
	public def RecetaBuilder temporada(String temporada){
		receta.setTemporadaALaQueCorresponde(temporada)
		return this
	}
	
	public def RecetaBuilder agregar(Ingrediente unIngrediente){
		receta.agregarIngrediente(unIngrediente)
		return this
	}

	public def Receta build(){
		if (receta.elementosDeReceta.isEmpty()) {
			throw new BusinessException("Receta sin ingredientes")
		}
		return receta
	}
	
}
}