/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.LogManager;
import java.util.logging.Logger;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Usuario;

import modelo.UsuarioMng;

/**
 *
 * @author Acer
 */
//@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

     static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario)sesion.getAttribute("usuario");
        if(usuario != null){
            request.getSession().removeAttribute("usuario");
            response.sendRedirect("login.jsp");
        }*/
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * Inicia la sesion del usuario
     * 
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        //String contexto = request.getContextPath();
        
        
        //Parametros cuenta y contraseña
        String cuenta = request.getParameter("usuario");
        String contraseña = request.getParameter("contrasena");

        // Valida Parametros no vacios
        //if (cuenta != null && contraseña != null) {

            UsuarioMng usuMng = new UsuarioMng();
            Usuario usuario = usuMng.getUsuario(cuenta, contraseña);
            if (usuario == null) {
                
                response.sendRedirect("errorLogin.jsp");
            } else {
                sesion.setAttribute("usuario", usuario);
                logger.log(Level.INFO, "Usuario creado" + usuario);
                //request.getRequestDispatcher("clienteVista.jsp").forward(request, response);
                response.sendRedirect("menu.jsp");
            }

        //}else {
            
            //response.sendRedirect("errorLogin.jsp");
        //}
    }

    @Override
    public String getServletInfo() {
        return "Servlet encargado del inicio de sesion";
    }// </editor-fold>

}
