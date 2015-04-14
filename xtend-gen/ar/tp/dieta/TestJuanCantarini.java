package ar.tp.dieta;

import ar.tp.dieta.Usuario;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestJuanCantarini {
  private Usuario JuanCantarini;
  
  @Before
  public void init() {
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setPeso(74.8);
        it.setAltura(1.83);
      }
    };
    Usuario _doubleArrow = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
    this.JuanCantarini = _doubleArrow;
  }
  
  @Test
  public void casoDePruebaCantarini() {
    double _indiceDeMasaCorporal = this.JuanCantarini.indiceDeMasaCorporal();
    Assert.assertEquals(22.3, _indiceDeMasaCorporal, 0.5);
  }
}
