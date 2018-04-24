
package dao;

import java.util.List;


/**
 *
 * @author Patricia Espínola
 */
public interface IOperaciones<T> {
    
    //public T agregarEntidad(T entidad);
    public boolean agregarEntidad(T entidad);
    public boolean modificarEntidad(T entidad);
    public boolean eliminarEntidad(int id);
    public T consultarPorId(int id);
    public List<T> listar();
    
}
