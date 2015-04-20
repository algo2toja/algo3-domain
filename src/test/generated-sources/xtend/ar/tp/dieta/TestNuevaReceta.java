package ar.tp.dieta;

import ar.tp.dieta.Comida;
import ar.tp.dieta.Receta;
import java.util.List;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestNuevaReceta {
  private Receta nuevaReceta;
  
  private Comida zanahoria;
  
  @Before
  public void init() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method setNombre is undefined for the type TestNuevaReceta"
      + "\nThe method setProceso is undefined for the type TestNuevaReceta"
      + "\nThe method setDificultad is undefined for the type TestNuevaReceta"
      + "\nThe method setTemporada is undefined for the type TestNuevaReceta"
      + "\nType mismatch: cannot convert from double to int");
  }
  
  @Test
  public void tengoIngredientes() {
    List<Comida> _ingredientes = this.nuevaReceta.getIngredientes();
    boolean _isEmpty = _ingredientes.isEmpty();
    /* (!_isEmpty); */
  }
}
