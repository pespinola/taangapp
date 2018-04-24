/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import dao.ClienteManager;

import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class ClienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClienteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClienteServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        response.setContentType("text/json;charset=UTF-8");
//        response.setHeader("Cache-Control", "no-cache");
//       //validar parametros FALTA
//       
//       String ajaxConsulta = request.getParameter("ajaxconsulta");
//       int desde = Integer.parseInt(request.getParameter("desde"));
//       int salto = Integer.parseInt(request.getParameter("salto"));
//       
//       ClienteManager cm = null;
//       
//       List<Cliente> lista = cm.getClientes(desde, salto);
//       
//       try (PrintWriter out = response.getWriter()) {
//           
//            /*for(int i=0;i<lista.size();i++){
//                
//                out.println("<tr>");
//                out.println("<td>"+lista.get(i).getIdCliente()+"</td>");
//                out.println("<td>"+lista.get(i).getUsuario().getIdUsuario()+"</td>");
//                out.println("<td>"+lista.get(i).getNombre()+"</td>");
//                out.println("<td>"+lista.get(i).getApellido()+"</td>");
//                out.println("<td>"+lista.get(i).getDireccion()+"</td>");
//                out.println("<td>"+lista.get(i).getTelefono()+"</td>");
//                out.println("<td>"+lista.get(i).getCi()+"</td>");
//                out.println("<td>"+lista.get(i).getRuc()+"</td>");
//                out.println("<td>"+lista.get(i).getEstado()+"</td>");
//                out.println("</tr>");
//            }*/
//            
//            int size = lista.size();
//            out.println("[");
//                for(int i=0;i<size;i++){
//                    out.println("{"); 
//                    out.println("\"idCliente\":"+lista.get(i).getIdCliente()+",");
//                    out.println("\"idUsuario\":"+lista.get(i).getUsuario().getIdUsuario()+",");
//                    out.println("\"nombre\":"+"\""+lista.get(i).getNombre()+"\""+",");
//                    out.println("\"apellido\":"+"\""+lista.get(i).getApellido()+"\""+",");
//                    out.println("\"direccion\":"+"\""+lista.get(i).getDireccion()+"\""+",");
//                    out.println("\"telefono\":"+"\""+lista.get(i).getTelefono()+"\""+",");
//                    out.println("\"ci\":"+lista.get(i).getCi()+",");
//                    out.println("\"ruc\":"+"\""+lista.get(i).getRuc()+"\""+",");
//                    out.println("\"estado\":"+"\""+lista.get(i).getEstado()+"\"");
//                    out.println("}");
//                    if(i<size-1){
//                        out.println(",");
//                    }
//                }
//            out.println("]");
//            
//           
//        }
       
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
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
        ClienteManager cm = new ClienteManager();
        
        if( request.getParameter("eliminar") != null){
            
            String idCliente  = request.getParameter("idCliente");
            
            int nroCliente = Integer.parseInt(idCliente);
            
            
            
            Boolean resultado = cm.eliminarEntidad(nroCliente); 
            
            
            String mensaje;
            if(resultado == true){
                
                mensaje="El registro se eliminó correctamente";
            }else{
               
                mensaje="El registro no se pudo eliminar";
            }
            sesion.setAttribute("mensaje",mensaje);
            sesion.setAttribute("exito",resultado);
            response.sendRedirect("cliente.jsp");
            
        }
        if(request.getParameter("editar") != null){
            String idCliente  = request.getParameter("idCliente");
            String nombre  = request.getParameter("nombre");
            String apellido  = request.getParameter("apellido");
            String direccion  = request.getParameter("direccion");
            String telefono  = request.getParameter("telefono");
            String ci  = request.getParameter("ci");
            String estado  = request.getParameter("estado");
            String ruc  = request.getParameter("ruc");

            System.out.println(direccion);
            
            Cliente cliente = cm.consultarPorId(Integer.parseInt(idCliente));
            
            cliente.setNombre(nombre);
            cliente.setApellido(apellido);
            cliente.setDireccion(direccion);
            cliente.setTelefono(telefono);
            cliente.setCi(Integer.parseInt(ci));
            cliente.setEstado(estado);
            cliente.setRuc(ruc);
            
            Boolean resultado = cm.modificarEntidad(cliente);
            
            
            String mensaje;
            if(resultado == true){
                
                mensaje="El registro se editó correctamente";
            }else{
               
                mensaje="El registro no se pudo editar";
            }
            sesion.setAttribute("mensaje",mensaje);
            sesion.setAttribute("exito",resultado);
            response.sendRedirect("cliente.jsp");
        }
        
        if(request.getParameter("agregar") != null){
           
            String nombre  = request.getParameter("nombre");
            String apellido  = request.getParameter("apellido");
            String direccion  = request.getParameter("direccion");
            String telefono  = request.getParameter("telefono");
            String ci  = request.getParameter("ci");
            String estado  = request.getParameter("estado");
            String ruc  = request.getParameter("ruc");

            
            Cliente cliente = new Cliente();
            
            cliente.setNombre(nombre);
            cliente.setApellido(apellido);
            cliente.setDireccion(direccion);
            cliente.setTelefono(telefono);
            cliente.setCi(Integer.parseInt(ci));
            cliente.setEstado(estado);
            cliente.setRuc(ruc);
            
            Boolean resultado = cm.agregarEntidad(cliente); 
            
            
            String mensaje;
            if(resultado == true){
                
                mensaje="El registro se agregó correctamente";
            }else{
               
                mensaje="El registro no se pudo agregar";
            }
            sesion.setAttribute("mensaje",mensaje);
            sesion.setAttribute("exito",resultado);
            response.sendRedirect("cliente.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
