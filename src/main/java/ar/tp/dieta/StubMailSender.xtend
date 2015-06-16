package ar.tp.dieta

import java.util.Map
import java.util.HashMap
import java.util.HashSet
import java.util.Set

class StubMailSender implements MessageSender {
	Map<String, Set<String>> mailsEnviados
	
	override send(Email mail) {
		simularEnvioMail(mail.from, mail.content)
		println("Simulación envío de mail | From: " + mail.from + " | To: " + mail.to + " | Subject : " + mail.subject + "| Message: " + mail.content)
	}
	
	def simularEnvioMail(String from, String message) {
		var mensajes = mailsDe(from)
		mensajes.add(message)
		mailsEnviados.put(from, mensajes)
	}
	
	def Set<String> mailsDe(String from) {
		var Set<String> mensajes = mailsEnviados.get(from)
		if (mensajes == null) {
			mensajes = new HashSet<String>
		}
		mensajes
	}
	
	/**********************************************
	 * IMPLEMENTACION DE SINGLETON
	 * ********************************************/
	static StubMailSender instance

	// redefinimos el new como privado
	private new() {
		mailsEnviados = new HashMap<String, Set<String>>
	}

	def static getInstance() {
		if (instance == null) {
			instance = new StubMailSender()
		}	
		instance
	}
	
}