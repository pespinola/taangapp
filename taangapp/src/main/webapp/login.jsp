<%-- 
    Document   : login.jsp
    Created on : 17-mar-2018, 23:49:46
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">
    <head>
        
        <title>Iniciar sesión - Ta'angapp</title>

        <%@include file="paginaCabecera.jsp" %>
        
        <link href="css/iniciarSesion.css" rel="stylesheet">

    </head>
<!-- -->
    <body class="text-center">


        <form class="form-signin" action="<%=request.getContextPath()%>/LoginServlet" method="POST">
            <h1 class="text-right" >Ta'angapp</h1>
            <h1 class="h3 mb-3 font-weight-normal">Sistema de Gestión de Registro de Marcas</h1>
            <img class="mb-4 img-fluid" src="imagenes/estudioJuridico.png" alt="Servicios legales Paraguay"  />
            <div>
                <label for="" class="sr-only">Usuario: </label>
                <input name="usuario" type="text" id="inputUser" class="form-control" placeholder="Usuario" pattern="[A-Za-z0-9_]{1,15}"  title="Se aceptan letras, números y guión bajo" required autofocus>
            </div>
            <div>
                <label for="" class="sr-only">Contraseña: </label>
                <input name="contrasena" type="password" id="inputPassword" class="form-control" placeholder="Contraseña" title = "Escriba su contraseña" required>

            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>

        </form>
    </body>
</html>