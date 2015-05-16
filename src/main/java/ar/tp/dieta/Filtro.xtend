package ar.tp.dieta

import java.util.List

public interface Filtro {
	
	def void getRecetasFromUsuario(Usuario unUsuario)
	def void getRecetasFromGrupo(Grupo unGrupo)
	def List<Receta> aplicarFiltro(Usuario unUsuario)
	def List<Receta> aplicarFiltroGrupo(Grupo unGrupo)
	def Filtro getFiltro()
	
}