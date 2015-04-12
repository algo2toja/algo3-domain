package dieta;

import dieta.Rutina;
import dieta.Usuario;

@SuppressWarnings("all")
public class RutinaActiva extends Rutina {
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
      boolean _and_1 = false;
      boolean _soyVeganoYMeGustaLaFruta = super.soyVeganoYMeGustaLaFruta(unUsuario);
      if (!_soyVeganoYMeGustaLaFruta) {
        _and_1 = false;
      } else {
        boolean _soyHipertenso = super.soyHipertenso(unUsuario);
        boolean _not = (!_soyHipertenso);
        _and_1 = _not;
      }
      _or = _and_1;
    }
    return _or;
  }
}
