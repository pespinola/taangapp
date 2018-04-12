package modelo;
// Generated Apr 8, 2018 6:45:46 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PlanPago generated by hbm2java
 */
@Entity
@Table(name="plan_pago"
    ,schema="public"
)
public class PlanPago  implements java.io.Serializable {


     private BigDecimal nombreCuenta;
     private FacturaCabecera facturaCabecera;
     private BigDecimal monto;
     private Date vencimiento;
     private Date fechaPago;

    public PlanPago() {
    }

    public PlanPago(BigDecimal nombreCuenta, FacturaCabecera facturaCabecera, BigDecimal monto, Date vencimiento, Date fechaPago) {
       this.nombreCuenta = nombreCuenta;
       this.facturaCabecera = facturaCabecera;
       this.monto = monto;
       this.vencimiento = vencimiento;
       this.fechaPago = fechaPago;
    }
   
     @Id 

    
    @Column(name="nombre_cuenta", nullable=false, precision=131089, scale=0)
    public BigDecimal getNombreCuenta() {
        return this.nombreCuenta;
    }
    
    public void setNombreCuenta(BigDecimal nombreCuenta) {
        this.nombreCuenta = nombreCuenta;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_fact_cab", nullable=false)
    public FacturaCabecera getFacturaCabecera() {
        return this.facturaCabecera;
    }
    
    public void setFacturaCabecera(FacturaCabecera facturaCabecera) {
        this.facturaCabecera = facturaCabecera;
    }

    
    @Column(name="monto", nullable=false, precision=131089, scale=0)
    public BigDecimal getMonto() {
        return this.monto;
    }
    
    public void setMonto(BigDecimal monto) {
        this.monto = monto;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="vencimiento", nullable=false, length=13)
    public Date getVencimiento() {
        return this.vencimiento;
    }
    
    public void setVencimiento(Date vencimiento) {
        this.vencimiento = vencimiento;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="fecha_pago", nullable=false, length=13)
    public Date getFechaPago() {
        return this.fechaPago;
    }
    
    public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }




}


