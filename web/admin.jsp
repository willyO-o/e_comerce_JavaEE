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
        case "about":
        %>
            <%@include file="Vista/VistaAdmin/main.jsp" %>
        <%
            break;
        case "carrito":
        %>
        <%@include file="Vista/VistaAdmin/main.jsp" %>
        <%
            break;
        case "contacto":
        %>
        <%@include file="Vista/VistaAdmin/main.jsp" %>
        <%
            break;
        case "tienda":
        %>
        <%@include file="Vista/VistaAdmin/main.jsp" %>
        <%
            break;

        case "productos":
        %>
        <%@include file="Vista/VistaAdmin/productos.jsp" %>
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
