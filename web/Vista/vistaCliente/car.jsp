<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="header-cart-wrapitem">


    <c:set var="total"  value="${0}"/>  
        <ul class="header-cart-wrapitem">
            <c:forEach var = "r" items = "${sessionScope.carrito}">
                <li class="header-cart-item">
                    <div class="header-cart-item-img" idpr="${r.getIdPr()}">
                        <img src="${r.getImg()}" alt="IMG">
                    </div>

                    <div class="header-cart-item-txt">
                        <a href="?menu=producto&id=${r.getIdPr()}" class="header-cart-item-name">
                            ${r.getPro()}
                        </a>

                        <span class="header-cart-item-info">
                            ${r.getCan()} x Bs.${r.getPre()}
                        </span>
                    </div>
                </li>
                <c:set var="total"  value="${total=total+r.getCan()*r.getPre()}"/> 
            </c:forEach>

        </ul>

        <div class="header-cart-total">
            Total: Bs. ${total}
        </div>

