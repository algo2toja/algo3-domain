package ar.tp.dieta

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

class EnvioMail implements Accion {

	val String[] usuariosQueAplican = #["Juan", "Miguel"]
	val String mailDestino = "test@mail.com"

	override execute(Usuario usuario, BusquedaRecetas busqueda, List<String> nombresRecetas) {
		if (usuariosQueAplican.contains(usuario.getNombre)) {
			var mail = new Email
			mail.from = usuario.getDireccionCorreo
			mail.subject = "Consulta de " + usuario.getNombre
			mail.to = mailDestino
			mail.content = "Busqueda - nombre: " + busqueda.nombre + "| Busqueda - dificultad: " + busqueda.dificultad + "| Resultados: " + nombresRecetas.size
			StubMailSender.instance.send(mail)
		}
	}
	
}
