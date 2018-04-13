<%-- 
    Document   : cliente
    Author     : Patricia Espinola
--%>

<%@page import="dao.ClienteManager"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Clientes</title>
        <script src="js/bootstrap.min.js"></script>  
        <link rel="stylesheet" href="css/bootstrap.min.css">   
        <link rel="stylesheet" href="css/footer.css">   
        <script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css"/>
        <%@include file="paginaCabecera.jsp" %>
    </head>
    <body>
        <%@include file="menuCabecera.jsp" %>
        <form action="/clienteServlet" id="abmCliente" method="POST" name="abmCliente" onsubmit="return false;"> 
            <div class="container">
                <h1>Cliente</h1>
                <hr style="width: 100%; height: 1px; background-color:black;" />

                <!--Valida que haya un usuario logueado. De lo contrario
                lo redirige a la página de inicio-->
                <hr> 
                <%  HttpSession sesion = request.getSession();
                    if ((sesion.getAttribute("usuario") == null) == true) {
                        response.sendRedirect("../index.jsp");
                    }
                %>   

                <div class="form-inline">
                    <input id="operacion" name="operacion" type="text" style="display:none">
                    <input id="id_rubro" name="id_rubro" type="text" style="display:none">
                </div>
                <br>

                <table class="table table-striped table-bordered table-hover" style="cursor:pointer" id="mytable">
                    <thead style="background-color: lightgray">
                        <tr>
                            <th style="display: none">Cedula</th>
                            <th>Cedula</th>
                            <th>Nombre</th>
                        </tr>
                    </thead>
                    <tfoot style="background-color: lightgray">
                    <th style="display: none">Cedula</th>
                    <th>Cedula</th>
                    <th>Nombre</th>
                    </tfoot>
                    <tbody>
                        <%
                            List<Cliente> lista;
                            ClienteManager cliManager = new ClienteManager();
                            lista = cliManager.listar();
                            for (int i = 0; i < lista.size(); i++) {
                                out.println("<tr title=\"" + i + "\">"
                                        + "<td>" + lista.get(i).getCi() + "</td>"
                                        + "<td>" + lista.get(i).getNombre() + "</td>"
                                        + "</tr>");
                            }%>
                    </tbody>
                </table> 
                     <hr>
                <!-- Modal para editar  -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-sm">


                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Editar Cliente</h4>
                            </div>
                            <div class="modal-body">
                                <span>Cedula:</span>
                                <input id="descripcion_rubro_modal" type="text" class="form-control"  name="descripcion_rubro_modal">
                            </div>
                            <div class="modal-body">
                                <span>Nombre</span>
                                <input id="descripcion_rubro_modal" type="text" class="form-control"  name="descripcion_rubro_modal">
                            </div>
                            <div class="modal-footer">
                                <button onclick="editarModal()" class="btn btn-primary">Editar</button>
                                <button type="button" data-dismiss="modal" class="btn btn-primary">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>    <!-- FIN MODAL -->       
            </div>
        </form>          

        <script>
            $(document).ready(function () {

                $('#example').DataTable({
                    data: dataSet
                });
            });


        </script>
        <footer class="footer">Ta'angapp - 2018</footer>
    </body>
</html>
