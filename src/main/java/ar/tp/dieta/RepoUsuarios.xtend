package ar.tp.dieta

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoUsuarios {
 Admin administrador
 List<Usuario> usuarios = new ArrayList<Usuario>
 
 public def void agregarUsuario(Usuario unUsuario){
  //Crear clase "admin" que habilite y procese solicitudes (Punto 2)
  administrador.solicitudAgregarUsuario(unUsuario)
 }
 
 public def void removerUsuario(Usuario unUsuario){
  //Crear clase "admin" que habilite y procese solicitudes (Punto 2)
  administrador.solicitudRemoverUsuario(unUsuario)
 }

 public def updatearUsuario(Usuario UnUsuario){
  administrador.solicitudActualizarUsuario(UnUsuario)
  //Que chequee por nombre el usuario, override de los parametros que quiero updatear.    
  //Crear clase "admin" que habilite y procese solicitudes (Punto 2)
 }

 public def Usuario getUsuarioPorNombre(String nombreDeUsuario){
  usuarios.findFirst[ usuario | usuario.getNombre().equals(nombreDeUsuario) ]
 }

 public def List<Usuario> getListaDeUsuarios(String nombreDeUsuario){
  val List<Usuario> usuariosTemporales = new ArrayList<Usuario>
  usuarios.forEach[ usuario | if(usuario.getNombre().equals(nombreDeUsuario)){
    usuariosTemporales.add(usuario)  
   }
  ]
  usuariosTemporales
 }

 public def List<Usuario> getListaDeUsuarios(Condicion unaCondicion){
  val List<Usuario> usuariosTemporales = new ArrayList<Usuario>
  usuarios.forEach[ usuario | if(usuario.tenesEstaCondicion(unaCondicion)){
   usuariosTemporales.add(usuario)
  }]
  usuariosTemporales
 } 

}