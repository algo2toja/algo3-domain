package ar.tp.dieta


import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.List
import java.util.ArrayList

class TestEntregaTresConsultaJson {
	
	RecetarioPublico recetario = new RecetarioPublico
	Usuario usuarioNormal = new Usuario
	Usuario usuarioVegano = new Usuario
	Usuario usuarioHipertenso = new Usuario
	Usuario usuarioDiabetico = new Usuario
	Grupo	grupoConHipertenso = new Grupo
	Receta	recetaPropia = new Receta
	Receta	recetaPorGrupo = new Receta
	Receta 	recetaPublica = new Receta
	Receta	recetaPrivada = new Receta
	Receta  ensalada = new Receta
	Receta	asado = new Receta
	Receta  arrozBlanco = new Receta
	Receta  arrozConPollo = new Receta
	Receta bondiola = new Receta
	Receta fideos = new Receta
	Receta cerealitos = new Receta
	Receta bofe = new Receta
	Receta gelatina = new Receta
	Receta lomoMostaza = new Receta
	
	Ingrediente lomo = new Ingrediente
	Ingrediente cebolla = new Ingrediente
	Ingrediente carne = new Ingrediente
	Ingrediente sal = new Ingrediente
	Ingrediente arroz = new Ingrediente
	Ingrediente pollo = new Ingrediente
	Ingrediente pasta = new Ingrediente
	Ingrediente cereal = new Ingrediente
	Ingrediente azucar = new Ingrediente
	
	
	@Before
	def void init(){
		usuarioVegano.condicionesPreexistentes.add(new CondicionVegano)
		usuarioVegano.agregarComidaQueMeDisgusta("arroz")
		usuarioHipertenso.condicionesPreexistentes.add(new CondicionHipertension)
		usuarioDiabetico.condicionesPreexistentes.add(new CondicionDiabetes)
		
		grupoConHipertenso.agregarUsuario(usuarioHipertenso)
		
		usuarioNormal.setAltura(1.3)
		usuarioNormal.setPeso(150.0)
		usuarioNormal.setRecetario(recetario)
		usuarioNormal.setConsulta(new Consulta)
		
		usuarioVegano.setRecetario(recetario)
		
		usuarioHipertenso.setRecetario(recetario)
		
		usuarioDiabetico.setRecetario(recetario)
		
		grupoConHipertenso.setRecetario(recetario)
		
		sal.setNombre("sal")
		cebolla.setNombre("cebolla")
		carne.setNombre("carne")
		arroz.setNombre("arroz")
		pollo.setNombre("pollo")
		azucar.setCantidad(300)
		azucar.setNombre("azucar")
		pasta.setNombre("pasta")
		cereal.setNombre("cereal")
		lomo.setNombre("lomo")
		
		arrozBlanco.setNombreDeLaReceta("arrozBlanco")
		arrozBlanco.setCalorias(499)
		arrozBlanco.setAutor("Daniel")
		arrozBlanco.setDificultadDePreparacion("Dificil")
		ensalada.setNombreDeLaReceta("ensalada")
		ensalada.setCalorias(100)
		ensalada.setAutor("Juan")
		ensalada.setDificultadDePreparacion("Facil")
		asado.setNombreDeLaReceta("asado")
		asado.setCalorias(501)
		asado.setAutor("Gabriel")
		asado.setDificultadDePreparacion("Media")
		arrozConPollo.setNombreDeLaReceta("arrozConPollo")
		arrozConPollo.setCalorias(200)
		arrozConPollo.setAutor("Tojo")
		arrozConPollo.setDificultadDePreparacion("Facil")
		lomoMostaza.setNombreDeLaReceta("lomoMostaza")
		lomoMostaza.setCalorias(500)
		lomoMostaza.setAutor("Miguel")
		lomoMostaza.setDificultadDePreparacion("Dificil")
		bondiola.setNombreDeLaReceta("bondiola")
		bondiola.setCalorias(501)
		bondiola.setAutor("Juan")
		bondiola.setDificultadDePreparacion("Media")
		fideos.setNombreDeLaReceta("fideos")
		fideos.setCalorias(500)
		fideos.setAutor("Daniel")
		fideos.setDificultadDePreparacion("Facil")
		cerealitos.setNombreDeLaReceta("cerealitos")
		cerealitos.setCalorias(200)
		cerealitos.setAutor("Gabriel")
		cerealitos.setDificultadDePreparacion("Facil")
		bofe.setNombreDeLaReceta("bofe")
		bofe.setCalorias(600)
		bofe.setAutor("Miguel")
		bofe.setDificultadDePreparacion("Dificil")
		gelatina.setNombreDeLaReceta("gelatina")
		gelatina.setCalorias(10)
		gelatina.setAutor("Juan")
		gelatina.setDificultadDePreparacion("Media")
		
		ensalada.agregarIngrediente(sal)
		ensalada.agregarIngrediente(cebolla)
		
		asado.agregarIngrediente(carne)
		asado.agregarIngrediente(sal)
		lomoMostaza.agregarIngrediente(lomo)
		arrozBlanco.agregarIngrediente(arroz)
		
		arrozConPollo.agregarIngrediente(pollo)
		arrozConPollo.agregarIngrediente(arroz)
		
		bondiola.agregarIngrediente(carne)
		bondiola.agregarIngrediente(sal)
		
		fideos.agregarIngrediente(sal)
		fideos.agregarIngrediente(pasta)
		
		cerealitos.agregarIngrediente(cereal)
		cerealitos.agregarIngrediente(azucar)
		
		bofe.agregarIngrediente(carne)
		
		gelatina.agregarIngrediente(cebolla)
		
		recetario.recetas.add(arrozBlanco)
		recetario.recetas.add(ensalada)
		recetario.recetas.add(asado)
		recetario.recetas.add(arrozConPollo)
		recetario.recetas.add(lomoMostaza)
		recetario.recetas.add(bondiola)
		recetario.recetas.add(fideos)
		recetario.recetas.add(cerealitos)
		recetario.recetas.add(bofe)
		recetario.recetas.add(gelatina)
		
	}
	
	@Test
	def void comprobarJson(){
		val List<String> pClave = new ArrayList<String>
		pClave.add("carne")
		usuarioNormal.getRecetas("asado")
	}
	
	@Test
	def void comprobarJson2(){
		val List<String> pClave = new ArrayList<String>
		pClave.add("carne")
		usuarioNormal.getRecetas("Dificil",pClave)
	}
			
}