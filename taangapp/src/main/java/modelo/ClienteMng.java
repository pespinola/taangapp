//
//package modelo;
//
//import util.HibernateUtil;
//import java.util.List;
//import org.hibernate.HibernateException;
//import org.hibernate.Query;
//import org.hibernate.Session;
//
///**
// *
// * @author Pathy
// */
//public class ClienteMng {
//    Session session = null;
//    public String mess = "";
//    
//    public ClienteMng() {
//        this.session = HibernateUtil.openSession();
//    }
//    
//    public String deleteCliente(Cliente cliente)
//    {
//       
//        
//        if(!session.isOpen())
//            this.session = HibernateUtil.getSessionFactory().getCurrentSession();
//
//            org.hibernate.Transaction tx = session.beginTransaction();
//        try
//        {
//            session.delete(cliente);
//            tx.commit();
//        }
//        catch (HibernateException ex) {
//            mess = ex.getMessage();
//            tx.rollback();
//            ex.printStackTrace();
//            return "Error: "+mess;
//        }catch(Exception e){
//            return "Error: "+e;
//        }
//        return null;
//    }
//    
//    public String deleteCliente(int idCliente)
//    {
//       
//        Cliente cliente = null;
//        
//        if(!session.isOpen())
//            this.session = HibernateUtil.getSessionFactory().getCurrentSession();
//
//            org.hibernate.Transaction tx = session.beginTransaction();
//        try
//        {
//            Query q = session.createQuery("from Cliente c where c.idCliente=" + idCliente);
//            cliente = (Cliente) q.uniqueResult();
//            
//            if(cliente == null){
//                return "Error: El cliente no existe";
//            }
//            session.delete(cliente);
//            tx.commit();
//        }
//        catch (HibernateException ex) {
//            mess = ex.getMessage();
//            tx.rollback();
//            ex.printStackTrace();
//            return "Error: "+mess;
//        }catch(Exception e){
//            return "Error: "+e;
//        }
//        return null;
//    }
//    
//    public List getClientes(int inicio, int limite)
//    {
//        List<Cliente> lista = null;
//
//        if(!session.isOpen())
//            this.session = HibernateUtil.getSessionFactory().getCurrentSession();
//        org.hibernate.Transaction tx = session.beginTransaction();
//        try {
//            Query q = session.createQuery ("from Cliente c order by c.nombre limit :limite offset :inicio");
//            q.setParameter("limite", limite);
//            q.setParameter("inicio", inicio);
//            lista = (List<Cliente>) q.list();
//            tx.commit();
//        }
//        catch (HibernateException ex) {
//            mess = ex.getMessage();
//            tx.rollback();
//            ex.printStackTrace();
//        }
//        return lista;
//    }
//    
//    public int getTotalClientes()
//    {
//        int total = 0;
//
//        if(!session.isOpen())
//            this.session = HibernateUtil.getSessionFactory().getCurrentSession();
//        org.hibernate.Transaction tx = session.beginTransaction();
//        try {
//            String consulta = "select count(c) from Cliente c ";
//            Query q = session.createQuery(consulta);
//            
//            
//            
//            total = ((Long) q.uniqueResult()).intValue(); 
//            tx.commit();
//        }
//        catch (HibernateException ex) {
//            mess = ex.getMessage();
//            tx.rollback();
//            ex.printStackTrace();
//        }
//        
//        return total;
//    }
//    
//    public String editCliente(Cliente cliente){
//        if(!session.isOpen())
//            this.session = HibernateUtil.getSessionFactory().getCurrentSession();
//
//        org.hibernate.Transaction tx = session.beginTransaction();
//        try
//        {
//            session.saveOrUpdate(cliente);
//            tx.commit();
//        }
//        catch (HibernateException ex) {
//            mess = ex.getMessage();
//            tx.rollback();
//            ex.printStackTrace();
//            return mess;
//        }
//        return null;
//    }
//    
//    public Cliente getCliente(int idCliente)
//    {
//        Cliente cliente = null;
//
//        if(!session.isOpen())
//            this.session = HibernateUtil.getSessionFactory().getCurrentSession();
//        org.hibernate.Transaction tx = session.beginTransaction();
//        try
//        {
//            String consulta = "from Cliente c where c.idCliente = :idCliente";
//            Query q = session.createQuery(consulta);
//            
//            q.setParameter("idCliente", idCliente);
//            
//            cliente = (Cliente) q.uniqueResult();
//            tx.commit();
//        }
//        catch (HibernateException ex) {
//            mess = ex.getMessage();
//            tx.rollback();
//            ex.printStackTrace();
//        }
//
//        return cliente;
//    } 
//}
