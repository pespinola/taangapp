<%-- 
    Document   : Pagina Cliente
    Created on : 02-abr-2018, 18:56:38
    Author     : Marcelo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.ClienteMng"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache");
%>

<!DOCTYPE html>
<html lang="es">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="//WEB-INF/paginaCabecera.jsp" %>
        <link href="css/menu.css" rel="stylesheet">
        <title>Clientes - Ta'angapp</title>

        <%
            List<Cliente> lista = null;

            ClienteMng cm = new ClienteMng();
            int totalCliente = cm.getTotalClientes();

            //Select de estado de cliente
            List<String> estado_lista = new ArrayList();
            estado_lista.add("activo");
            estado_lista.add("inactivo");

            // Creacion de Tablas-------------------------
            ArrayList<String> listaColumnas = new ArrayList<String>();
            ArrayList<String> tituloColumnas = new ArrayList<String>();
            //Los nombres se asignan al id de cada etiqueta tr y 
            //tambien debe ser igual a json recibido para consultar
            listaColumnas.add("idCliente");
            listaColumnas.add("idUsuario");
            listaColumnas.add("nombre");
            listaColumnas.add("apellido");
            listaColumnas.add("direccion");
            listaColumnas.add("telefono");
            listaColumnas.add("ci");
            listaColumnas.add("ruc");
            listaColumnas.add("estado");
            
            
            tituloColumnas.add("ID Cliente");
            tituloColumnas.add("ID Usuario");
            tituloColumnas.add("Nombre");
            tituloColumnas.add("Apellido");
            tituloColumnas.add("Dirección");
            tituloColumnas.add("Teléfono");
            tituloColumnas.add("C.I.Nº");
            tituloColumnas.add("R.U.C.");
            tituloColumnas.add("Estado");
            //-----------------------------------------------------------------
            //Rango de registros que se visualizan en la pagina
            int salto = 4;// la cantidad de registro a mostrar(La cantidad de filas de la tabla)  
            int desde = 0; //El numero de registro desde donde se muestra en la pag.
            int hasta = 0;//El numero de registro hasta donde se muestra la pagina
            int total = totalCliente; //la cantidad total de registros

            //La cantidad de registro total es menor que la filas de la tabla
            if (total - salto < 0) {
                hasta = total;

            }
            //La cantidad de registro total o igual es mayor que las filas de la tabla
            if (total - salto >= 0) {
                hasta = salto;
            }

            //No hay registro a mostrar
            if (total == 0) {
                desde = -1;
            }

            //Restamos 1 unidad, porque el primer registro tiene indice 0
            hasta = hasta - 1;

            if (hasta >= 0 && desde >= 0) {
                lista = cm.getClientes(desde, salto);
            }
            //-----------------------------------------------------------------
        %>
    </head>
    <body onload="iniciarTabla()">
        <%@include file="//WEB-INF/menuCabecera.jsp" %>
        <br>
        <h1>Clientes</h1>

        <div class="container-fluid">
            <input type="hidden" id="desde" value="<%= desde%>"></input> 
            <input type="hidden" id="hasta" value="<%= hasta%>"></input> 
            <input type="hidden" id="salto" value="<%= salto%>"></input> 
            <input type="hidden" id="total" value="<%= total%>"></input>

            <div class ="row">
                
                <div class="col-12" id="alerta"></div>
            </div>

                
            <div class="row">
                <div class="col-2">
                    <%-- modal agregar --%>
                    <button id="btn-agregar" class="btn btn-info" type="button"><i class="fa fa-plus-circle" style="font-size:24px"></i> Agregar</button>
                    <div class="modal fade" id="agregar-modal" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4>Agregar</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                                </div>
                                <div class="modal-body">
                                    
                                    <div class="row">
                                        <label class="control-label col-3" for="agregar-<%=listaColumnas.get(0)%>" ><%=tituloColumnas.get(0)%>:</label>
                                        <div class="col">
                                            <input type="text" class="form-control" id="agregar-<%=listaColumnas.get(0)%>"></input>
                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <div class="col-3"></div>
                                        <div class="col"><p class="text-danger" style="font-size: 11px" id="agregar-validar-<%=listaColumnas.get(0)%>"></p></div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-3" for="agregar-<%=listaColumnas.get(1)%>"><%=tituloColumnas.get(1)%>:</label>
                                        <div class="col">
                                            <input type="text" class="form-control" id="agregar-<%=listaColumnas.get(1)%>"></input>
                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <div class="col-3"></div>
                                        <div class="col"><p class="text-danger" style="font-size: 11px" id="agregar-validar-<%=listaColumnas.get(1)%>"></p></div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-3" for="agregar-<%=listaColumnas.get(2)%>" ><%=tituloColumnas.get(2)%>:</label>
                                        <div class="col">
                                            <input type="text" class="form-control" id="agregar-<%=listaColumnas.get(2)%>"></input>
                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <div class="col-3"></div>
                                        <div class="col"><p class="text-danger" style="font-size: 11px" id="agregar-validar-<%=listaColumnas.get(2)%>"></p></div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-3" for="agregar_<%=listaColumnas.get(3)%>" ><%=tituloColumnas.get(3)%>: </label>
                                        <div class="col">
                                            <input type="text" class="form-control" id="agregar-<%=listaColumnas.get(3)%>"></input>
                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <div class="col-3"></div>
                                        <div class="col"><p class="text-danger" style="font-size: 11px" id="agregar-validar-<%=listaColumnas.get(3)%>"></p></div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-3" for="agregar-<%=listaColumnas.get(4)%>" ><%=tituloColumnas.get(4)%>:</label>
                                        <div class="col">
                                            <input type="text" class="form-control" id="agregar-<%=listaColumnas.get(4)%>"></input>  
                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <div class="col-3"></div>
                                        <div class="col"><p class="text-danger" style="font-size: 11px" id="agregar-validar-<%=listaColumnas.get(4)%>"></p></div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-3" for="agregar-<%=listaColumnas.get(5)%>" ><%=tituloColumnas.get(5)%>: </label>
                                        <div class="col">
                                            <input type="text" class="form-control" id="agregar-<%=listaColumnas.get(5)%>"></input>
                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <div class="col-3"></div>
                                        <div class="col"><p class="text-danger" style="font-size: 11px" id="agregar-validar-<%=listaColumnas.get(5)%>"></p></div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-3" for="agregar-<%=listaColumnas.get(6)%>" ><%=tituloColumnas.get(6)%>:</label>
                                        <div class="col">
                                            <input type="text" class="form-control" id="agregar-<%=listaColumnas.get(6)%>"></input>
                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <div class="col-3"></div>
                                        <div class="col"><p class="text-danger" style="font-size: 11px" id="agregar-validar-<%=listaColumnas.get(6)%>"></p></div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-3" for="agregar-<%=listaColumnas.get(8)%>"><%=tituloColumnas.get(8)%>:</label>
                                        <div class="col">
                                            <select class="form-control" id="agregar-<%=listaColumnas.get(8)%>">
                                                <% for(int z=0;z<estado_lista.size();z++){ %> 
                                                <option value="<%=estado_lista.get(z)%>"><%=estado_lista.get(z)%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row"> 
                                        <div class="col"><p></p></div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-3" for="agregar-<%=listaColumnas.get(7)%>" ><%=tituloColumnas.get(7)%>: </label>
                                        <div class="col">
                                            <input type="text" class="form-control" id="agregar-<%=listaColumnas.get(7)%>"></input>
                                        </div>
                                    </div>
                                    <div class="row"> 
                                        <div class="col-3"></div>
                                        <div class="col"><p class="text-danger" style="font-size: 11px" id="agregar-validar-<%=listaColumnas.get(7)%>"></p></div>
                                    </div>
                                </div>
                                
                                <div class="modal-footer">

                                    <button id="btn-agregar-bd" class="btn btn-defaul" onclick="agregar()">Agregar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        $(document).ready(function () {
                            $("#btn-agregar").click(function () {
                                $("#agregar-modal").modal();
                                <%for(String columna: listaColumnas){
                                    
                                    if(columna.equals(listaColumnas.get(8))){%> 
                                                
                                        document.getElementById("agregar-<%=listaColumnas.get(8)%>").value="<%=estado_lista.get(0)%>";
                                    <%}else{%> 
                                        document.getElementById("agregar-<%=columna%>").value="";
                                        document.getElementById("agregar-validar-<%=columna%>").textContent="";
                                    <%}%>
                                <%}%>
                                document.getElementById("btn-agregar-bd").setAttribute("data-dismiss","");
                            });
                        });
                    </script>

                </div>
                <div class="col-6"></div>
                <div class="col-3">
                    <p class="col" id="tabla-registro">Registro: <%= ++desde%> de <%= ++hasta%>  Total: <%= total%></p>
                </div>
            </div>





            <%-- Graficar la tabla --%>
            <div class="row">
                <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <%for (String titulo : tituloColumnas) {%>
                                <th><%=titulo%></th>
                            <%}%>
                        </tr>
                    </thead>
                    <tbody id="tabla-cuerpo">
                        <tr id="tabla-vacia"></tr>
                        <%-- En caso de que exista registros que mostrar 
                            Lo cargaremos a la tabla--%>
                        <% 
                    for (int i = 0; i < salto; i++) {%>
                        <tr id="tabla-fila-<%=i%>"> 
                            <%for(String columna : listaColumnas){%>
                            <td id="<%=columna%>-<%=i%>"></td> 
                            <%}%>
                            <%--Operadores--%>
                            <td> <i id="btn-eliminar-<%=i%>" class="fa fa-remove" style="font-size:24px"  onmouseover="this.style.cursor = 'pointer'"></i></td>
                            <td> <i id="btn-editar-<%=i%>" class="fa fa-edit" style="font-size:24px" onmouseover="this.style.cursor = 'pointer'"></i></td>

                        <tr> 
                    <%--  Modal eliminar--%>

                    <div class="modal fade" id="modal-eliminar-<%=i%>" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Eliminar</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                                </div>
                                <div class="modal-body">
                                    <p id="eliminar-cliente-mensaje-<%=i%>"></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="eliminar('<%=i%>')">Eliminar</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <script>
                        $(document).ready(function () {
                                $("#btn-eliminar-<%=i%>").click(function () {
                                    $("#modal-eliminar-<%=i%>").modal();
                                    var nombre = document.getElementById("nombre-<%=i%>").textContent;
                                    var apellido = document.getElementById("apellido-<%=i%>").textContent;
                                    document.getElementById("eliminar-cliente-mensaje-<%=i%>").textContent =
                                        "¿Desea eliminar el cliente " + nombre + " " + apellido + "?";
                            });
                        });
                    </script>
                    <%----%>
                    <%--  Modal modificar--%>
                    
                            <div class="modal fade" id="editar-<%=i%>" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4>Editar</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            
                                        </div>
                                        <div class="modal-body">
                                            
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-idCliente_<%=i%>" >ID Cliente: </label>
                                                    <div class="col">
                                                        <input readonly type="text" class="form-control" id="editar-idCliente-<%=i%>"></input>
                                                    </div>
                                            </div>
                                                    
                                            <div class="row"> 
                                                    <div class="col-3"></div>
                                                   <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-idCliente-<%=i%>"></p></div>
                                            </div>
                                                    
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-idUsuario-<%=i%>" >ID Usuario: </label>
                                                    <div class="col">
                                                        <input readonly type="text" class="form-control" id="editar-idUsuario-<%=i%>"></input>
                                                    </div>
                                            </div>
                                                    
                                            <div class="row"> 
                                                <div class="col-3"></div>
                                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-idUsuario-<%=i%>"></p></div>
                                            </div>
                                                    
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-nombre-<%=i%>" >Nombre: </label>
                                                    <div class="col">
                                                        <input type="text" class="form-control" id="editar-nombre-<%=i%>"></input>
                                                    </div>
                                            </div>
                                                    
                                            <div class="row"> 
                                                   <div class="col-3"></div>
                                                   <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-nombre-<%=i%>"></p></div>
                                            </div>
                                            
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-apellido-<%=i%>" >Apellido: </label>
                                                    <div class="col">
                                                        <input type="text" class="form-control" id="editar-apellido-<%=i%>"></input>
                                                    </div>
                                            </div>
                                                    
                                            <div class="row"> 
                                                    <div class="col-3"></div>
                                                   <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-apellido-<%=i%>"></p></div>
                                               </div>
                                               
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-direccion-<%=i%>" >Dirección: </label>
                                                    <div class="col">
                                                        <input type="text" class="form-control" id="editar-direccion-<%=i%>"></input>
                                                    </div>
                                            </div>
                                                    
                                            <div class="row"> 
                                                    <div class="col-3"></div>
                                                   <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-direccion-<%=i%>"></p></div>
                                            </div>
                                            
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-telefono-<%=i%>" >Teléfono: </label>
                                                    <div class="col">
                                                        <input type="text" class="form-control" id="editar-telefono-<%=i%>"></input>
                                                    </div>
                                            </div>
                                                    
                                            <div class="row"> 
                                                <div class="col-3"></div>
                                                   <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-telefono-<%=i%>"></p></div>
                                            </div>
                                                    
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-ci-<%=i%>" >C.I.Nº: </label>
                                                    <div class="col">
                                                        <input type="text" class="form-control" id="editar-ci-<%=i%>"></input>
                                                    </div>
                                            </div>
                                                    
                                            <div class="row"> 
                                                    <div class="col-3"></div>
                                                   <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-ci-<%=i%>"></p></div>
                                            </div>
                                                    
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-estado-<%=i%>" >Estado: </label>
                                                    <div class="col">
                                                        <select class="form-control" id="editar-estado-<%=i%>">
                                                            <% for(int z=0;z<estado_lista.size();z++){ %> 
                                                             <option value="<%=estado_lista.get(z)%>"><%=estado_lista.get(z)%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                            </div>
                                            <div class="row"> 
                                                    <div class="col-3"></div>
                                                   <div class="col"><p class="text-danger" style="font-size: 11px"></p></div>
                                            </div>
                                                    
                                            <div class="row">
                                                <label class="control-label col-3" for="editar-ruc-<%=i%>" >Ruc: </label>
                                                    <div class="col">
                                                        <input type="text" class="form-control" id="editar-ruc-<%=i%>"></input>
                                                    </div>
                                            </div>
                                            <div class="row"> 
                                                    <div class="col-3"></div>
                                                   <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-ruc-<%=i%>"></p></div>
                                            </div>
                                        </div>
                                            
                                        <div class="modal-footer">
                                            
                                            <button id="btn-modificar-<%=i%>" class="btn btn-defaul"  data-dismiss="" onclick="modificar('<%=i%>');">Modificar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script>
                            $(document).ready(function(){
                                $("#btn-editar-<%=i%>").click(function(){
                                    $("#editar-<%=i%>").modal();
                                    document.getElementById("editar-idCliente-<%=i%>").value = document.getElementById("idCliente-<%=i%>").textContent;
                                    document.getElementById("editar-nombre-<%=i%>").value = document.getElementById("nombre-<%=i%>").textContent; 
                                    document.getElementById("editar-idUsuario-<%=i%>").value = document.getElementById("idUsuario-<%=i%>").textContent;
                                    document.getElementById("editar-ruc-<%=i%>").value = document.getElementById("ruc-<%=i%>").textContent;
                                    document.getElementById("editar-apellido-<%=i%>").value = document.getElementById("apellido-<%=i%>").textContent;
                                    document.getElementById("editar-direccion-<%=i%>").value = document.getElementById("direccion-<%=i%>").textContent;
                                    document.getElementById("editar-telefono-<%=i%>").value = document.getElementById("telefono-<%=i%>").textContent;
                                    document.getElementById("editar-ci-<%=i%>").value = document.getElementById("ci-<%=i%>").textContent;
                                    document.getElementById("editar-estado-<%=i%>").value = document.getElementById("estado-<%=i%>").textContent;
                                    <%for(String columna: listaColumnas){%>
                                        document.getElementById("validar-<%=columna%>-<%=i%>").textContent = "";  
                                    <%}%>
                                    document.getElementById("btn-modificar-<%=i%>").setAttribute("data-dismiss","");
                                });
                            });
                            </script>
                    
                    
                    <% }%>

                    </tbody>
                </table>
                </div>
            </div>

            <%--  --%>

            <%-- Botones de navegacion --%>
            <div class="row">
                <div class="col-4"></div>
                <div class="col-2">
                    <button class="btn btn-info" id="btn-anterior" type="button" onclick="anterior()"><i class="fa fa-long-arrow-left" style="font-size:24px"></i> Anterior</button>
                   
                </div>
                
                <div class="col-2">
                    <button class="btn btn-info" id="btn-siguiente" type="button" onclick="siguiente()">Siguiente <i class="fa fa-long-arrow-right" style="font-size:24px"></i></button>
                </div>
                <div class="col-4"></div>
            </div>

        </div>
        <button style="display:none" type="button" onclick="listaVacia(true)">vacia</button>
        <button  style="display:none" type="button" onclick="listaVacia(false)">no vacia</button>
        <script>
            
            function modificar(fila){
                var nombre = document.getElementById("editar-nombre-"+fila).value;
                var idCliente = document.getElementById("editar-idCliente-"+fila).value;
                var idUsuario = document.getElementById("editar-idUsuario-"+fila).value;
                var ruc = document.getElementById("editar-ruc-"+fila).value;
                var apellido = document.getElementById("editar-apellido-"+fila).value;
                var direccion = document.getElementById("editar-direccion-"+fila).value;
                var telefono = document.getElementById("editar-telefono-"+fila).value;
                var ci = document.getElementById("editar-ci-"+fila).value;
                var estado = document.getElementById("editar-estado-"+fila).value;
                 
                var modificar = true;
                
                if(validarTexto(nombre,"validar-nombre-"+fila,15) == false){
                    
                    modificar=false;
                }
                if(validarTexto(apellido,"validar-apellido-"+fila,20) == false){
                    modificar=false;
                }
                if(validarTexto(direccion,"validar-direccion-"+fila,40) == false){
                    modificar=false;
                }
                if(validarTexto(telefono,"validar-telefono-"+fila,12) == false){
                    modificar=false;
                }
                if(validarTexto(ruc,"validar-ruc-"+fila,100) == false){
                    modificar=false;
                }
                
                
               
                
                if(validarNumero(ci,"validar-ci-"+fila,8) == false){
                    modificar=false;
                }
                if(modificar){
                    //llamar al ajax
                    var parametro ="&idCliente="+idCliente+
                                    "&idUsuario="+idUsuario+
                                    "&nombre="+nombre+
                                    "&apellido="+apellido+
                                    "&direccion="+direccion+
                                    "&telefono="+telefono+
                                    "&ci="+ci+
                                    "&estado="+estado+
                                    "&ruc="+ruc;
                            
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var operacion = JSON.parse(this.responseText);
                        if (operacion.modificado) {
                            document.getElementById("alerta").innerHTML =
                                    '<div class="alert alert-success alert-dismissible">' +
                                    '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                                    '<strong>¡Éxito!</strong> El registro se modifico correctamente' +
                                    '</div>';
                            var salto = Number(document.getElementById("salto").value);
                            var desde = Number(document.getElementById("salto").value);
                            var hasta = Number(document.getElementById("hasta").value);
                            var total = Number(document.getElementById("total").value);
                            
                            desde =0;
                            consultar(desde, salto);
                            if(total-salto>=0){
                                hasta = salto-1;
                                
                            }
                                
                            actualizarRegistro(0,hasta);
                            document.getElementById("desde").value = desde;
                            document.getElementById("hasta").value = hasta;
                            
                        } else {
                            document.getElementById("alerta").innerHTML =
                                    '<div class="alert alert-warning alert-dismissible">' +
                                    '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                                    '<strong>¡Error!</strong> El registro no se pudo modificar' +
                                    '</div>';
                        }

                    }
                    };
                    xhttp.open("POST", "ClienteServlet", true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
                    xhttp.send("operacion=modificar"+parametro);

                    document.getElementById("btn-modificar-"+fila).setAttribute("data-dismiss","modal");
                }
 
                
                
            }
            function agregar(){
                
                var agregar = true;
                
                var idCliente = document.getElementById("agregar-idCliente").value;
                
                var idUsuario = document.getElementById("agregar-idUsuario").value;
                var nombre = document.getElementById("agregar-nombre").value;
                var apellido = document.getElementById("agregar-apellido").value;
                var direccion = document.getElementById("agregar-direccion").value;
                var telefono = document.getElementById("agregar-telefono").value;
                var ci = document.getElementById("agregar-ci").value;
                var ruc = document.getElementById("agregar-ruc").value;
                var estado = document.getElementById("agregar-estado").value;
                
                agregar=true;
                
                if(validarTexto(nombre,"agregar-validar-nombre",15) == false){
                    
                    agregar=false;
                }
                if(validarTexto(apellido,"agregar-validar-apellido",20) == false){
                    agregar=false;
                }
                if(validarTexto(direccion,"agregar-validar-direccion",40) == false){
                    agregar=false;
                }
                if(validarTexto(telefono,"agregar-validar-telefono",12) == false){
                    agregar=false;
                }
                if(validarTexto(ruc,"agregar-validar-ruc",100) == false){
                    agregar=false;
                }
                
                
                if(validarNumero(idCliente,"agregar-validar-idCliente",100) == false){
                    agregar=false;
                }
                
                if(validarNumero(idUsuario,"agregar-validar-idUsuario",100) == false){
                    agregar=false;
                }
                
                if(validarNumero(ci,"agregar-validar-ci",8) == false){
                    agregar=false;
                }
                if(agregar){
                    //llamar al ajax
                    document.getElementById("btn-agregar-bd").setAttribute("data-dismiss","modal");
                }
 
            }
            
            function validarTexto(campo,validar_retro,longitud){
                
                if(campo.length == 0){
                    document.getElementById(validar_retro).textContent = "Complete el campo.";
                    
                   return false;
                }
                
                if(campo.replace(/\s/g,'').length == 0){
                    
                    document.getElementById(validar_retro).textContent = "Caracter de espacio inválido.";
                   
                    return false;
                }
                
                if(campo.length > longitud){
                    document.getElementById(validar_retro).textContent = "El campo supera el máximo de "+longitud+" caracteres, se cuenta como caracter el espacio.";
                   
                   return false;
                }
                
                    
                document.getElementById(validar_retro).textContent = "";
                
                
                return true;
            }
            
            function validarNumero(campo,p_valido,longitud){
                
                campo=campo.replace(".","a");
                campo= campo.replace("e","a");
                campo = Number(campo);


                 if(isNaN(campo)){
                    document.getElementById(p_valido).textContent ="Solamente se admiten numeros";
                    return false;
                 }
                 if(campo == 0){
                    document.getElementById(p_valido).textContent ="Escriba un numero";
                    return false;
                 }
                 campo=campo+"";
                 if(campo.length > longitud){
                    document.getElementById(p_valido).textContent ="Los caracteres superan el limite de 8";
                    return false;
                 }
                document.getElementById(p_valido).textContent ="";
                return true;
            }
    
            /*
             * Funcion que permite graficar la tabla dinamicamente
             * Dependiendo que exista registros de la BD que mostrar
             * @param {logico} vacio
             * @returns { }
             */
            function listaVacia(vacio) {
                var campoTabla = <%= salto%>;
                var registroTabla = document.getElementById("tabla-registro");
                var btnSgte = document.getElementById("btn-siguiente");
                var btnAnt = document.getElementById("btn-anterior");
                var btnAgregar = document.getElementById("btn-agregar");

                if (vacio) {
                    document.getElementById("tabla-vacia").innerHTML =
                            '<tr><td class="text-center bg-warning" colspan="<%=listaColumnas.size()%>" >No hay registros</td></tr>';
                    for (i = 0; i < campoTabla; i++) {
                        document.getElementById("tabla-fila-" + i).style.visibility = "hidden";
                        document.getElementById("btn-eliminar-" + i).style.visibility = "hidden";
                        document.getElementById("btn-editar-" + i).style.visibility = "hidden";
                    }

                    registroTabla.style.visibility = "hidden";
                    btnSgte.style.visibility = "hidden";
                    btnAnt.style.visibility = "hidden";
                    btnAgregar.style.visibility = "hidden";


                } else {
                    document.getElementById("tabla-vacia").innerHTML = "";

                    for (i = 0; i < campoTabla; i++) {
                        document.getElementById("tabla-fila-" + i).style.visibility = "visible";
                        document.getElementById("btn-eliminar-" + i).style.visibility = "visible";
                        document.getElementById("btn-editar-" + i).style.visibility = "visible";
                    }
                    registroTabla.style.visibility = "visible";
                    btnSgte.style.visibility = "visible";
                    btnAnt.style.visibility = "visible";
                    btnAgregar.style.visibility = "visible";
                    
                    var desde = Number(document.getElementById("desde").value);
                    var salto = Number(document.getElementById("salto").value);
                    
                    consultar(desde,salto);
                }
            }

            /*
             * Inicializa la tabla
             */
            function iniciarTabla() {
                var total = Number(document.getElementById("total").value);
                
                if (total == 0) {
                    listaVacia(true);
                }else{
                    listaVacia(false);
                }
            }

            /*
             * Funcion que permite mostrar los siguientes registros de la tabla
             */
            function siguiente() {

                var desde = Number(document.getElementById("desde").value);
                var salto = Number(document.getElementById("salto").value);
                var total = Number(document.getElementById("total").value);
                var hasta = Number(document.getElementById("hasta").value);

                //no se completa todos los campos de la tabla 

                //Si no entra en ninguno de los if, los registros se mostraron todo
                if (total - 1 < salto + hasta && total - 1 > hasta) {
                    desde = hasta + 1;
                    hasta = total - 1;
                } else {
                    //falta registro por recorrer
                    if (total - 1 >= salto + hasta) {
                        desde = hasta + 1;
                        hasta = salto + hasta;
                    }
                }

                document.getElementById("desde").value = desde;
                document.getElementById("hasta").value = hasta;

                //llamar al ajax (desde,salto)
                consultar(desde, salto);

                //actualizar el registro
                actualizarRegistro(desde, hasta);

                //bloque el boton sgte si hasta >=total
            }


            /*
             * Actualiza el texto del tag p 
             * que indica elrango de registro a la vista
             */
            function actualizarRegistro(desde, hasta) {
                var total = Number(document.getElementById("total").value);
                desde = desde + 1;
                hasta = hasta + 1;

                var registro = "Registro: " + desde + " de " + hasta + " Total: " + total;

                var p_registro = document.getElementById("tabla-registro");
                p_registro.textContent = registro;
            }

            /*
             * Obtiene del servidor la lista a mostrar en la pagina 
             *@param {number,number} desde, hasta
             * @returns { }
             */
            function consultar(desde, salto) {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var lista = JSON.parse(this.responseText);

                        var size = lista.length;

                        for (i = 0; i < size; i++) {
            <%for (String columna : listaColumnas) {%>
                            document.getElementById("<%=columna%>-" + i).innerHTML = lista[i].<%=columna%>;
            <%}%>
                            document.getElementById("btn-eliminar-" + i).style.visibility = "visible";
                            document.getElementById("btn-editar-" + i).style.visibility = "visible";
                        }
                        if (size < salto) {
                            for (j = size; j < salto; j++) {
            <%for (String columna : listaColumnas) {%>
                                document.getElementById("<%=columna%>-" + j).innerHTML = " ";
            <%}%>
                                document.getElementById("btn-eliminar-" + j).style.visibility = "hidden";
                                document.getElementById("btn-editar-" + j).style.visibility = "hidden";
                            }
                        }
                    }
                };
                xhttp.open("GET", "ClienteServlet?operacion=consultar&desde=" + desde + "&salto=" + salto, true);
                xhttp.send();

            }

            /*
             * Funcion que permite mostrar los anteriores registros de la tabla
             */
            function anterior() {

                var desde = Number(document.getElementById("desde").value);
                var salto = Number(document.getElementById("salto").value);
                var total = Number(document.getElementById("total").value);
                var hasta = Number(document.getElementById("hasta").value);

                if (desde > 0) {

                    if (hasta - desde + 1 == salto) {
                        desde = desde - salto;
                        hasta = hasta - salto;
                    } else {
                        desde = desde - salto;
                        hasta = desde + salto - 1;
                    }
                }

                document.getElementById("desde").value = desde;
                document.getElementById("hasta").value = hasta;

                consultar(desde, salto);

                //actualizar el registro
                actualizarRegistro(desde, hasta);


                //bloque el boton sgte si hasta >=total
            }

            function eliminar(nroRegistro) {

                var desde = Number(document.getElementById("desde").value);
                var salto = Number(document.getElementById("salto").value);
                var total = Number(document.getElementById("total").value);
                var hasta = Number(document.getElementById("hasta").value);

                var idCliente = document.getElementById("idCliente-" + nroRegistro).textContent;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var operacion = JSON.parse(this.responseText);
                        if (operacion.eliminado) {
                            document.getElementById("alerta").innerHTML =
                                    '<div class="alert alert-success alert-dismissible">' +
                                    '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                                    '<strong>¡Éxito!</strong> El registro se elimino correctamente' +
                                    '</div>';
                            document.getElementById("total").value = total - 1;


                            desde = 0;
                            if (total - salto > 0) {

                                hasta = salto - 1;

                            } else {

                                hasta = hasta - 1;

                            }

                            if (hasta < 0) {
                                desde = -1;
                                listaVacia(true);
                            } else {
                                consultar(0, salto);
                                actualizarRegistro(desde, hasta);
                            }
                            document.getElementById("desde").value = desde;
                            document.getElementById("hasta").value = hasta;



                        } else {
                            document.getElementById("alerta").innerHTML =
                                    '<div class="alert alert-warning alert-dismissible">' +
                                    '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                                    '<strong>¡Error!</strong> El registro no se pudo eliminar' +
                                    '</div>';
                        }

                    }
                };
                xhttp.open("POST", "ClienteServlet", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("operacion=eliminar&idCliente=" + idCliente);


            }
        </script>
    </body>
</html>
