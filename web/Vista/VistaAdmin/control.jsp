<c:if test="${sessionScope.tipo!="admin"}">
    <c:redirect url = "index.jsp"/>
</c:if>