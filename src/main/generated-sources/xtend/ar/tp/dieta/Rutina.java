package ar.tp.dieta;

import ar.tp.dieta.Usuario;

@SuppressWarnings("all")
public abstract class Rutina {
  public boolean indiceSaludable(final Usuario unUsuario) {
    boolean _and = false;
    double _indiceDeMasaCorporal = unUsuario.indiceDeMasaCorporal();
    boolean _greaterEqualsThan = (_indiceDeMasaCorporal >= 18);
    if (!_greaterEqualsThan) {
      _and = false;
    } else {
      double _indiceDeMasaCorporal_1 = unUsuario.indiceDeMasaCorporal();
      boolean _lessEqualsThan = (_indiceDeMasaCorporal_1 <= 30);
      _and = _lessEqualsThan;
    }
    return _and;
  }
  
  public boolean noTengoCondiciones(final Usuario unUsuario) {
    return unUsuario.noTengoCondiciones();
  }
  
  public boolean soyVeganoYMeGustaLaFruta(final Usuario unUsuario) {
    boolean _or = false;
    boolean _and = false;
    boolean _soyVegano = unUsuario.soyVegano();
    if (!_soyVegano) {
      _and = false;
    } else {
      boolean _meGustaLaFruta = unUsuario.meGustaLaFruta();
      _and = _meGustaLaFruta;
    }
    if (_and) {
      _or = true;
    } else {
      boolean _soyVegano_1 = unUsuario.soyVegano();
      boolean _not = (!_soyVegano_1);
      _or = _not;
    }
    return _or;
  }
  
  public boolean soyHipertenso(final Usuario unUsuario) {
    return unUsuario.soyHipertenso();
  }
  
  public boolean soyDiabeticoYDelgado(final Usuario unUsuario) {
    boolean _or = false;
    boolean _or_1 = false;
    boolean _soyDiabetico = unUsuario.soyDiabetico();
    if (_soyDiabetico) {
      _or_1 = true;
    } else {
      double _peso = unUsuario.getPeso();
      boolean _lessEqualsThan = (_peso <= 70);
      _or_1 = _lessEqualsThan;
    }
    if (_or_1) {
      _or = true;
    } else {
      boolean _soyDiabetico_1 = unUsuario.soyDiabetico();
      boolean _not = (!_soyDiabetico_1);
      _or = _not;
    }
    return _or;
  }
  
  public boolean rutinaSaludable(final Usuario unUsuario) {
    boolean _or = false;
    boolean _and = false;
    boolean _indiceSaludable = this.indiceSaludable(unUsuario);
    if (!_indiceSaludable) {
      _and = false;
    } else {
      boolean _noTengoCondiciones = this.noTengoCondiciones(unUsuario);
      _and = _noTengoCondiciones;
    }
    if (_and) {
      _or = true;
    } else {
      boolean _and_1 = false;
      boolean _and_2 = false;
      boolean _soyVeganoYMeGustaLaFruta = this.soyVeganoYMeGustaLaFruta(unUsuario);
      if (!_soyVeganoYMeGustaLaFruta) {
        _and_2 = false;
      } else {
        boolean _soyHipertenso = this.soyHipertenso(unUsuario);
        boolean _not = (!_soyHipertenso);
        _and_2 = _not;
      }
      if (!_and_2) {
        _and_1 = false;
      } else {
        boolean _soyDiabeticoYDelgado = this.soyDiabeticoYDelgado(unUsuario);
        _and_1 = _soyDiabeticoYDelgado;
      }
      _or = _and_1;
    }
    return _or;
  }
}
