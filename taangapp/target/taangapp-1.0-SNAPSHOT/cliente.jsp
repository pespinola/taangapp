<%-- 
    Document   : cliente
    Author     : Patricia Espinola
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.ClienteManager"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Clientes - Ta'angapp</title>

        <%@include file="paginaCabecera.jsp" %>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
    

        
    </head>

    <body>
        <%@include file="menuCabecera.jsp" %>
       
        <%
            List<Cliente> lista;
            ClienteManager cliManager = new ClienteManager();
            lista = cliManager.listar();
            
            //Select de estado de cliente
            List<String> estado_lista = new ArrayList();
            estado_lista.add("activo");
            estado_lista.add("inactivo");
        
        %>

        <div class="container-fluid">
            
            <h1>Cliente</h1>
            <hr style="width: 100%; height: 1px; background-color:black;" />
            <div class ="row">
                <div class="col-12" id="alerta"></div>
            </div>
            
            <button onclick="modalAgregar()" class="btn btn-info" type="button"><i class="fa fa-plus-circle" style="font-size:24px"></i> Agregar</button>
          

            <table id="mytable" class="table table-striped table-bordered dt-responsive nowrap">
                <thead style="background-color:whitesmoke">
                    <tr>
                        <th>ID</th>
                        <th>Cédula</th>
                        <th>R.U.C.</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Estado</th>
                        
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <%for (int i = 0; i < lista.size(); i++) {%>
                    <tr>
                        <td id="idCliente-<%=i%>"><%=lista.get(i).getIdCliente()%></td>
                        <td id="ci-<%=i%>"><%=lista.get(i).getCi()%></td>
                        <td id="ruc-<%=i%>"><%=lista.get(i).getRuc()%></td>
                        <td id="nombre-<%=i%>"><%=lista.get(i).getNombre()%></td> 
                        <td id="apellido-<%=i%>"><%=lista.get(i).getApellido()%></td>
                        <td id="direccion-<%=i%>"><%=lista.get(i).getDireccion()%></td>
                        <td id="telefono-<%=i%>"><%=lista.get(i).getTelefono()%></td>
                        <td id="estado-<%=i%>"><%=lista.get(i).getEstado()%></td>
                        <td> <i class="fa fa-remove" style="font-size:24px"  onmouseover="this.style.cursor = 'pointer'" onclick="modalEliminar('<%=i%>')"></i>
                             <i  class="fa fa-edit" style="font-size:24px" onmouseover="this.style.cursor = 'pointer'" onclick="modalEditar('<%=i%>')"></i></td>
                    </tr>
                    <%}%>
                </tbody>
            </table> 
            <footer class="footer">Ta'angapp - 2018</footer>

            <%-- Modal Eliminar --%>
            <div class="modal fade" id="modal-eliminar" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Eliminar</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                        </div>
                        <div class="modal-body">
                            <p id="eliminar-cliente-mensaje"></p>
                        </div>
                        <div class="modal-footer">
                            <button id="btn-eliminar" type="button" class="btn btn-default" data-dismiss="modal" onclick="">Eliminar</button>
                        </div>
                    </div>

                </div>
            </div>

            <%-- Modal Editar --%>
            <div class="modal fade" id="modal-editar" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Editar</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                        </div>
                        <div class="modal-body">

                            <div class="row">
                                <label class="control-label col-3" for="editar-idCliente" >ID Cliente: </label>
                                <div class="col">
                                    <input readonly type="text" class="form-control" id="editar-idCliente" placeholder="ID Cliente"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-idCliente"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="editar-nombre" >Nombre: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="editar-nombre" placeholder="Nombre"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-nombre"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="editar-apellido" >Apellido: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="editar-apellido" placeholder="Apellido"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-apellido"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="editar-direccion" >Dirección: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="editar-direccion" placeholder="Dirección"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-direccion"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="editar-telefono" >Teléfono: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="editar-telefono" placeholder="Teléfono"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-telefono"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="editar-ci" >C.I.Nº: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="editar-ci" placeholder="C.I.Nº"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-ci"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="editar-estado" >Estado: </label>
                                <div class="col"> 
                                    <select class="form-control" id="editar-estado"> 
                                        <% for (int z = 0; z < estado_lista.size(); z++) {%> 
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
                                <label class="control-label col-3" for="editar-ruc" >Ruc: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="editar-ruc" placeholder="R.U.C."></input>
                                </div>
                            </div>
                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-ruc"></p></div>
                            </div>
                        </div>

                        <div class="modal-footer">

                            <button id="btn-editar" class="btn btn-defaul"  data-dismiss="" onclick="editar()">Modificar</button>
                        </div>
                    </div>
                </div>
            </div>
                                    
            <%-- Modal Agregar --%>
            <div class="modal fade" id="modal-agregar" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>Agregar</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                        </div>
                        <div class="modal-body">

                            <div class="row">
                                <label class="control-label col-3" for="agregar-idCliente" >ID Cliente: </label>
                                <div class="col">
                                    <input  type="text" class="form-control" id="agregar-idCliente" placeholder="ID Cliente"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-agregar-idCliente"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="agregar-nombre" >Nombre: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="agregar-nombre" placeholder="Nombre"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-agregar-nombre"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="agregar-apellido" >Apellido: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="agregar-apellido" placeholder="Apellido"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-agregar-apellido"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="agregar-direccion" >Dirección: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="agregar-direccion" placeholder="Dirección"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-agregar-direccion"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="agregar-telefono" >Teléfono: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="agregar-telefono" placeholder="Teléfono"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-agregar-telefono"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="agregar-ci" >C.I.Nº: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="agregar-ci" placeholder="C.I.Nº"></input>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-agregar-ci"></p></div>
                            </div>

                            <div class="row">
                                <label class="control-label col-3" for="agregar-estado" >Estado: </label>
                                <div class="col"> 
                                    <select class="form-control" id="agregar-estado"> 
                                        <% for (int z = 0; z < estado_lista.size(); z++) {%> 
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
                                <label class="control-label col-3" for="agregar-ruc" >Ruc: </label>
                                <div class="col">
                                    <input type="text" class="form-control" id="agregar-ruc" placeholder="R.U.C."></input>
                                </div>
                            </div>
                            <div class="row"> 
                                <div class="col-3"></div>
                                <div class="col"><p class="text-danger" style="font-size: 11px" id="validar-agregar-ruc"></p></div>
                            </div>
                        </div>

                        <div class="modal-footer">

                            <button id="btn-agregar" class="btn btn-defaul"  data-dismiss="" onclick="agregar()">Agregar</button>
                        </div>
                    </div>
                </div>
            </div>

            <script>

                $(document).ready(function () {
                    $('#mytable').DataTable({
                        "language": {
                            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
                        }
                    });
                });
                

                function modalEliminar(fila) {
                    $(document).ready(function () {

                        $("#modal-eliminar").modal();
                        var idCliente = document.getElementById("idCliente-" + fila).textContent;
                        var nombre = document.getElementById("nombre-" + fila).textContent;
                        var apellido = document.getElementById("apellido-" + fila).textContent;
                        document.getElementById("eliminar-cliente-mensaje").textContent =
                                "¿Desea eliminar el cliente " + nombre + " " + apellido + "?";
                        document.getElementById("btn-eliminar").setAttribute("onclick", "eliminar('" + idCliente + "')");
                    });
                }
                
                function modalEditar(fila){
                    $(document).ready(function(){
                        
                        $("#modal-editar").modal();
                        document.getElementById("editar-idCliente").value = document.getElementById("idCliente-"+fila).textContent;
                        document.getElementById("editar-nombre").value = document.getElementById("nombre-"+fila).textContent; 
                        
                        document.getElementById("editar-ruc").value = document.getElementById("ruc-"+fila).textContent;
                        document.getElementById("editar-apellido").value = document.getElementById("apellido-"+fila).textContent;
                        document.getElementById("editar-direccion").value = document.getElementById("direccion-"+fila).textContent;
                        document.getElementById("editar-telefono").value = document.getElementById("telefono-"+fila).textContent;
                        document.getElementById("editar-ci").value = document.getElementById("ci-"+fila).textContent;
                        document.getElementById("editar-estado").value = document.getElementById("estado-"+fila).textContent;
                        
                        
                        document.getElementById("validar-idCliente").textContent = "";
                        document.getElementById("validar-nombre").textContent = "";
                        document.getElementById("validar-ruc").textContent = "";
                        document.getElementById("validar-apellido").textContent = "";
                        document.getElementById("validar-direccion").textContent = "";
                        document.getElementById("validar-telefono").textContent = "";
                        document.getElementById("validar-ci").textContent = "";
                      
                        document.getElementById("btn-editar").setAttribute("data-dismiss","");
                    });
                }
                
                function modalAgregar(){
                    $(document).ready(function(){
                        
                        $("#modal-agregar").modal();
                        document.getElementById("agregar-idCliente").value = "";
                        document.getElementById("agregar-nombre").value = ""; 
                        
                        document.getElementById("agregar-ruc").value = "";
                        document.getElementById("agregar-apellido").value = "";
                        document.getElementById("agregar-direccion").value = "";
                        document.getElementById("agregar-telefono").value = "";
                        document.getElementById("agregar-ci").value = "";
                        
                        
                        
                        document.getElementById("validar-agregar-idCliente").textContent = "";
                        document.getElementById("validar-agregar-nombre").textContent = "";
                        document.getElementById("validar-agregar-ruc").textContent = "";
                        document.getElementById("validar-agregar-apellido").textContent = "";
                        document.getElementById("validar-agregar-direccion").textContent = "";
                        document.getElementById("validar-agregar-telefono").textContent = "";
                        document.getElementById("validar-agregar-ci").textContent = "";
                        
                        document.getElementById("btn-agregar").setAttribute("data-dismiss","");
                      
                    });
                }

                function eliminar(idCliente) {


                    
                    document.getElementById("btn-eliminar").setAttribute("onclick", " ");
                    alert(idCliente + " ");
                    /* var xhttp = new XMLHttpRequest();
                     xhttp.onreadystatechange = function () {
                     if (this.readyState == 4 && this.status == 200) {
                     var operacion = JSON.parse(this.responseText);
                     if (operacion.eliminado) {
                     document.getElementById("alerta").innerHTML =
                     '<div class="alert alert-success alert-dismissible">' +
                     '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                     '<strong>¡Éxito!</strong> El registro se elimino correctamente' +
                     '</div>';
                     
                     
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
                     */

                }
                
                function editar(){
                    var nombre = document.getElementById("editar-nombre").value;
                    var idCliente = document.getElementById("editar-idCliente").value;
                   
                    var ruc = document.getElementById("editar-ruc").value;
                    var apellido = document.getElementById("editar-apellido").value;
                    var direccion = document.getElementById("editar-direccion").value;
                    var telefono = document.getElementById("editar-telefono").value;
                    var ci = document.getElementById("editar-ci").value;
                    var estado = document.getElementById("editar-estado").value;

                    var modificar = true;

                    if(validarTexto(nombre,"validar-nombre",15) == false){

                        modificar=false;
                    }
                    if(validarTexto(apellido,"validar-apellido",20) == false){
                        modificar=false;
                    }
                    if(validarTexto(direccion,"validar-direccion",40) == false){
                        modificar=false;
                    }
                    if(validarTexto(telefono,"validar-telefono",12) == false){
                        modificar=false;
                    }
                    if(validarTexto(ruc,"validar-ruc",100) == false){
                        modificar=false;
                    }




                    if(validarNumero(ci,"validar-ci",8) == false){
                        modificar=false;
                    }
                    if(modificar){
                        //llamar al ajax
                        var parametro ="&idCliente="+idCliente+
                                        
                                        "&nombre="+nombre+
                                        "&apellido="+apellido+
                                        "&direccion="+direccion+
                                        "&telefono="+telefono+
                                        "&ci="+ci+
                                        "&estado="+estado+
                                        "&ruc="+ruc;

                        /*var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function () {
                            if (this.readyState == 4 && this.status == 200) {
                                var operacion = JSON.parse(this.responseText);
                                if (operacion.modificado) {
                                    document.getElementById("alerta").innerHTML =
                                            '<div class="alert alert-success alert-dismissible">' +
                                            '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                                            '<strong>¡Éxito!</strong> El registro se modifico correctamente' +
                                            '</div>';


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
                                */
                        alert(parametro);
                        document.getElementById("btn-editar").setAttribute("data-dismiss","modal");
                        
                    }
                    
                
                }
                
                function agregar(){
                    var nombre = document.getElementById("agregar-nombre").value;
                    var idCliente = document.getElementById("agregar-idCliente").value;
                   
                    var ruc = document.getElementById("agregar-ruc").value;
                    var apellido = document.getElementById("agregar-apellido").value;
                    var direccion = document.getElementById("agregar-direccion").value;
                    var telefono = document.getElementById("agregar-telefono").value;
                    var ci = document.getElementById("agregar-ci").value;
                    var estado = document.getElementById("agregar-estado").value;

                    var agregar = true;

                    if(validarTexto(nombre,"validar-agregar-nombre",15) == false){

                        agregar=false;
                    }
                    if(validarTexto(apellido,"validar-agregar-apellido",20) == false){
                        agregar=false;
                    }
                    if(validarTexto(direccion,"validar-agregar-direccion",40) == false){
                        agregar=false;
                    }
                    if(validarTexto(telefono,"validar-agregar-telefono",12) == false){
                        agregar=false;
                    }
                    if(validarTexto(ruc,"validar-agregar-ruc",100) == false){
                        agregar=false;
                    }




                    if(validarNumero(ci,"validar-agregar-ci",8) == false){
                        agregar=false;
                    }
                    if(validarNumero(idCliente,"validar-agregar-idCliente",8) == false){
                        agregar=false;
                    }
                    if(agregar){
                        
                        var parametro ="&idCliente="+idCliente+
                                        
                                        "&nombre="+nombre+
                                        "&apellido="+apellido+
                                        "&direccion="+direccion+
                                        "&telefono="+telefono+
                                        "&ci="+ci+
                                        "&estado="+estado+
                                        "&ruc="+ruc;

                        /*llamar ajax y guardar*/
                        alert(parametro);
                        document.getElementById("btn-agregar").setAttribute("data-dismiss","modal");
                        
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
            </script>
    </body>
</html>
