package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestEngregaTres1 {

 RepoUsuarios repoUsuarios = new RepoUsuarios
 
 Admin administrador = new Admin
 
 Usuario lucas = new Usuario
 Usuario martin = new Usuario
 Usuario maria = new Usuario
 
 @Before
 def void init(){
  lucas.setNombre("Lucas")
  martin.setNombre("Martin")
  maria.setNombre("Maria")
  
  maria.setPeso(123.3)
  repoUsuarios.setAdministrador(administrador)
  repoUsuarios.agregarUsuario(lucas)
  repoUsuarios.agregarUsuario(martin)
  repoUsuarios.agregarUsuario(maria)
  
  administrador.setRepo(repoUsuarios)
 }
 
 @Test
 def void losUsuariosSeAgreganEfectivamente(){
  
  Assert.assertTrue(administrador.usuariosAAgregar.contains(lucas))
  Assert.assertTrue(administrador.usuariosAAgregar.contains(martin))
  Assert.assertTrue(administrador.usuariosAAgregar.contains(maria))
  
  administrador.procesarUsuariosAAgregar
  administrador.procesarUsuariosAAgregar
  administrador.usuarioAIngresarADescartar
  Assert.assertTrue(repoUsuarios.usuarios.contains(lucas))
  
  Assert.assertTrue(repoUsuarios.usuarios.contains(martin))
  Assert.assertFalse(repoUsuarios.usuarios.contains(maria))
 }
 
 @Test
 def void seRemueveUnUsuario(){
  
  administrador.procesarUsuariosAAgregar
  
  Assert.assertTrue(repoUsuarios.usuarios.contains(lucas))
  
  repoUsuarios.removerUsuario(lucas)
  Assert.assertTrue(administrador.usuariosARemover.contains(lucas))
  
  administrador.procesarUsuariosARemover
  
  Assert.assertFalse(administrador.usuariosARemover.contains(lucas))
 }

}