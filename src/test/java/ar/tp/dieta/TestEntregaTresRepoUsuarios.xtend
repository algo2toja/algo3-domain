package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestEngregaTresRepoUsuarios extends TestRepositorio {

	RepoUsuarios repoUsuarios = new RepoUsuarios
	Admin administrador = new Admin

	@Before
	def void inicializar() {

		repoUsuarios.setAdministrador(administrador)
		repoUsuarios.agregarUsuario(usuarioHipertenso)
		repoUsuarios.agregarUsuario(usuarioSinCondicion)
		repoUsuarios.agregarUsuario(usuarioVegano)
		administrador.setRepo(repoUsuarios)

	}

	@Test
	def void losUsuariosSeAgreganEfectivamente() {

		Assert.assertTrue(administrador.usuariosAAgregar.contains(usuarioHipertenso))
		Assert.assertTrue(administrador.usuariosAAgregar.contains(usuarioSinCondicion))
		Assert.assertTrue(administrador.usuariosAAgregar.contains(usuarioVegano))

		administrador.procesarUsuariosAAgregar
		administrador.procesarUsuariosAAgregar
		administrador.usuarioAIngresarADescartar
		Assert.assertTrue(repoUsuarios.usuarios.contains(usuarioHipertenso))
		Assert.assertTrue(repoUsuarios.usuarios.contains(usuarioSinCondicion))
		Assert.assertFalse(repoUsuarios.usuarios.contains(usuarioVegano))
	}

	@Test
	def void seRemueveUnUsuario() {

		administrador.procesarUsuariosAAgregar
		Assert.assertTrue(repoUsuarios.usuarios.contains(usuarioHipertenso))
		repoUsuarios.removerUsuario(usuarioHipertenso)
		Assert.assertTrue(administrador.usuariosARemover.contains(usuarioHipertenso))
		administrador.procesarUsuariosARemover
		Assert.assertFalse(administrador.usuariosARemover.contains(usuarioHipertenso))
	}

}
