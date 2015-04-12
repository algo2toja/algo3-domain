package dieta;

import com.google.common.base.Objects;
import dieta.Receta;
import dieta.Rutina;
import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Usuario {
  private int edad;
  
  private int peso;
  
  private int altura;
  
  private Date fechaDeNacimiento;
  
  private String sexo;
  
  private String nombre;
  
  private List<String> preferenciasAlimenticias;
  
  private List<String> comidasQueDisgustan;
  
  private List<String> condicionesPreexistentes;
  
  private Rutina rutina;
  
  private List<Receta> recetas;
  
  public boolean soyValido() {
    boolean _xifexpression = false;
    boolean _or = false;
    boolean _or_1 = false;
    boolean _or_2 = false;
    boolean _or_3 = false;
    boolean _or_4 = false;
    boolean _or_5 = false;
    boolean _or_6 = false;
    boolean _noTengoPeso = this.noTengoPeso();
    if (_noTengoPeso) {
      _or_6 = true;
    } else {
      boolean _noTengoAltura = this.noTengoAltura();
      _or_6 = _noTengoAltura;
    }
    if (_or_6) {
      _or_5 = true;
    } else {
      boolean _malaFechaDeNacimiento = this.malaFechaDeNacimiento();
      _or_5 = _malaFechaDeNacimiento;
    }
    if (_or_5) {
      _or_4 = true;
    } else {
      boolean _noTengoRutina = this.noTengoRutina();
      _or_4 = _noTengoRutina;
    }
    if (_or_4) {
      _or_3 = true;
    } else {
      boolean _soyDiabeticoSinSexo = this.soyDiabeticoSinSexo();
      _or_3 = _soyDiabeticoSinSexo;
    }
    if (_or_3) {
      _or_2 = true;
    } else {
      boolean _sinNombreONombreCorto = this.sinNombreONombreCorto();
      _or_2 = _sinNombreONombreCorto;
    }
    if (_or_2) {
      _or_1 = true;
    } else {
      boolean _soyHipertensoODiabeticoSinPreferencia = this.soyHipertensoODiabeticoSinPreferencia();
      _or_1 = _soyHipertensoODiabeticoSinPreferencia;
    }
    if (_or_1) {
      _or = true;
    } else {
      boolean _soyVeganoConMalasPreferencias = this.soyVeganoConMalasPreferencias();
      _or = _soyVeganoConMalasPreferencias;
    }
    boolean _equals = (_or == true);
    if (_equals) {
      _xifexpression = false;
    }
    return _xifexpression;
  }
  
  public boolean noTengoPeso() {
    boolean _xifexpression = false;
    if ((this.peso == 0)) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public boolean noTengoAltura() {
    boolean _xifexpression = false;
    if ((this.altura == 0)) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public boolean malaFechaDeNacimiento() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field fechaActual is undefined for the type Usuario"
      + "\n- cannot be resolved"
      + "\n<= cannot be resolved");
  }
  
  public boolean noTengoRutina() {
    boolean _xifexpression = false;
    boolean _equals = Objects.equal(this.rutina, null);
    if (_equals) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public boolean soyDiabeticoSinSexo() {
    boolean _xifexpression = false;
    boolean _and = false;
    boolean _contains = this.condicionesPreexistentes.contains("diabetico");
    if (!_contains) {
      _and = false;
    } else {
      boolean _equals = Objects.equal(this.sexo, null);
      _and = _equals;
    }
    if (_and) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public boolean soyHipertensoODiabeticoSinPreferencia() {
    boolean _xifexpression = false;
    boolean _and = false;
    boolean _or = false;
    boolean _contains = this.condicionesPreexistentes.contains("diabetico");
    if (_contains) {
      _or = true;
    } else {
      boolean _contains_1 = this.condicionesPreexistentes.contains("hipertenso");
      _or = _contains_1;
    }
    if (!_or) {
      _and = false;
    } else {
      int _size = this.preferenciasAlimenticias.size();
      boolean _equals = (_size == 0);
      _and = _equals;
    }
    if (_and) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public boolean sinNombreONombreCorto() {
    boolean _xifexpression = false;
    int _length = this.nombre.length();
    boolean _lessEqualsThan = (_length <= 4);
    if (_lessEqualsThan) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public boolean soyVeganoConMalasPreferencias() {
    boolean _xifexpression = false;
    boolean _and = false;
    boolean _contains = this.condicionesPreexistentes.contains("vegano");
    if (!_contains) {
      _and = false;
    } else {
      boolean _or = false;
      boolean _or_1 = false;
      boolean _or_2 = false;
      boolean _contains_1 = this.preferenciasAlimenticias.contains("carne");
      if (_contains_1) {
        _or_2 = true;
      } else {
        boolean _contains_2 = this.preferenciasAlimenticias.contains("chori");
        _or_2 = _contains_2;
      }
      if (_or_2) {
        _or_1 = true;
      } else {
        boolean _contains_3 = this.preferenciasAlimenticias.contains("chivito");
        _or_1 = _contains_3;
      }
      if (_or_1) {
        _or = true;
      } else {
        boolean _contains_4 = this.preferenciasAlimenticias.contains("pollo");
        _or = _contains_4;
      }
      _and = _or;
    }
    boolean _equals = (_and == true);
    if (_equals) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public int indiceDeMasaCorporal() {
    return (this.peso / (this.altura * this.altura));
  }
  
  public boolean noTengoCondiciones() {
    boolean _xifexpression = false;
    int _size = this.condicionesPreexistentes.size();
    boolean _equals = (_size == 0);
    if (_equals) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public boolean meGustaLaFruta() {
    boolean _xifexpression = false;
    boolean _contains = this.preferenciasAlimenticias.contains("fruta");
    boolean _equals = (_contains == true);
    if (_equals) {
      _xifexpression = true;
    }
    return _xifexpression;
  }
  
  public boolean soyVegano() {
    return this.condicionesPreexistentes.contains("vegano");
  }
  
  public boolean soyHipertenso() {
    return this.condicionesPreexistentes.contains("hipertenso");
  }
  
  public boolean soyDiabetico() {
    return this.condicionesPreexistentes.contains("diabetico");
  }
  
  public boolean soyCeliaco() {
    return this.condicionesPreexistentes.contains("celiaco");
  }
  
  public boolean rutinaSaludable() {
    return this.rutina.rutinaSaludable(this);
  }
  
  public Object nuevaReceta() {
    return null;
  }
  
  @Pure
  public int getEdad() {
    return this.edad;
  }
  
  public void setEdad(final int edad) {
    this.edad = edad;
  }
  
  @Pure
  public int getPeso() {
    return this.peso;
  }
  
  public void setPeso(final int peso) {
    this.peso = peso;
  }
  
  @Pure
  public int getAltura() {
    return this.altura;
  }
  
  public void setAltura(final int altura) {
    this.altura = altura;
  }
  
  @Pure
  public Date getFechaDeNacimiento() {
    return this.fechaDeNacimiento;
  }
  
  public void setFechaDeNacimiento(final Date fechaDeNacimiento) {
    this.fechaDeNacimiento = fechaDeNacimiento;
  }
  
  @Pure
  public String getSexo() {
    return this.sexo;
  }
  
  public void setSexo(final String sexo) {
    this.sexo = sexo;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public List<String> getPreferenciasAlimenticias() {
    return this.preferenciasAlimenticias;
  }
  
  public void setPreferenciasAlimenticias(final List<String> preferenciasAlimenticias) {
    this.preferenciasAlimenticias = preferenciasAlimenticias;
  }
  
  @Pure
  public List<String> getComidasQueDisgustan() {
    return this.comidasQueDisgustan;
  }
  
  public void setComidasQueDisgustan(final List<String> comidasQueDisgustan) {
    this.comidasQueDisgustan = comidasQueDisgustan;
  }
  
  @Pure
  public List<String> getCondicionesPreexistentes() {
    return this.condicionesPreexistentes;
  }
  
  public void setCondicionesPreexistentes(final List<String> condicionesPreexistentes) {
    this.condicionesPreexistentes = condicionesPreexistentes;
  }
  
  @Pure
  public Rutina getRutina() {
    return this.rutina;
  }
  
  public void setRutina(final Rutina rutina) {
    this.rutina = rutina;
  }
  
  @Pure
  public List<Receta> getRecetas() {
    return this.recetas;
  }
  
  public void setRecetas(final List<Receta> recetas) {
    this.recetas = recetas;
  }
}
