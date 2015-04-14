package ar.tp.dieta;

import ar.tp.dieta.Receta;
import ar.tp.dieta.Rutina;
import com.google.common.base.Objects;
import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Usuario {
  private int edad;
  
  private double peso;
  
  private double altura;
  
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
    return (this.peso == 0);
  }
  
  public boolean noTengoAltura() {
    return (this.altura == 0);
  }
  
  public boolean malaFechaDeNacimiento() {
    Date _date = new Date();
    return this.fechaDeNacimiento.before(_date);
  }
  
  public boolean noTengoRutina() {
    return Objects.equal(this.rutina, null);
  }
  
  public boolean soyDiabeticoSinSexo() {
    boolean _and = false;
    boolean _contains = this.condicionesPreexistentes.contains("diabetico");
    if (!_contains) {
      _and = false;
    } else {
      boolean _equals = Objects.equal(this.sexo, null);
      _and = _equals;
    }
    return _and;
  }
  
  public boolean soyHipertensoODiabeticoSinPreferencia() {
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
    return _and;
  }
  
  public boolean sinNombreONombreCorto() {
    int _length = this.nombre.length();
    return (_length <= 4);
  }
  
  /**
   * def soyVeganoConMalasPreferencias() {
   * 			(condicionesPreexistentes.contains("vegano") && preferenciasAlimenticias.exists([ingrediente |  ingrediente.getNombre() == "pollo" ||
   * 																											ingrediente.getNombre() == "carne" ||
   * 																											ingrediente.getNombre() == "chivito" ||
   * 																											ingrediente.getNombre() == "chori"]))
   * 
   * 
   * 		}
   */
  public boolean soyVeganoConMalasPreferencias() {
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
    return _and;
  }
  
  public double indiceDeMasaCorporal() {
    double _pow = Math.pow(this.altura, 2);
    return (this.peso / _pow);
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
  
  public boolean agregarReceta(final String nombre, final String proceso, final int calorias, final String dificultad, final String epoca) {
    boolean _xblockexpression = false;
    {
      Receta receta = new Receta(nombre, proceso, calorias, dificultad, epoca);
      receta.agregarCondimentos();
      receta.agregarIngredientes();
      boolean _xifexpression = false;
      boolean _and = false;
      boolean _and_1 = false;
      int _calorias = receta.getCalorias();
      boolean _greaterEqualsThan = (_calorias >= 10);
      if (!_greaterEqualsThan) {
        _and_1 = false;
      } else {
        int _calorias_1 = receta.getCalorias();
        boolean _lessEqualsThan = (_calorias_1 <= 5000);
        _and_1 = _lessEqualsThan;
      }
      if (!_and_1) {
        _and = false;
      } else {
        boolean _tieneIngredientes = receta.tieneIngredientes();
        _and = _tieneIngredientes;
      }
      if (_and) {
        _xifexpression = this.recetas.add(receta);
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public boolean puedeModificarReceta(final Receta receta) {
    Usuario _creador = receta.getCreador();
    return Objects.equal(_creador, this);
  }
  
  public boolean puedeVerReceta(final Receta receta) {
    boolean _or = false;
    Usuario _creador = receta.getCreador();
    boolean _equals = Objects.equal(_creador, this);
    if (_equals) {
      _or = true;
    } else {
      boolean _esPublica = receta.esPublica();
      _or = _esPublica;
    }
    return _or;
  }
  
  public void modificarReceta(final Receta receta) {
    boolean _and = false;
    boolean _puedeVerReceta = this.puedeVerReceta(receta);
    if (!_puedeVerReceta) {
      _and = false;
    } else {
      boolean _puedeModificarReceta = this.puedeModificarReceta(receta);
      _and = _puedeModificarReceta;
    }
    if (_and) {
      receta.setCreador(this);
    }
  }
  
  @Pure
  public int getEdad() {
    return this.edad;
  }
  
  public void setEdad(final int edad) {
    this.edad = edad;
  }
  
  @Pure
  public double getPeso() {
    return this.peso;
  }
  
  public void setPeso(final double peso) {
    this.peso = peso;
  }
  
  @Pure
  public double getAltura() {
    return this.altura;
  }
  
  public void setAltura(final double altura) {
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
