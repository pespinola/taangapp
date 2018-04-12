
package dao;

import java.util.ArrayList;
import java.util.List;

import modelo.Cliente;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Patricia Espínola
 */
public class ClienteManager implements IOperaciones<Cliente> {

    Session session = null;
    public String mess = "";
    List<Cliente> listClientes;

    public final static Logger logger = Logger.getLogger(ClienteManager.class);

    
    public ClienteManager() {
        this.listClientes = new ArrayList<>();
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    @Override
    public Cliente agregarEntidad(Cliente cliente) {
        Transaction tx = null;
        if (!session.isOpen()) {
            this.session = HibernateUtil.getSessionFactory().openSession();
        }
     
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(cliente);
            logger.info("Cliente correctamente agregado " + cliente);
            session.getTransaction().commit();
            return cliente;
        } catch (HibernateException ex) {
            logger.error("Error al guardar cliente");
            mess = ex.getMessage();
            tx.rollback();
            ex.printStackTrace();
            cliente = null;
           
        }finally{
            session.flush();
            session.close(); 
        }
        return cliente;
    }

    @Override
    public boolean modificarEntidad(Cliente cliente) {
        
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            session.update(cliente);
            logger.info("Cliente actualizado correctamente " + cliente);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException ex) {
            logger.error("Error al modificar cliente");
            mess = ex.getMessage();
            tx.rollback();
            ex.printStackTrace();
            return false;  
        } finally {
            session.flush();
            session.close();
        }
    }

    @Override
    public boolean eliminarEntidad(int id) {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            Cliente cli = (Cliente) session.load(Cliente.class, new Integer(id));
            session.delete(cli);
            logger.info("Cliente eliminado correctamente" + cli);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException ex) {
            logger.error("Error al elimnar cliente");
            mess = ex.getMessage();
            trns.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            session.flush();
            session.close();
        }
    }

    @Override
    public Cliente consultarPorId(int id) {
        Cliente cliente = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            String queryString = "from Cliente where id = :id";
            Query query = session.createQuery(queryString);
            query.setInteger("id", id);
            cliente = (Cliente) query.uniqueResult();
        } catch (HibernateException ex) {
            mess = ex.getMessage();
            trns.rollback();
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return cliente;
     }

    @Override
    public List<Cliente> listar() {
        listClientes = null;
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = session.beginTransaction();
            listClientes = session.createQuery("from Cliente").list();
        } catch (HibernateException ex) {
            mess = ex.getMessage();
            trns.rollback();
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return listClientes;
    }
}
