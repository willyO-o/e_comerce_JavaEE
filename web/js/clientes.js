$(function () {
    "use strict";

    listarClientes();

    function listarClientes() {
        let tabla = $('#tab-clientes').DataTable({
            destroy: true,
            responsive: true,
            autoWidth: false,
            dom: 'Bfrtip',

            ajax: {
                url: "ControladorCliente?accion=listar",
                method: "GET"
            },
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Data export',
                    className: 'btn btn-success',
                    text: "Excel",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7]
                    }
                },
                {
                    extend: 'csvHtml5',
                    title: 'Data export',
                    className: 'btn btn-secondary',
                    text: "Csv",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Data export',
                    className: 'btn btn-danger',
                    text: "Pdf",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7]
                    }
                },
                {
                    extend: 'print',
                    title: 'Data export',
                    className: 'btn btn-primary',
                    text: "Imprimir",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7]
                    }
                }
            ],
            columns: [
                {data: "nom"},
                {data: "ape"},
                {data: "ci"},
                {data: "email"},
                {data: "fec"},
                {data: "tel"},
                {data: "dir"},
                {data: "ciud"},
                {data: "idCl",
                    render: function (data) {
                        return  "<button class='btn btn-danger btn-delet mx-2' id='" + data + "'><i class='fas fa-trash'></i></button>";
                    }
                }

            ],
            language: espaniol
        });
    }

    $("#tab-clientes").on("click", ".btn-delet", function () {
        let id = $(this).attr("id");
        console.log(id);
        let datos = {id: id, accion: "delete"};
        let url = "ControladorCliente";
        eliminar(datos, url, listarClientes);
    });

    function eliminar(datos, url, funcion) {


        Swal.fire({
            title: 'Esta usted Seguro?',
            text: "Esta accion no se puede deshacer!",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Elimnar objeto!'
        }).then((result) => {
            if (result.value) {

                $.ajax({

                    type: "POST",
                    data: datos,
                    url: url,
                    dataType: "json",
                    success: function (data) {
                        let resultado = data;

                        //console.log(resultado);

                        if (resultado.res === 'exito') {
                            Swal.fire(
                                    'Listo !!',
                                    'Eliminado ',
                                    'success'
                                    );
                            funcion();

                        } else {
                            Swal.fire(
                                    'Error !!',
                                    'correo o passowrd incorrectos, intente de nuevo ',
                                    'error'
                                    );
                        }
                    }
                });

            }
        });

    }






    ///************************ pedidos**********************

    listarPedidos();

    $("#tab-pedidos").on("click", ".btn-ver", function () {
        let id = $(this).attr("id");
        let idc = $(this).parents().parents("tr").find("td .idcl").text();
        //console.log(idc);
        $("#detalle-pedido").load("Vista/VistaAdmin/detallePedido.jsp?id=" + id + "&idc=" + idc);
    });

    $("#tab-pedidos").on("click", ".btn-estado", function () {
        let id = $(this).parents().parents("tr").find("td .btn-ver").attr("id");
        //console.log(id);

        Swal.fire({
            title: 'Esta usted Seguro?',
            text: "Esta accion no se puede deshacer!",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Confirmar pago!'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    type: "post",
                    url: "ControladorPedido",
                    data: "accion=estado&id=" + id,
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        if (data.res === "exito") {
                            Swal.fire(
                                    'Listo !!',
                                    'Estado del Pedido Cambiado ',
                                    'success'
                                    );
                            listarPedidos();
                        }

                    }
                });
            }
        });
    });

    $("#tab-pedidos").on("click", ".btn-delet", function () {
        let id = $(this).attr("id");
        //console.log(id);
        let datos = {id: id, accion: "delete"};
        let url = "ControladorPedido";
        eliminar(datos, url, listarPedidos);
    });

    function listarPedidos() {
        let tabla = $('#tab-pedidos').DataTable({
            destroy: true,
            responsive: true,
            autoWidth: false,
            dom: 'Bfrtip',

            ajax: {
                url: "ControladorPedido?accion=listar",
                method: "GET"
            },
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Data export',
                    className: 'btn btn-success',
                    text: "Excel",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6]
                    }
                },
                {
                    extend: 'csvHtml5',
                    title: 'Data export',
                    className: 'btn btn-secondary',
                    text: "Csv",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Data export',
                    className: 'btn btn-danger',
                    text: "Pdf",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6]
                    }
                },
                {
                    extend: 'print',
                    title: 'Data export',
                    className: 'btn btn-primary',
                    text: "Imprimir",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6]
                    }
                }
            ],
            columns: [
                {data: "idPd",
                    render: function (data) {
                        return "0000" + data;
                    }
                },
                {data: "pago"},
                {data: "prod"},
                {data: "tot"},
                {data: "fech"},
                {data: "esta",
                    render: function (data) {
                        switch (data) {
                            case 0:
                                return  "<span class='right badge badge-warning'>Vencido</span>";
                                break;
                            case 1:
                                return  "<button class='btn btn-info btn-estado'>Pendiente</button>";
                                break;
                            case 2:
                                return  "<span class='right badge badge-success'>Pagado</span>";
                                break;
                        }
                    }
                },
                {data: "idCl",
                    render: function (data) {
                        return "<div class='idcl'>" + data + "</div>";
                    }
                },
                {data: "idPd",
                    render: function (data) {
                        return  "<button class='btn btn-danger btn-delet mx-2' id='" + data + "'><i class='fas fa-trash'></i></button>" + "<button class='btn btn-success btn-ver' data-toggle='modal' data-target='#modal-lg' type='button' id='" + data + "'><i class='fas fa-eye'></i></button>";
                    }
                }

            ],
            language: espaniol
        });
    }



    //*******************************VENTAS****************************************
    listarVentas();




    function listarVentas() {
        let tabla = $('#tab-ventas').DataTable({
            destroy: true,
            responsive: true,
            autoWidth: false,
            dom: 'Bfrtip',

            ajax: {
                url: "ControladorVenta?accion=listar",
                method: "GET"
            },
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Data export',
                    className: 'btn btn-success',
                    text: "Excel",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4]
                    }
                },
                {
                    extend: 'csvHtml5',
                    title: 'Data export',
                    className: 'btn btn-secondary',
                    text: "Csv",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Data export',
                    className: 'btn btn-danger',
                    text: "Pdf",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4]
                    }
                },
                {
                    extend: 'print',
                    title: 'Data export',
                    className: 'btn btn-primary',
                    text: "Imprimir",
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4]
                    }
                }
            ],
            columns: [
                {data: "idVn",
                    render: function (data) {
                        return "0000" + data;
                    }
                },
                {data: "pago"},
                {data: "tot"},
                {data: "fech"},
                {data: "idCl",
                    render: function (data) {
                        return "<div class='idcl'>" + data + "</div>";
                    }
                },
                {data: "idVn",
                    render: function (data) {
                        return   "<a class='btn btn-info btn-ver mx-2' target='_blank'  href='ControladorVenta?accion=factura&idv=" + data + "'><i class='fas fa-eye'></i> Ver</a>";
                    }
                }

            ],
            language: espaniol
        });
    }



    //***********************************Marcas******************************

    listarMarcas();
    $("#add-marca").on("submit", function (e) {
        e.preventDefault();

        let form = $(this);
        let datos = form.serializeArray();

        formularios(datos, form, listarMarcas);
    });

    $("#btn-agreMarc").on("click", function () {
        $("#accion").attr("value", "add");
        $("#fm-marc").val("");
        $("#modal-marca").modal('hide');

    });

    $("#tab-marcas").on("click", ".btn-editpr", function (e) {
        let id = $(this).attr("idp");
        let datos = {id: id, accion: "edit"};
        //console.log(id);
        $.ajax({
            url: "ControladorMarca",
            type: "post",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {

                    $("#fm-marc").val(data.mar);
                    $("#idmarca").val(data.idMar);
                    $("#accion").attr("value", "update");

                }
            }
        });
    });

    $("#tab-marcas").on("click", ".btn-delet", function () {
        let id = $(this).attr("id");
        //console.log(id);
        let datos = {id: id, accion: "delete"};
        let url = "ControladorMarca";
        eliminar(datos, url, listarMarcas);
    });

    function formularios(datos, form, funcion) {

        $.ajax({
            url: form.attr("action"),
            type: form.attr("method"),
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {

                    Swal.fire(
                            'Listo !!',
                            'Datos Registrados',
                            'success'
                            );
                    funcion();


                } else {
                    Swal.fire(
                            'Error !!',
                            'Ocurrio un error al registrar, intente de nuevo',
                            'error'
                            );
                }
            }
        });
    }


    function listarMarcas() {
        let tabla = $('#tab-marcas').DataTable({
            destroy: true,
            responsive: true,
            autoWidth: false,
            dom: 'Bfrtip',

            ajax: {
                url: "ControladorMarca?accion=listar",
                method: "GET"
            },
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Data export',
                    className: 'btn btn-success',
                    text: "Excel",
                    exportOptions: {
                        columns: [0, 1]
                    }
                },
                {
                    extend: 'csvHtml5',
                    title: 'Data export',
                    className: 'btn btn-secondary',
                    text: "Csv",
                    exportOptions: {
                        columns: [0, 1]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Data export',
                    className: 'btn btn-danger',
                    text: "Pdf",
                    exportOptions: {
                        columns: [0, 1]
                    }
                },
                {
                    extend: 'print',
                    title: 'Data export',
                    className: 'btn btn-primary',
                    text: "Imprimir",
                    exportOptions: {
                        columns: [0, 1]
                    }
                }
            ],
            columns: [
                {data: "mar"},

                {data: "idMar",
                    render: function (data) {
                        return "<button class='btn btn-warning btn-editpr ' data-toggle='modal' data-target='#modal-marca' idp='" + data + "' ><i class='fas fa-pencil-alt'></i></button>" + "<button class='btn btn-danger btn-delet mx-2' id='" + data + "'><i class='fas fa-trash'></i></button>";
                    }
                }

            ],
            language: espaniol
        });
    }


//********************************************Categorias **********************************************

    listarCategorias();

    $("#add-categoria").on("submit", function (e) {
        e.preventDefault();

        let form = $(this);
        let datos = form.serializeArray();

        formularios(datos, form, listarCategorias);
    });

    $("#btn-agreCateg").on("click", function () {
        $("#accioncat").attr("value", "add");
        $("#fm-cate").val("");
        $("#fm-des").val("");
        $("#modal-categoria").modal('hide');

    });

    $("#tab-categorias").on("click", ".btn-editpr", function (e) {
        let id = $(this).attr("idp");
        let datos = {id: id, accion: "edit"};
        //console.log(id);
        $.ajax({
            url: "ControladorCategoria",
            type: "post",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {

                    $("#fm-cate").val(data.cate);
                    $("#fm-des").val(data.desc);
                    $("#idcate").val(data.idCat);
                    $("#accioncat").attr("value", "update");

                }
            }
        });
    });

    $("#tab-categorias").on("click", ".btn-delet", function () {
        let id = $(this).attr("id");
        //console.log(id);
        let datos = {id: id, accion: "delete"};
        let url = "ControladorCategoria";
        eliminar(datos, url, listarMarcas);
    });


    function listarCategorias() {
        let tabla = $('#tab-categorias').DataTable({
            destroy: true,
            responsive: true,
            autoWidth: false,
            dom: 'Bfrtip',

            ajax: {
                url: "ControladorCategoria?accion=listar",
                method: "GET"
            },
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Data export',
                    className: 'btn btn-success',
                    text: "Excel",
                    exportOptions: {
                        columns: [0, 1, 2]
                    }
                },
                {
                    extend: 'csvHtml5',
                    title: 'Data export',
                    className: 'btn btn-secondary',
                    text: "Csv",
                    exportOptions: {
                        columns: [0, 1, 2]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Data export',
                    className: 'btn btn-danger',
                    text: "Pdf",
                    exportOptions: {
                        columns: [0, 1, 2]
                    }
                },
                {
                    extend: 'print',
                    title: 'Data export',
                    className: 'btn btn-primary',
                    text: "Imprimir",
                    exportOptions: {
                        columns: [0, 1, 2]
                    }
                }
            ],
            columns: [
                {data: "cate"},
                {data: "desc"},

                {data: "idCat",
                    render: function (data) {
                        return "<button class='btn btn-warning btn-editpr ' data-toggle='modal' data-target='#modal-categoria' idp='" + data + "' ><i class='fas fa-pencil-alt'></i></button>" + "<button class='btn btn-danger btn-delet mx-2' id='" + data + "'><i class='fas fa-trash'></i></button>";

                    }
                }

            ],
            language: espaniol
        });
    }

    //*********************************Usuarios******************************

    listarUsuarios();

    $("#add-user").on("submit", function (e) {
        e.preventDefault();

        let form = $(this);
        let datos = form.serializeArray();

        formularios(datos, form, listarUsuarios);
        form[0].reset();
    });

    $("#btn-agreUs").on("click", function () {
        $("#accionus").attr("value", "add");
        $("#fm-nom").val("");
        $("#fm-ape").val("");
        $("#fm-ema").val("");

    });

    $("#tab-usuarios").on("click", ".btn-estado", function () {
        let id = $(this).parents().parents("tr").find(" td .btn-editpr").attr("idp");
        let est = $(this).attr("est");
        let datos = {id: id, est: est, accion: "upEstado"};

        Swal.fire({
            title: 'Esta usted Seguro?',
            text: "Desea Cambiar el Estado del Usuario?",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Elimnar objeto!'
        }).then((result) => {
            if (result.value) {
                updateUser(datos);
            }
        });


    });

    function updateUser(datos) {
        $.ajax({
            url: "ControladorUser",
            type: "post",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    Swal.fire(
                            'Listo !!',
                            'Datos Actualizados',
                            'success'
                            );
                    listarUsuarios();
                }
            }
        });
    }

    $("#tab-usuarios").on("click", ".btn-editpr", function (e) {
        let id = $(this).attr("idp");
        let datos = {id: id, accion: "edit"};
        //console.log(id);
        $.ajax({
            url: "ControladorUser",
            type: "post",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    $("#accionus").attr("value", "update");
                    $("#fm-nom").val(data.nom);
                    $("#fm-ape").val(data.ape);
                    $("#fm-ema").val(data.email);
                    $("#idus").val(data.idUs);

                }
            }
        });
    });

    $("#tab-usuarios").on("click", ".btn-delet", function () {
        let id = $(this).attr("id");
        //console.log(id);
        let datos = {id: id, accion: "delete"};
        let url = "ControladorUser";
        eliminar(datos, url, listarMarcas);
    });

    function listarUsuarios() {
        let tabla = $('#tab-usuarios').DataTable({
            destroy: true,
            responsive: true,
            autoWidth: false,
            dom: 'Bfrtip',

            ajax: {
                url: "ControladorUser?accion=listar",
                method: "GET"
            },
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Data export',
                    className: 'btn btn-success',
                    text: "Excel",
                    exportOptions: {
                        columns: [0, 1, 2]
                    }
                },
                {
                    extend: 'csvHtml5',
                    title: 'Data export',
                    className: 'btn btn-secondary',
                    text: "Csv",
                    exportOptions: {
                        columns: [0, 1, 2]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Data export',
                    className: 'btn btn-danger',
                    text: "Pdf",
                    exportOptions: {
                        columns: [0, 1, 2]
                    }
                },
                {
                    extend: 'print',
                    title: 'Data export',
                    className: 'btn btn-primary',
                    text: "Imprimir",
                    exportOptions: {
                        columns: [0, 1, 2]
                    }
                }
            ],
            columns: [
                {data: "nom"},
                {data: "ape"},
                {data: "email"},
                {data: "est",
                    render: function (data) {
                        if (data === 1) {
                            return "<button class='btn btn-success btn-estado' est='" + data + "' >Activo</button>";
                        } else {
                            return "<button class='btn btn-warning btn-estado' est='" + data + "'>Inactivo</button>";
                        }
                    }
                },
                {data: "ulCn"},
                {data: "idUs",
                    render: function (data) {
                        return "<button class='btn btn-warning btn-editpr ' data-toggle='modal' data-target='#modal-user' idp='" + data + "' ><i class='fas fa-pencil-alt'></i></button>" + "<button class='btn btn-danger btn-delet mx-2' id='" + data + "'><i class='fas fa-trash'></i></button>";

                    }
                }

            ],
            language: espaniol
        });
    }



    //*********************ventas mes***************


    $.getJSON('ControladorVenta?accion=venMes', function (data) {
        var mes = [];
        var tot = [];
        Object.entries(data).forEach(([key, value]) => {

            mes.push(key);
            tot.push(value);

        });
        //console.log(mes);

        var areaChartOptions = {
            maintainAspectRatio: false,
            responsive: true,
            legend: {
                display: false
            },
            scales: {
                xAxes: [{
                        gridLines: {
                            display: false,
                        }
                    }],
                yAxes: [{
                        gridLines: {
                            display: false,
                        }
                    }]
            }
        }
        var areaChartData = {
            labels: mes,
            datasets: [
                {
                    label: 'Digital Goods',
                    backgroundColor: 'rgba(60,141,188,0.9)',
                    borderColor: 'rgba(60,141,188,0.8)',
                    pointRadius: false,
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(60,141,188,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data: tot
                }
            ]
        }

        var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
        var lineChartOptions = jQuery.extend(true, {}, areaChartOptions)
        var lineChartData = jQuery.extend(true, {}, areaChartData)
        lineChartData.datasets[0].fill = false;
        //lineChartData.datasets[1].fill = false;
        lineChartOptions.datasetFill = false

        var lineChart = new Chart(lineChartCanvas, {
            type: 'line',
            data: lineChartData,
            options: lineChartOptions
        })

    });




});

