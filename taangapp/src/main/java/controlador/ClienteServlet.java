///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controlador;
//
//import com.google.gson.Gson;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.math.BigDecimal;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import modelo.Cliente;
//import modelo.ClienteMng;
//
///**
// *
// * @author Acer
// */
//public class ClienteServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ClienteServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ClienteServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//        response.setContentType("text/json;charset=UTF-8");
//        response.setHeader("Cache-Control", "no-cache");
//       //validar parametros FALTA
//       
//       String ajaxConsulta = request.getParameter("ajaxconsulta");
//       int desde = Integer.parseInt(request.getParameter("desde"));
//       int salto = Integer.parseInt(request.getParameter("salto"));
//       
//       ClienteMng cm = new ClienteMng();
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
//       
//        
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//        response.setContentType("text/json;charset=UTF-8");
//        response.setHeader("Cache-Control", "no-cache");
//        
//        String operacion = request.getParameter("operacion");
//        
//        if(operacion.equals("eliminar")){
//            
//            String idCliente  = request.getParameter("idCliente");
//            
//            int nroCliente = Integer.parseInt(idCliente);
//            
//            ClienteMng cm = new ClienteMng();
//            
//            String resultado = cm.deleteCliente(nroCliente);
//            
//            String mensaje;
//            if(resultado == null){
//                mensaje = "{ \"eliminado\":true }";
//            }else{
//                mensaje = "{ \"eliminado\":false ,"
//                        + " \"motivo\":"+resultado+"}";
//            }
//            try (PrintWriter out = response.getWriter()) {
//                out.print(mensaje);
//            }
//        }
//        if(operacion.equals("modificar")){
//            String idCliente  = request.getParameter("idCliente");
//            String idUsuario  = request.getParameter("idUsuario");
//            String nombre  = request.getParameter("nombre");
//            String apellido  = request.getParameter("apellido");
//            String direccion  = request.getParameter("direccion");
//            String telefono  = request.getParameter("telefono");
//            String ci  = request.getParameter("ci");
//            String estado  = request.getParameter("estado");
//            String ruc  = request.getParameter("ruc");
//            
//            
//            ClienteMng cm = new ClienteMng();
//            
//            Cliente cliente = cm.getCliente(Integer.parseInt(idCliente));
//            
//            cliente.setNombre(nombre);
//            cliente.setApellido(apellido);
//            cliente.setDireccion(direccion);
//            cliente.setTelefono(telefono);
//            cliente.setCi(Integer.parseInt(ci));
//            cliente.setEstado(estado);
//            cliente.setRuc(ruc);
//            
//            String resultado = cm.editCliente(cliente);
//            String mensaje;
//            
//            if(resultado == null){
//                mensaje = "{ \"modificado\":true }";
//            }else{
//                mensaje = "{ \"modificado\":false ,"
//                        + " \"motivo\":"+resultado+"}";
//            }
//            try (PrintWriter out = response.getWriter()) {
//                out.print(mensaje);
//            }
//        }
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
