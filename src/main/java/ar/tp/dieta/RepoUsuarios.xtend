package ar.tp.dieta

import java.util.List
import java.util.ArrayList

class RepoUsuarios {
	List<Usuario> usuarios = new ArrayList<Usuario>
	
	public def void agregarUsuario(Usuario unUsuario){
		//Crear clase "admin" que habilite y procese solicitudes (Punto 2)
		usuarios.add(unUsuario)
	}
	
	public def void removerUsuario(Usuario unUsuario){
		//Crear clase "admin" que habilite y procese solicitudes (Punto 2)
		usuarios.remove(unUsuario)
	}

	public def updatearUsuario(String nombreDeUsuario){
		//Que chequee por nombre el usuario, override de los parametros que quiero updatear.				
		//Crear clase "admin" que habilite y procese solicitudes (Punto 2)
	}

	public def Usuario getUsuarioPorNombre(String nombreDeUsuario){
		usuarios.findFirst[ usuario | usuario.getNombre().equals(nombreDeUsuario) ]
	}

	public def getListaDeUsuarios(String nombreDeUsuario){
		/*var List<Usuario> usuariosTemporales = new ArrayList<Usuario>
		usuarios.forEach[ usuario | if(usuario.getNombre().equals(nombreDeUsuario)){
				usuariosTemporales.add(usuario)		
			}
		]
		usuariosTemporales*/
		usuarios.filter[usuario | usuario.getNombre().equals(nombreDeUsuario)]
	}

	public def getListaDeUsuarios(Condicion unaCondicion){
		/*var List<Usuario> usuariosTemporales = new ArrayList<Usuario>
		usuarios.forEach[ usuario | if(usuario.tenesEstaCondicion(unaCondicion)){
			usuariosTemporales.add(usuario)
		}]
		usuariosTemporales*/
		usuarios.filter[usuario | usuario.tenesEstaCondicion(unaCondicion)]
	}	

}