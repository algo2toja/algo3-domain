package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class RepositorioUsuarios {
	
	List<Usuario> usuarios = new ArrayList<Usuario>
	RutinaActiva basket
	Busqueda busqueda1 = new Busqueda => [
			agregarFiltro(new FiltroPorIngredienteCaro)
	]
	Accion2 accion2 = new Accion2
	RecetarioPublico recetario = new RecetarioPublico
	
	new(){
		
		basket = new RutinaActiva => [
			setTiempoDeEjercicio(240)
		]
		
		usuarios.add(new UsuarioBuilder("Miguel","miguel").peso(70.5).altura(1.73).fechaNacimiento(1989, 6, 28).sexo("M").rutina(basket).condicion(new CondicionVegano).preferencia("fruta").email("soyvegano@edrans.com").build())
		usuarios.add(new UsuarioBuilder("Daniel","daniel").peso(70.5).altura(1.73).fechaNacimiento(1989, 6, 28).sexo("M").rutina(basket).condicion(new CondicionVegano).preferencia("fruta").email("soyvegano@edrans.com").build())
		usuarios.add(new UsuarioBuilder("Juan","juan").peso(70.5).altura(1.73).fechaNacimiento(1989, 6, 28).sexo("M").rutina(basket).condicion(new CondicionVegano).preferencia("fruta").email("soyvegano@edrans.com").build())
		
		//usuarios.get(0).agregarRecetaFavorita(usuarios.get(0).recetario.recetas.get(0))
		//usuarios.get(0).agregarRecetaFavorita(usuarios.get(0).recetario.recetas.get(1))
		//
		usuarios.forEach[usuario | usuario.accion2 = accion2]
		usuarios.forEach[usuario | usuario.recetario = recetario]
		usuarios.get(1).agregarBusqueda(busqueda1)
		usuarios.get(1).busquedaFiltrada()
	}
	
	def validarLogin(String nombre,String contraseña){
		var Usuario usuarioTemporal
		usuarioTemporal = usuarios.findFirst[usuario |(usuario.nombre.equals(nombre) && usuario.contraseña.equals(contraseña))]
		if(!(usuarioTemporal == null)){
			return usuarioTemporal
		}else{
			//throw new UnsupportedOperationException("aaaaa")
		}
	}
}