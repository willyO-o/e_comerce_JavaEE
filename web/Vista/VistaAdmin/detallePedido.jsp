<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var = "conn" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost/bd_proyecto"
                   user = "root"  password = ""/>
<sql:query dataSource = "${conn}" var = "rs">
    SELECT * FROM pedido WHERE id_pedido=${param.id};
</sql:query>
<sql:query dataSource = "${conn}" var = "rc">
    SELECT * FROM cliente JOIN ciudad USING(id_ciudad) WHERE id_cliente=${param.idc};
</sql:query>
<sql:query dataSource = "${conn}" var = "rd">
    SELECT producto,cantidad_producto,precio,cantidad_producto*precio as total FROM participa_pedido JOIN producto USING(id_producto) WHERE id_pedido=${param.id};
</sql:query>

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">


                <!-- Main content -->
                <div class="invoice p-3 mb-3">
                    <!-- title row -->
                    <div class="row">
                        <div class="col-12">
                            <h4>
                                <i class="fas fa-globe"></i> Sandras´s Tienda Online
                                <small class="float-right"></small>
                            </h4>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                            Cliente
                            <c:forEach var="r" items="${rc.rows}"> 
                                <address>
                                    <strong>${r.nombre_cliente} ${r.apellido_cliente}</strong><br>
                                    Direccion: ${r.direccion}<br>
                                    Ciudad: ${r.ciudad}<br>
                                    Telefono: ${r.telefono}<br>
                                    Email: ${r.correo}<br>
                                    C.I./NIT: ${r.nit}
                                </address>
                            </c:forEach>
                        </div>
                        <!-- /.col -->
                        <c:forEach var="r" items="${rs.rows}"> 
                            <div class="col-sm-4 invoice-col">
                                <h3>Nro Pedido #0000${r.id_pedido}</h3><br>
                                <b>Tipo de Pago</b> ${r.tipo_pago}<br>
                                <b>Total</b> Bs.${r.total_pago}<br>
                                <b>Fecha</b> ${r.fecha_pedido}
                            </div>
                        </c:forEach>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- Table row -->
                    <div class="row">
                        <div class="col-12 table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Cantidad</th>
                                        <th>Producto</th>
                                        <th>Precio</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total"  value="${0}"/> 
                                    <c:forEach var="r" items="${rd.rows}"> 
                                        <tr>
                                            <td>${r.cantidad_producto}</td>
                                            <td>${r.producto}</td>
                                            <td>${r.precio}</td>
                                            <td>${r.total}</td>
                                        </tr>
                                        <c:set var="total"  value="${total=total+r.total}"/> 
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <!-- accepted payments column -->
                        <div class="col-6">

                        </div>
                        <!-- /.col -->
                        <div class="col-6">
                            <p class="lead">Amount Due 2/22/2014</p>

                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th style="width:50%">Subtotal:</th>
                                        <td>Bs.${total-total*0.13} </td>
                                    </tr>
                                    <tr>
                                        <th>IVA (13%)</th>
                                        <td>Bs. ${total*0.13}</td>
                                    </tr>

                                    <tr>
                                        <th>Total:</th>
                                        <td>Bs.${total}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- this row will not appear when printing -->

                </div>
                <!-- /.invoice -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</section>
