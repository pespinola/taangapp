<%-- 
    Document   : tabla
    Created on : 04-abr-2018, 12:03:45
    Author     : Acer
--%>

<%@page import="modelo.ClienteMng"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            //CAMBIAS EL CLIENTE POR OTRO OBJECTO
           List<Cliente> lista = null;

           ClienteMng cm = new ClienteMng();
           int totalCliente = cm.getTotalClientes();
            
           // PARAMETROS A CAMBIAR -------------------------
           ArrayList<String> listaColumnas= new ArrayList<>();
           ArrayList<String> listaCabeceras= new ArrayList<>();
            
           
            
           listaColumnas.add("campo1"); //DATOS MODIFICABLES,NOMBRES DE
           listaColumnas.add("campo2");//LOS ID DE CADA TAG
           listaColumnas.add("campo3");
           
           listaCabeceras.add("CAMPO 1");//TITULO DE LA TABLA,DEBE 
           listaCabeceras.add("CAMPO 2");
           listaCabeceras.add("CAMPO 3");
           
           
           //listaColumnas Y listaCabeceras DEBEN TENER MISMA LONGITUD
           
            //-----------------------------------------------------------------
            //Rango de registros que se visualizan en la pagina
            int salto = 3;// la cantidad de registro a mostrar(La cantidad de filas de la tabla)  
            int desde = 0; //El numero de registro desde donde se muestra en la pag.
            int hasta = 0;//El numero de registro hasta donde se muestra la pagina
            int total = 0; //la cantidad total de registros

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
                lista = cm.getClientes(desde, salto);//CAMBIAR ESTO
            }
            //-----------------------------------------------------------------
        %>
    </head>
    <body>
        
    </body>
</html>
