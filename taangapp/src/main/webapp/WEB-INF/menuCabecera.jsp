<%@page import="modelo.Usuario"%>
<% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
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