package modelo;
// Generated 12-mar-2018 19:22:49 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Rol generated by hbm2java
 */
public class Rol  implements java.io.Serializable {


     private BigDecimal idRol;
     private String descripcion;
     private Set<Usuario> usuarios = new HashSet<Usuario>(0);

    public Rol() {
    }

	
    public Rol(BigDecimal idRol, String descripcion) {
        this.idRol = idRol;
        this.descripcion = descripcion;
    }
    public Rol(BigDecimal idRol, String descripcion, Set<Usuario> usuarios) {
       this.idRol = idRol;
       this.descripcion = descripcion;
       this.usuarios = usuarios;
    }
   
    public BigDecimal getIdRol() {
        return this.idRol;
    }
    
    public void setIdRol(BigDecimal idRol) {
        this.idRol = idRol;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Set<Usuario> getUsuarios() {
        return this.usuarios;
    }
    
    public void setUsuarios(Set<Usuario> usuarios) {
        this.usuarios = usuarios;
    }




}

