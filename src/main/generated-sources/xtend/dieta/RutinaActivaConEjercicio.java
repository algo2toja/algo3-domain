package dieta;

import dieta.Rutina;
import dieta.Usuario;

@SuppressWarnings("all")
public class RutinaActivaConEjercicio extends Rutina {
  public boolean rutinaSaludable(final Usuario unUsuario) {
    boolean _or = false;
    boolean _and = false;
    boolean _indiceSaludable = super.indiceSaludable(unUsuario);
    if (!_indiceSaludable) {
      _and = false;
    } else {
      boolean _noTengoCondiciones = super.noTengoCondiciones(unUsuario);
      _and = _noTengoCondiciones;
    }
    if (_and) {
      _or = true;
    } else {
      boolean _soyVeganoYMeGustaLaFruta = super.soyVeganoYMeGustaLaFruta(unUsuario);
      _or = _soyVeganoYMeGustaLaFruta;
    }
    return _or;
  }
}
