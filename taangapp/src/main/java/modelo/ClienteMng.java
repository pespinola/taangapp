/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
/**
 *
 * @author Acer
 */
public class ClienteMng {
    Session session = null;
    public String mess = "";
    
    public ClienteMng() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List getClientes()
    {
        List<Cliente> lista = null;

        if(!session.isOpen())
            this.session = HibernateUtil.getSessionFactory().getCurrentSession();
        org.hibernate.Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery ("from Cliente c");
            lista = (List<Cliente>) q.list();
            tx.commit();
        }
        catch (HibernateException ex) {
            mess = ex.getMessage();
            tx.rollback();
            ex.printStackTrace();
        }
        return lista;
    }
    
}
