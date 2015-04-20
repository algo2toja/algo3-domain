package ar.tp.dieta;

import ar.tp.dieta.CondicionVegano;
import ar.tp.dieta.RutinaActiva;
import ar.tp.dieta.Usuario;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestNuevoUsuario {
  private Usuario usuarioNuevo;
  
  @Before
  public void init() {
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setNombre("Carlos");
        it.setPeso(Double.valueOf(103.35));
        it.setAltura(Double.valueOf(1.75));
        it.setFechaDeNacimiento(1989, 6, 28);
        RutinaActiva _rutinaActiva = new RutinaActiva();
        it.setRutina(_rutinaActiva);
        CondicionVegano _condicionVegano = new CondicionVegano();
        it.agregarCondicion(_condicionVegano);
      }
    };
    Usuario _doubleArrow = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function);
    this.usuarioNuevo = _doubleArrow;
  }
  
  @Test
  public void validarUnUsuario() {
    this.usuarioNuevo.validarUsuario();
  }
  
  @Test
  public boolean validarCondicion() {
    return this.usuarioNuevo.soyVegano();
  }
}
