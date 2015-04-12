package dieta;

import dieta.Receta;
import dieta.Usuario;
import java.util.List;

@SuppressWarnings("all")
public class Programa {
  private List<Usuario> usuarios;
  
  private List<Receta> recetario;
  
  public boolean nuevoUsuario(final Usuario unUsuario) {
    return this.usuarios.add(unUsuario);
  }
  
  public boolean nuevaReceta(final Receta unaReceta) {
    return this.recetario.add(unaReceta);
  }
}
