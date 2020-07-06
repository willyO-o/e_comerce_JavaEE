<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="es">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Factura</title>
        <link rel="icon"  type="image.png" href="icon.png">
        <link rel="stylesheet" href="css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
        <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="css/responsive.bootstrap4.min.css" rel="stylesheet"> 
        <link href="css/toastr.min.css" rel="stylesheet"> 
        <style>
            h4{
                font-weight: bold;
            }
            .botonn{
                z-index: 4!important;

            }
            @media print{
                .botonn{
                    display:none;
                } 

            }
            <c:if test="${venta.getEst()==0}">

                img.transparent {
                    filter:alpha(opacity=75);
                    opacity:.2;
                    z-index: 3;
                    position: absolute;
                    width: 70%;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    margin: auto;

                }
                .contenido{
                    position: relative;
                }
            </c:if>
        </style>
    </head>
    <body>


        <div class="container mt-5 mb-5 pb-5 pt-5 contenido">


            <div class="row">

                <div class="col-4">
                    <img src="img/logo.jpeg" width="200">
                </div>
                <div class="col-4">

                </div>
                <div class="col-4">
                    <div class="border row ">
                        <div class="col-6">
                            <p class="text-right"><b>NIT:</b></p>
                        </div>
                        <div class="col-6">
                            <p > 120000000023454</p>
                        </div>
                        <div class="col-6">
                            <p class="text-right"><b>Factura Nro.:</b></p>
                        </div>
                        <div class="col-6">
                            <p > 0000${ve.getIdVn()}</p>
                        </div>
                        <div class="col-6">
                            <p class="text-right"><b>AUTORIZACION No.:</b></p>
                        </div>
                        <div class="col-6">
                            <p > 7904006306693</p>
                        </div>
                    </div>
                    <p class="text-center"><b>ORIGINAL</b></p>
                    <p class="text-center"><b>Actividad Económica:</b> Tienda de Ropa Digital</p>
                </div>
            </div>
            <div class="row">
                <h1 class="text-center col-12"><b>FACTURA</b></h1>

            </div>
            <div class="row">
                <div class="col-6">

                    <p> Lugar y Fecha: <b>La Paz, ${ve.getFech()}</b></p>
                    <p> Señor(a): ${cl.getNom()} ${cl.getApe()}<b> </b></p>
                </div>
                <div class="col-6 d-flex justify-content-end">
                    <p> NIT/C.I.:  ${cl.getCi()}<b></b></p>
                </div>

            </div>
            <div class="">
                <table class="table table-bordered">
                    <thead class="thead-light text-center">
                        <tr>
                            <th style="width: 7rem" >Cantidad</th>
                            <th scope="col">Detalle</th>
                            <th scope="col" style="width: 12rem">P. Unit</th>
                            <th scope="col" style="width: 12rem" >Sub-Total</th>
                        </tr>
                    </thead>
                    <tbody class="text-right">
                        <c:forEach var="r" items="${ve.getCarr()}">
                            <tr>
                                <th scope="row" class="text-center">${r.getCan()} </th>
                                <td class="text-left">${r.getPro()}</td>
                                <td>${r.getPre()}</td>
                                <td>${r.getCan()*r.getPre()}</td>
                            </tr>
                        </c:forEach>

                        <tr>
                            <th scope="row" class="p-4"></th>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <th colspan="2" style="border: none"> </th>
                            <td class=" bg-light"><h4>Sub-Total: </h4></td>
                            <td class="bg-light "> <h4>Bs. ${total-total*0.13}</h4> </td>
                        </tr>
                        <tr>
                            <th colspan="2" style="border: none"></th>
                            <td class=" bg-light"><h4>IVA (13%): </h4></td>
                            <td class="bg-light "> <h4>Bs. ${total*0.13}</h4> </td>
                        </tr>
                        <tr>
                            <th colspan="2" style="border: none"> </th>
                            <td class=" bg-light"> <h4>Total:</h4> </td>
                            <td class="bg-light "> <h4>Bs. ${total}</h4> </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <p class="text-center"><b>"ESTA FACTURA CONTRIBUYE AL DESARROLLO DE PAIS. EL USO ILICITO DE ESTA SERA SANCIONADO DE ACUERDO A LEY"</b></p>


        </div>
        <div class="container mb-5">
            <div class="col-12">
                <button type="button" onclick="print()" class="btn btn-success botonn">
                    <i class="fas fa-print"></i>
                    Imprimir
                </button>
            </div>
        </div>

        <script src="js/vendor/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="js/vendor/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="https://kit.fontawesome.com/d790aeebdb.js" crossorigin="anonymous"></script>

        <script src="js/main.js"></script>

        <script>
                    function printHTML() {
                        if (window.print) {
                            window.print();
                        }
                    }
                    document.addEventListener("DOMContentLoaded", function (event) {
                        printHTML();
                    });
        </script>
    </body>
</html>
