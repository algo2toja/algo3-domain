package ar.tp.dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Admin {
	RepoUsuarios repo
	List<Usuario> usuariosAAgregar = new ArrayList<Usuario>
	List<Usuario> usuariosARemover = new ArrayList<Usuario>
	List<Usuario> usuariosAActualizar = new ArrayList<Usuario>

	public def solicitudAgregarUsuario(Usuario usuario) {
		usuariosAAgregar.add(usuario)
	}

	def solicitudRemoverUsuario(Usuario usuario) {
		usuariosARemover.add(usuario)
	}

	def solicitudActualizarUsuario(Usuario usuario) {
		usuariosAActualizar.add(usuario)
	}

	def procesarUsuariosAAgregar() {
		repo.usuarios.add(usuariosAAgregar.get(0))
		usuariosAAgregar.remove(usuariosAAgregar.get(0))

	//usuariosAAgregar.remove(usuariosAAgregar.get(o))
	}

	def usuarioAIngresarADescartar() {
		usuariosAAgregar.remove(usuariosAAgregar.get(0))
	}

	def procesarUsuariosARemover() {
		repo.usuarios.remove(usuariosAAgregar.get(0))
		usuariosARemover.remove(usuariosARemover.get(0))
	}

	def usuarioARemoverRechazado() {
		usuariosARemover.remove(usuariosARemover.get(0))
	}

	def procesarUsuariosAActualizar() {
		usuariosAActualizar.forEach [ usuario |
			repo.removerUsuario(repo.getUsuarioPorNombre(usuario.getNombre()))
			repo.agregarUsuario(usuario)
		]
	}

}
