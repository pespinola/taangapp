<%-- 
    Document   : validacion_input
    Created on : 16-abr-2018, 11:07:06
    Author     : Acer
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="paginaCabecera.jsp" %>
    </head>
    <body>
        <%

            //Select de estado de cliente
            ArrayList<String> estado_lista = new ArrayList();
            estado_lista.add("activo");
            estado_lista.add("inactivo");

        %>
        <h1>Hello World!</h1>

            <form class="container" novalidate="" action="/echo" method="POST" id="myForm">
                <div class="form-group">
                    <label class="form-control-label" for="inputSuccess1">Enter some input</label>
                    <input class="form-control " name="i1" id="inputSuccess1" required > 
                    <div class="valid-feedback">Success! You've done it.</div>
                    <div class="invalid-feedback">No, you missed this one.</div>
                </div>
                <div class="form-group">
                    <label class="form-control-label" for="inputSuccess2">Enter some input</label>
                    <input type="text" class="form-control" name="i2" required id="inputSuccess2">
                    <div class="valid-feedback">Nice! You got this one!</div>
                    <div class="invalid-feedback">Sorry, you missed this one.</div>
                </div>
                <div>
                    <button type="submit" class="btn btn-secondary" id="btnSubmit">Try It!</button>
                </div>
            </form>
            <hr>
            <form class="container">
                <div class="form-group">
                    <label class="form-control-label" for="inputSuccess3">Input with <code>is-valid</code></label>
                    <input type="text" class="form-control is-valid" id="inputSuccess3">
                    <div class="valid-feedback">Success! You've done it.</div>
                </div>
            </form>
            <script>
                function modalEditar(fila) {
                    $(document).ready(function () {

                        $("#modal-editar").modal();
                        document.getElementById("btn-editar").setAttribute("data-dismiss", "");
                    });
                }
                
                $("#btnSubmit").click(function(event) {

                    // Fetch form to apply custom Bootstrap validation
                    var form = $("#myForm")

                    if (form[0].checkValidity() === false) {
                      event.preventDefault()
                      event.stopPropagation()
                    }

                    form.addClass('was-validated');
                    // Perform ajax submit here...

                });

            </script>
    </body>
</html>
