<sql:query dataSource = "${conn}" var = "rd">
    SELECT * FROM producto LEFT JOIN categoria USING(id_categoria) LEFT JOIN marca USING(id_marca) LEFT JOIN imagenes USING(id_producto) WHERE id_producto=${param.id}; 
</sql:query>
<sql:query dataSource = "${conn}" var = "rs">
    SELECT * FROM producto LIMIT 0,8;
</sql:query>
<!-- breadcrumb -->
<div class="bread-crumb bgwhite flex-w p-l-52 p-r-15 p-t-30 p-l-15-sm">
    <a href="index.jsp" class="s-text16">
        Home 
        <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
    </a>

    <a  class="s-text16">
        Detalle del producto

    </a>

</div>
<c:forEach var = "r" items = "${rd.rows}">
    <!-- Product Detail -->
    <div class="container bgwhite p-t-35 p-b-80">
        <div class="flex-w flex-sb">
            <div class="w-size13 p-t-30 respon5">
                <div class="wrap-slick3 flex-sb flex-w">
                    <div class="wrap-slick3-dots"></div>

                    <div class="slick3">
                        <div class="item-slick3" data-thumb="${r.imagen}">
                            <div class="wrap-pic-w">
                                <img src="${r.imagen}" alt="IMG-PRODUCT">
                            </div>
                        </div>
                        <div class="item-slick3" data-thumb="${r.imagen1}">
                            <div class="wrap-pic-w">
                                <img src="${r.imagen1}" alt="IMG-PRODUCT">
                            </div>
                        </div>

                        <div class="item-slick3" data-thumb="${r.imagen2}">
                            <div class="wrap-pic-w">
                                <img src="${r.imagen2}" alt="IMG-PRODUCT">
                            </div>
                        </div>

                        <div class="item-slick3" data-thumb="${r.imagen3}">
                            <div class="wrap-pic-w">
                                <img src="${r.imagen3}" alt="IMG-PRODUCT">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w-size14 p-t-30 respon5">
                <h2 class="product-detail-name m-text16 p-b-13">
                    <b>${r.producto}</b>
                </h2>

                <span class="m-text17">
                    Bs. ${r.precio_venta}
                </span>
                <br><hr>
                <span class="m-text17">
                    Garantia:  <b>${r.garantia} </b>
                </span>
                <br><br>
                <span class="m-text17">
                    En Stock: <b>${r.stock}</b>
                </span>

                <!--  -->
                <div class="p-t-33 p-b-60">
                    <div class="flex-m flex-w p-b-10">

                    </div>

                    <div class="flex-m flex-w">

                    </div>

                    <div class="flex-r-m flex-w p-t-10">
                        <div class="w-size16 flex-m flex-w">
                            <div class="flex-w bo5 of-hidden m-r-22 m-t-10 m-b-10">
                                <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
                                    <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                                </button>

                                <input class="size8 m-text18 t-center num-product" type="number" name="num-product" value="1" max="${r.stock}" min="1" id="cantidad-producto-add">

                                <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
                                    <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                                </button>
                            </div>

                            <div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10">
                                <!-- Button -->
                                <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4 btn-add-al-carrito" idpr="${r.id_producto}">
                                    Al Carrito
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="p-b-45">
                    <span class="s-text8 m-r-35">Marca: ${r.marca}</span>
                    <span class="s-text8">Categoria: ${r.categoria}</span>
                </div>

                <!--  -->
                <div class="wrap-dropdown-content bo6 p-t-15 p-b-14 active-dropdown-content">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                        Descripcion
                        <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <p class="s-text8">
                            ${r.descripcion_prod}
                        </p>
                    </div>
                </div>

                <div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                        Caracteristicas
                        <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <p class="s-text8">
                            ${r.caracteristicas_prod}
                        </p>
                    </div>
                </div>

                <div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                        Reviews (0)
                        <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <p class="s-text8">
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<!-- Relate Product -->
<section class="relateproduct bgwhite p-t-45 p-b-138">
    <div class="container">
        <div class="sec-title p-b-60">
            <h3 class="m-text5 t-center">
                Productos Relacionados
            </h3>
        </div>

        <!-- Slide2 -->
        <div class="wrap-slick2">
            <div class="slick2">
                <c:forEach var = "r" items = "${rs.rows}">
                    <div class="item-slick2 p-l-15 p-r-15">
                        <!-- Block2 -->
                        <div class="block2">
                            <div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
                                <img src="${r.imagen}" alt="IMG-PRODUCT">

                                <div class="block2-overlay trans-0-4">
           

                                    <div class="block2-btn-addcart w-size1 trans-0-4">
                                        <!-- Button -->
                                        <button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4 btn-add-al-carrito" idpr="${r.id_producto}">
                                            Al Carrito
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="block2-txt p-t-20">
                                <a href="?menu=producto&id=${r.id_producto}" class="block2-name dis-block s-text3 p-b-5">
                                    ${r.producto}
                                </a>

                                <span class="block2-price m-text6 p-r-5">
                                    Bs. ${r.precio_venta}
                                </span>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

    </div>
</section>



