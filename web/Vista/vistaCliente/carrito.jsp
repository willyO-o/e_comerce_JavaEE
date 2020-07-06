
<!-- Title Page -->
<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/heading-pages-01.jpg);">
    <h2 class="l-text2 t-center">
        Carrito
    </h2>
</section>

<!-- Cart -->
<section class="cart bgwhite p-t-70 p-b-100">
    <div class="container">
        <!-- Cart item -->
        <div class="container-table-cart pos-relative">
            <div class="wrap-table-shopping-cart bgwhite">
                <table class="table-shopping-cart"  id="tab-carrito">
                    <tr class="table-head">
                        <th class="column-1"></th>
                        <th class="column-2">Producto</th>
                        <th class="column-3">Precio</th>
                        <th class="column-4 p-l-70">Cantidad</th>
                        <th class="column-5">Sub-Total</th>
                    </tr>
                    <c:forEach var="c" items="${carrito}">
                        <tr class="table-row">
                            <td class="column-1">
                                <div class="cart-img-product b-rad-4 o-f-hidden">
                                    <img src="${c.getImg()}" alt="IMG-PRODUCT" class="img-carrito" idpr="${c.getIdPr()}">
                                </div>
                            </td>
                            <td class="column-2 ">${c.getPro()}</td>
                            <td class="column-3 ">${c.getPre()}</td>
                            <td class="column-4">
                                <div class="flex-w bo5 of-hidden w-size17">


                                    <input class="size4 m-text18 t-center num-producto" type="number" name="num-product1" value="${c.getCan()}" idpr="${c.getIdPr()}" max="${c.getStok()}" min="1">

                                </div>
                            </td>
                            <td class="column-5 td-total">${c.getTot()}</td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>


        <!-- Total -->
        <form action="ControladorPedido" method="post" id="form-pedido">
            <div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm">
                <h5 class="m-text20 p-b-24">
                    Realizar Pedido 
                </h5>

                <!--  -->
                <div class="flex-w flex-sb-m p-b-12">
                    <span class="s-text18 w-size19 w-full-sm">
                        Subtotal Bs.:
                    </span>

                    <span class="m-text21 w-size20 w-full-sm total-del-carrito" >
                        0.00
                    </span>
                </div>

                <!--  -->
                <div class="flex-w flex-sb bo10 p-t-15 p-b-20">
                    <h5 class="m-text20 p-b-24">
                        Seleccione tipo de Pago
                    </h5>

                    <div class="w-size20 w-full-sm">

                    </div>
                    <div class="w-size20 w-full-sm">
                        <h5 class="">
                            Deposito Bancario
                        </h5>

                    </div>
                    <input type="radio" name="pago" value="Deposito Bancario" required>
                    <div class="w-size20 w-full-sm">
                        <h5 class="">
                            Contra Entrega
                        </h5>

                    </div>
                    <input type="radio" name="pago" value="Contra Entrega" required>
                    <div class="w-size20 w-full-sm">
                        <h5 class="">
                            Otras Formas de Pago
                        </h5>

                    </div>
                    <input type="radio" name="pago" value="Otras Formas" required>

                </div>
                <div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                        Deposito Bancario
                        <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <p class="s-text8">
                            color: negro,
                            para varon  sven
                        </p>
                        <small>PcBolivia debe recibir tu pago dentro de los 3 días calendarios siguientes a tu compra, ó tu pedido será cancelado.</small>
                    </div>
                </div>
                <div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                        Contra Entrega
                        <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <p class="s-text8">
                            color: negro,
                            para varon  sven
                        </p>
                        <small>PcBolivia debe recibir tu pago dentro de los 3 días calendarios siguientes a tu compra, ó tu pedido será cancelado.</small>
                    </div>
                </div>
                <div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                        Otra forma de Pago
                        <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <p class="s-text8">
                            Para otra forma de pago puedes comunicarte con nosotros: Por teléfono: <b>(591-2) 2245877 - 2245872</b> de Lunes a Viernes entre las 8:30 am y las 6:30 pm Sábado entre las 9:00 am y las 1:00 pm hora boliviana;
                        </p><br>
                        <small>PcBolivia debe recibir tu pago dentro de los 3 días calendarios siguientes a tu compra, ó tu pedido será cancelado.</small>

                    </div>
                </div>


                <!--  -->
                <div class="flex-w flex-sb-m p-t-26 p-b-30">
                    <span class="m-text22 w-size19 w-full-sm">
                        Total Bs.:
                    </span>

                    <span class="m-text21 w-size20 w-full-sm total-del-carrito">
                        0.00
                    </span>
                </div>

                <div class="size15 trans-0-4">
                    <!-- Button -->
                    <input type="hidden" name="accion" value="add">
                    <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" 
                            <c:if test="${sessionScope.tipo == null}">  
                                type="button"  data-toggle="modal" data-target="#modal-login"
                            </c:if> 
                            <c:if test="${sessionScope.tipo != null}">  
                                role="submit" 
                            </c:if> 
                            >
                        Solicitar Pedido
                    </button>
                </div>
            </div>
        </form>
    </div>
</section>

