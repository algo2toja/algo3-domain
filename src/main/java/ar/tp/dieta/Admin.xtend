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
 def solicitudActualizarUsuario(Usuario usuario){
  usuariosAActualizar.add(usuario)
 }
 def procesarUsuariosAAgregar(){
  usuariosAAgregar.forEach[usuario| repo.usuarios.add(usuario)]
 }
 def procesarUsuariosARemover(){
  usuariosAAgregar.forEach[usuario| repo.usuarios.remove(usuario)]
 }
 def procesarUsuariosAActualizar(){
 	usuariosAActualizar.forEach[usuario | repo.removerUsuario(repo.getUsuarioPorNombre(usuario.getNombre()))
										  repo.agregarUsuario(usuario) 		
 								]
 }

}