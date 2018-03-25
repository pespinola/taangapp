package modelo;
// Generated 12-mar-2018 19:22:49 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Abogado generated by hbm2java
 */
public class Abogado  implements java.io.Serializable {


     private BigDecimal idAbogado;
     private Usuario usuario;
     private String nombre;
     private String apellido;
     private String direccion;
     private String telefono;
     private Integer ci;
     private String ruc;
     private Set<Expediente> expedientes = new HashSet<Expediente>(0);
     private Set<Historial> historials = new HashSet<Historial>(0);

    public Abogado() {
    }

	
    public Abogado(BigDecimal idAbogado, String nombre, String apellido, String direccion, String telefono) {
        this.idAbogado = idAbogado;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.telefono = telefono;
    }
    public Abogado(BigDecimal idAbogado, Usuario usuario, String nombre, String apellido, String direccion, String telefono, Integer ci, String ruc, Set<Expediente> expedientes, Set<Historial> historials) {
       this.idAbogado = idAbogado;
       this.usuario = usuario;
       this.nombre = nombre;
       this.apellido = apellido;
       this.direccion = direccion;
       this.telefono = telefono;
       this.ci = ci;
       this.ruc = ruc;
       this.expedientes = expedientes;
       this.historials = historials;
    }
   
    public BigDecimal getIdAbogado() {
        return this.idAbogado;
    }
    
    public void setIdAbogado(BigDecimal idAbogado) {
        this.idAbogado = idAbogado;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido() {
        return this.apellido;
    }
    
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public Integer getCi() {
        return this.ci;
    }
    
    public void setCi(Integer ci) {
        this.ci = ci;
    }
    public String getRuc() {
        return this.ruc;
    }
    
    public void setRuc(String ruc) {
        this.ruc = ruc;
    }
    public Set<Expediente> getExpedientes() {
        return this.expedientes;
    }
    
    public void setExpedientes(Set<Expediente> expedientes) {
        this.expedientes = expedientes;
    }
    public Set<Historial> getHistorials() {
        return this.historials;
    }
    
    public void setHistorials(Set<Historial> historials) {
        this.historials = historials;
    }




}

