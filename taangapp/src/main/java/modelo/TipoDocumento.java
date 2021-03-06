package modelo;
// Generated 12-mar-2018 19:22:49 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * TipoDocumento generated by hbm2java
 */
public class TipoDocumento  implements java.io.Serializable {


     private BigDecimal idTipoDocumento;
     private String descripcion;
     private Set<Documento> documentos = new HashSet<Documento>(0);

    public TipoDocumento() {
    }

	
    public TipoDocumento(BigDecimal idTipoDocumento, String descripcion) {
        this.idTipoDocumento = idTipoDocumento;
        this.descripcion = descripcion;
    }
    public TipoDocumento(BigDecimal idTipoDocumento, String descripcion, Set<Documento> documentos) {
       this.idTipoDocumento = idTipoDocumento;
       this.descripcion = descripcion;
       this.documentos = documentos;
    }
   
    public BigDecimal getIdTipoDocumento() {
        return this.idTipoDocumento;
    }
    
    public void setIdTipoDocumento(BigDecimal idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Set<Documento> getDocumentos() {
        return this.documentos;
    }
    
    public void setDocumentos(Set<Documento> documentos) {
        this.documentos = documentos;
    }




}


