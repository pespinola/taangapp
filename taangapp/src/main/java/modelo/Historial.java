package modelo;
// Generated 12-mar-2018 19:22:49 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * Historial generated by hbm2java
 */
public class Historial  implements java.io.Serializable {


     private BigDecimal idHistorial;
     private Abogado abogado;
     private BigDecimal idMarca;
     private Date fecha;
     private String operacion;
     private String detalle;

    public Historial() {
    }

    public Historial(BigDecimal idHistorial, Abogado abogado, BigDecimal idMarca, Date fecha, String operacion, String detalle) {
       this.idHistorial = idHistorial;
       this.abogado = abogado;
       this.idMarca = idMarca;
       this.fecha = fecha;
       this.operacion = operacion;
       this.detalle = detalle;
    }
   
    public BigDecimal getIdHistorial() {
        return this.idHistorial;
    }
    
    public void setIdHistorial(BigDecimal idHistorial) {
        this.idHistorial = idHistorial;
    }
    public Abogado getAbogado() {
        return this.abogado;
    }
    
    public void setAbogado(Abogado abogado) {
        this.abogado = abogado;
    }
    public BigDecimal getIdMarca() {
        return this.idMarca;
    }
    
    public void setIdMarca(BigDecimal idMarca) {
        this.idMarca = idMarca;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public String getOperacion() {
        return this.operacion;
    }
    
    public void setOperacion(String operacion) {
        this.operacion = operacion;
    }
    public String getDetalle() {
        return this.detalle;
    }
    
    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }




}


