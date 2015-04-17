package ar.tp.dieta

import java.util.List

class Receta {

	double calorias

	List<Comida> ingredientes // tanto ingredientes como condimentos son clase comida?

	def validar() {

		//valida teniendo en cuenta que tenga 1 ingrediente al menos, 
		//y que las calorias esten en el rango
		var double totalCalorias = this.caloriasTotales()
		!ingredientes.empty && (10 <= totalCalorias && totalCalorias <= 5000)

	}

	def caloriasTotales() {

		//está este método acá, por si se tiene que calcular las calorias, en caso contrario
		//simplemente se usa el atributo. al final es: o el metodo o el atributo.
		calorias
	}

	def List<Condicion> inadecuadaParaCondiciones() {

		//devuelve la lista de condiciones preexistentes para la que no son recomendadas las comidas
		//con que se prepara la receta.		
		ingredientes.map[noSeRecomiendaParaCondicion()]

	}

}
