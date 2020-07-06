<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="Vista/VistaAdmin/control.jsp" %>
<%@include file="Vista/VistaAdmin/header.jsp" %>
<%@include file="Vista/VistaAdmin/aside.jsp" %>
<% 
    String menu = (request.getParameter("menu")!=null ? request.getParameter("menu") : "main"); 
%>

<%
    switch(menu){
        case "main":
        %>
        <%@include file="Vista/VistaAdmin/main.jsp" %>
        <%
            break;
        case "clientes":
        %>
            <%@include file="Vista/VistaAdmin/clientes.jsp" %>
        <%
            break;
        case "pedidos":
        %>
        <%@include file="Vista/VistaAdmin/pedidos.jsp" %>
        <%
            break;
        case "ventas":
        %>
        <%@include file="Vista/VistaAdmin/ventas.jsp" %>
        <%
            break;
        case "marcas":
        %>
        <%@include file="Vista/VistaAdmin/marcas.jsp" %>
        <%
            break;

        case "productos":
        %>
        <%@include file="Vista/VistaAdmin/productos.jsp" %>
        <%
            break; 
        case "usuarios":
        %>
        <%@include file="Vista/VistaAdmin/usuarios.jsp" %>
        <%
            break;
        default:
        %>
        <%@include file="Vista/VistaAdmin/main.jsp" %>
        <%
            break;
    }
%>

<%@include file="Vista/VistaAdmin/footer.jsp" %>
