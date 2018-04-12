/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Pathy
 */
public class UsuarioMng {
      Session session = null;
    public String mess = "";

    public UsuarioMng() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public Usuario getUsuario(String cuenta, String contraseña)
    {
        Usuario usuario = null;

        if(!session.isOpen())
            this.session = HibernateUtil.getSessionFactory().getCurrentSession();
        org.hibernate.Transaction tx = session.beginTransaction();
        try
        {
            String consulta = "select u from Usuario u where u.cuenta = :cuenta"
                                + " and u.password = :password";
            Query q = session.createQuery(consulta);
            
            q.setParameter("cuenta", cuenta);
            q.setParameter("password", contraseña);
            
            usuario = (Usuario) q.uniqueResult();
            tx.commit();
        }
        catch (HibernateException ex) {
            mess = ex.getMessage();
            tx.rollback();
            ex.printStackTrace();
        }

        return usuario;
    }
}
