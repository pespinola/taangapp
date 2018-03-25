<%-- 
    Document   : clienteVista
    Created on : 12-mar-2018, 20:29:18
    Author     : Acer
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.ClienteMng"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Clientes - Taangapp</title>
        <%!
            List<Cliente> lista;%>

        <% lista = new ClienteMng().getClientes();%> 
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% Usuario u = (Usuario)request.getSession().getAttribute("usuario");%>
        <p><%= u.getCuenta()%></p>
        
        <div class="container-fluid">
            <table class="table table-bordered"> 
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>idUsuario</th>

                        <th>nombre</th>
                        <th>apellido</th>
                        <th>direccion</th>
                        <th>telefono</th>
                        <th>ci</th>
                        <th>ruc</th>
                        <th>estado</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lista.size(); i++) {%>
                    <tr>
                        <td><%=lista.get(i).getIdCliente()%></td> 
                        <td><%=lista.get(i).getUsuario().getIdUsuario()%></td> 
                        <td><%=lista.get(i).getNombre()%></td> 
                        <td><%=lista.get(i).getApellido()%></td>
                        <td><%=lista.get(i).getDireccion()%></td> 
                        <td><%=lista.get(i).getTelefono()%></td> 
                        <td><%=lista.get(i).getCi()%></td> 
                        <td><%=lista.get(i).getRuc()%></td> 
                        <td><%=lista.get(i).getEstado()%></td> 


                    </tr> 
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
