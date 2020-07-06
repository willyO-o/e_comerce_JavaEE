<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="Vista/vistaCliente/header.jsp" %>
<%@include file="Vista/vistaCliente/navegacion.jsp" %>
<% 
    String menu = (request.getParameter("menu")!=null ? request.getParameter("menu") : "home"); 
%>

<%
    switch(menu){
        case "home":
        %>
        <%@include file="Vista/vistaCliente/home.jsp" %>
        <%
            break;
        case "about":
        %>
            <%@include file="Vista/vistaCliente/about.jsp" %>
        <%
            break;
        case "carrito":
        %>
        <%@include file="Vista/vistaCliente/carrito.jsp" %>
        <%
            break;
        case "contacto":
        %>
        <%@include file="Vista/vistaCliente/contacto.jsp" %>
        <%
            break;
        case "tienda":
        %>
        <%@include file="Vista/vistaCliente/tienda.jsp" %>
        <%
            break;
        case "registro":
        %>
        <%@include file="Vista/vistaCliente/registro.jsp" %>
        <%
            break;
        default:
        %>
        <%@include file="Vista/vistaCliente/home.jsp" %>
        <%
            break;
        case "producto":
        %>
        <%@include file="Vista/vistaCliente/producto.jsp" %>
        <%
            break;
    }
%>

<%@include file="Vista/vistaCliente/footer.jsp" %>
