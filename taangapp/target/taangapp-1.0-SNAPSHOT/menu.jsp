<%-- 
    Document   : menu
    Created on : 21-mar-2018, 15:26:29
    Author     : Acer
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="//WEB-INF/paginaCabecera.jsp" %>
        
        <title>Menú - Ta'angapp</title>

        <link href="css/menu.css" rel="stylesheet">
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
    </head>

    <body>
        <div class="container-fluid">
            <br>
            <div class="row">
                <div class="col-10"></div>
                <div class="col">
                    <div class="text-center">
                        <i class="fa fa-user-circle"></i>
                        <% if (usuario != null) {%>

                        <p> <%= usuario.getCuenta()%>

                            <br>
                            <a href="<%=request.getContextPath()%>/SalirServlet">Salir</a>
                        </p>
                        <%}%>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col" id="linea1" ></div>
                <div class="col" id="linea2">
                    <ul class="nav nav-tabs" >
                        <li class="nav-item">
                            <a class="nav-link" href="#">Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Expedientes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Reportes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Configuración</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <br>       
            <div class="row">

                <img class="rounded mx-auto d-block" src="imagenes/estudioJuridico.png" alt="Servicios legales Paraguay"></img>


            </div>
        </div>
    </body>
</html>
