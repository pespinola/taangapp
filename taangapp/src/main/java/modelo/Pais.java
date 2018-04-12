package modelo;
// Generated Apr 8, 2018 6:45:46 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Pais generated by hbm2java
 */
@Entity
@Table(name="pais"
    ,schema="public"
)
public class Pais  implements java.io.Serializable {


     private BigDecimal idPais;
     private String pais;
     private Set marcas = new HashSet(0);

    public Pais() {
    }

	
    public Pais(BigDecimal idPais, String pais) {
        this.idPais = idPais;
        this.pais = pais;
    }
    public Pais(BigDecimal idPais, String pais, Set marcas) {
       this.idPais = idPais;
       this.pais = pais;
       this.marcas = marcas;
    }
   
     @Id 

    
    @Column(name="id_pais", nullable=false, precision=131089, scale=0)
    public BigDecimal getIdPais() {
        return this.idPais;
    }
    
    public void setIdPais(BigDecimal idPais) {
        this.idPais = idPais;
    }

    
    @Column(name="pais", nullable=false)
    public String getPais() {
        return this.pais;
    }
    
    public void setPais(String pais) {
        this.pais = pais;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="pais")
    public Set getMarcas() {
        return this.marcas;
    }
    
    public void setMarcas(Set marcas) {
        this.marcas = marcas;
    }




}


