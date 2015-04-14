package ar.tp.dieta;

import ar.tp.dieta.Usuario;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestTojaDaniel {
  private Usuario TojaDaniel;
  
  @Before
  public void init() {
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setPeso(120.100);
        it.setAltura(1.79);
      }
    };
    Usuario _doubleArrow = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
    this.TojaDaniel = _doubleArrow;
  }
  
  @Test
  public void casoDePruebaGagliardo() {
    double _indiceDeMasaCorporal = this.TojaDaniel.indiceDeMasaCorporal();
    Assert.assertEquals(37.4, _indiceDeMasaCorporal, 0.5);
  }
}
