package dieta;

import com.google.common.base.Objects;
import dieta.Comida;
import dieta.Usuario;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Receta {
  private String nombre;
  
  private List<Comida> ingredientes;
  
  private List<Comida> condimentos;
  
  private String proceso;
  
  private List<String> condicionesPreexistentes;
  
  private int calorias;
  
  private String dificultad;
  
  private String epoca;
  
  private Usuario creador;
  
  private List<Receta> subRecetas;
  
  public Receta(final String nobmre, final String proceso, final int calorias, final Object dificultad, final String epoca) {
  }
  
  public Object agregarCondimentos() {
    return null;
  }
  
  public void agregarIngredientes() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
  
  public boolean condicionesPreexistentes() {
    boolean _xblockexpression = false;
    {
      final Function1<Comida, Boolean> _function = new Function1<Comida, Boolean>() {
        public Boolean apply(final Comida condimento) {
          boolean _or = false;
          String _nombre = condimento.getNombre();
          boolean _equals = Objects.equal(_nombre, "caldo");
          if (_equals) {
            _or = true;
          } else {
            String _nombre_1 = condimento.getNombre();
            boolean _equals_1 = Objects.equal(_nombre_1, "sal");
            _or = _equals_1;
          }
          return Boolean.valueOf(_or);
        }
      };
      boolean _exists = IterableExtensions.<Comida>exists(this.condimentos, _function);
      if (_exists) {
        this.condicionesPreexistentes.add("hipertenso");
      }
      final Function1<Comida, Boolean> _function_1 = new Function1<Comida, Boolean>() {
        public Boolean apply(final Comida condimento) {
          boolean _and = false;
          String _nombre = condimento.getNombre();
          boolean _equals = Objects.equal(_nombre, "azucar");
          if (!_equals) {
            _and = false;
          } else {
            int _cantidad = condimento.getCantidad();
            boolean _greaterEqualsThan = (_cantidad >= 100);
            _and = _greaterEqualsThan;
          }
          return Boolean.valueOf(_and);
        }
      };
      boolean _exists_1 = IterableExtensions.<Comida>exists(this.condimentos, _function_1);
      if (_exists_1) {
        this.condicionesPreexistentes.add("diabetico");
      }
      boolean _xifexpression = false;
      final Function1<Comida, Boolean> _function_2 = new Function1<Comida, Boolean>() {
        public Boolean apply(final Comida ingrediente) {
          boolean _or = false;
          boolean _or_1 = false;
          boolean _or_2 = false;
          String _nombre = ingrediente.getNombre();
          boolean _equals = Objects.equal(_nombre, "pollo");
          if (_equals) {
            _or_2 = true;
          } else {
            String _nombre_1 = ingrediente.getNombre();
            boolean _equals_1 = Objects.equal(_nombre_1, "carne");
            _or_2 = _equals_1;
          }
          if (_or_2) {
            _or_1 = true;
          } else {
            String _nombre_2 = ingrediente.getNombre();
            boolean _equals_2 = Objects.equal(_nombre_2, "chivito");
            _or_1 = _equals_2;
          }
          if (_or_1) {
            _or = true;
          } else {
            String _nombre_3 = ingrediente.getNombre();
            boolean _equals_3 = Objects.equal(_nombre_3, "chori");
            _or = _equals_3;
          }
          return Boolean.valueOf(_or);
        }
      };
      boolean _exists_2 = IterableExtensions.<Comida>exists(this.ingredientes, _function_2);
      if (_exists_2) {
        _xifexpression = this.condicionesPreexistentes.add("vegano");
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public boolean esPublica() {
    return Objects.equal(this.creador, null);
  }
  
  public boolean tieneIngredientes() {
    int _size = this.ingredientes.size();
    return (_size >= 1);
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public List<Comida> getIngredientes() {
    return this.ingredientes;
  }
  
  public void setIngredientes(final List<Comida> ingredientes) {
    this.ingredientes = ingredientes;
  }
  
  @Pure
  public List<Comida> getCondimentos() {
    return this.condimentos;
  }
  
  public void setCondimentos(final List<Comida> condimentos) {
    this.condimentos = condimentos;
  }
  
  @Pure
  public String getProceso() {
    return this.proceso;
  }
  
  public void setProceso(final String proceso) {
    this.proceso = proceso;
  }
  
  @Pure
  public List<String> getCondicionesPreexistentes() {
    return this.condicionesPreexistentes;
  }
  
  public void setCondicionesPreexistentes(final List<String> condicionesPreexistentes) {
    this.condicionesPreexistentes = condicionesPreexistentes;
  }
  
  @Pure
  public int getCalorias() {
    return this.calorias;
  }
  
  public void setCalorias(final int calorias) {
    this.calorias = calorias;
  }
  
  @Pure
  public String getDificultad() {
    return this.dificultad;
  }
  
  public void setDificultad(final String dificultad) {
    this.dificultad = dificultad;
  }
  
  @Pure
  public String getEpoca() {
    return this.epoca;
  }
  
  public void setEpoca(final String epoca) {
    this.epoca = epoca;
  }
  
  @Pure
  public Usuario getCreador() {
    return this.creador;
  }
  
  public void setCreador(final Usuario creador) {
    this.creador = creador;
  }
  
  @Pure
  public List<Receta> getSubRecetas() {
    return this.subRecetas;
  }
  
  public void setSubRecetas(final List<Receta> subRecetas) {
    this.subRecetas = subRecetas;
  }
}
