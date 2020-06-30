<c:choose>  
    <c:when test="${param.marca!=null}">  

        <sql:query dataSource = "${conn}" var = "rp">
            SELECT * FROM producto WHERE id_marca=${param.marca}; 
        </sql:query>
    </c:when>  
    <c:when test="${param.categ!=null}">  
        <sql:query dataSource = "${conn}" var = "rp">
            SELECT * FROM producto WHERE id_categoria=${param.categ}; 
        </sql:query>

    </c:when>
    <c:otherwise>  
        <sql:query dataSource = "${conn}" var = "rp">
            SELECT * FROM producto;
        </sql:query>
    </c:otherwise>  
</c:choose>  
<sql:query dataSource = "${conn}" var = "rc">
    SELECT * FROM categoria;
</sql:query>
<sql:query dataSource = "${conn}" var = "rm">
    SELECT * FROM marca;
</sql:query>

<!-- Title Page -->
<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(images/heading-pages-02.jpg);">
    <h2 class="l-text2 t-center">
        Women 
    </h2>
    <p class="m-text13 t-center">
        New Arrivals Women Collection 2018 
    </p>
</section>


<!-- Content page -->
<section class="bgwhite p-t-55 p-b-65">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
                <div class="leftbar p-r-20 p-r-0-sm">
                    <!--  -->
                    <h4 class="m-text14 p-b-7">
                        Categorias
                    </h4>

                    <ul class="p-b-54">
                        <c:forEach var = "r" items = "${rc.rows}">
                            <li class="p-t-4">
                                <a href="?menu=tienda&categ=${r.id_categoria}" class="s-text13 active1">
                                    ${r.categoria}
                                </a>
                            </li>
                        </c:forEach>

                    </ul>

                    <!--  -->
                    <h4 class="m-text14 p-b-32">
                        Marcas
                    </h4>

                    <ul class="p-b-54">
                        <c:forEach var = "r" items = "${rm.rows}">
                            <li class="p-t-4">
                                <a href="?menu=tienda&marca=${r.id_marca}" class="s-text13 active1">
                                    ${r.marca}
                                </a>
                            </li>
                        </c:forEach>

                    </ul>


                    <div class="search-product pos-relative bo4 of-hidden">
                        <input class="s-text7 size6 p-l-23 p-r-50" type="text" name="search-product" placeholder="Buscar Productos...">

                        <button class="flex-c-m size5 ab-r-m color2 color0-hov trans-0-4">
                            <i class="fs-12 fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
                <!--  -->
                <div class="flex-sb-m flex-w p-b-35">
                    <div class="flex-w">
                        <div >
   
                        </div>

                        <div >

                        </div>
                    </div>

                    <span class="s-text8 p-t-5 p-b-5">
                        Mostrando 1 a 9 de 16 resultados
                    </span>
                </div>

                <!-- Product -->
                <div class="row">
                    <c:forEach var = "r" items = "${rp.rows}">
                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
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
                                        ${r.precio_venta}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination -->
                <div class="pagination flex-m flex-w p-t-26">
                    <a href="" class="item-pagination flex-c-m trans-0-4 active-pagination">1</a>
                    <a class="item-pagination flex-c-m trans-0-4 " disabled>2</a>
                    <a  class="item-pagination flex-c-m trans-0-4 " disabled>3</a>
                </div>
            </div>
        </div>
    </div>
</section>


