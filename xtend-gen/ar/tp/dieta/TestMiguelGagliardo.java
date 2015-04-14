package ar.tp.dieta;

import ar.tp.dieta.Usuario;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestMiguelGagliardo {
  private Usuario MiguelGagliardo;
  
  @Before
  public void init() {
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setPeso(103.35);
        it.setAltura(1.75);
      }
    };
    Usuario _doubleArrow = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
    this.MiguelGagliardo = _doubleArrow;
  }
  
  @Test
  public void casoDePruebaGagliardo() {
    double _indiceDeMasaCorporal = this.MiguelGagliardo.indiceDeMasaCorporal();
    Assert.assertEquals(33.5, _indiceDeMasaCorporal, 0.5);
  }
}
