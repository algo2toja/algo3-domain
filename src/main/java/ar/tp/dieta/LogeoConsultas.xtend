package ar.tp.dieta

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


class LogeoConsultas implements Accion {
	int max = 2
	private static final Logger logger = LogManager.getLogger(LogeoConsultas) 
	
	override execute(Usuario usuario, BusquedaRecetas busqueda, List<String> nombresRecetas) {
		if(nombresRecetas.size >= max){
			//LOGEAR RECETAS
			logger.trace("Log de recetas")
			logger.trace(busqueda.nombre)
			logger.trace(busqueda.dificultad)
			//logger.trace(busqueda.palabrasClave)
			logger.trace("Fin de log")
		}
	}
	
}