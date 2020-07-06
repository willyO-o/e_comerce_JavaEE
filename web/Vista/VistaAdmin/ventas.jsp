
<!-- Main Sidebar Container -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Administracion Ventas</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="?menu=main">Administracion</a></li>
                        <li class="breadcrumb-item active">Ventas</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">

                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Listado de Ventas</h3>
                </div>
                <!-- /.card-header -->

                <div class="card-body" id="lista-prod">
                    <table id="tab-ventas" class="table table-bordered table-striped ">
                        <thead>
                            <tr>
                                <th>Nro</th>
                                <th>Pago</th>
                                <th>Total (Bs.)</th>
                                <th>Fecha</th>
                                <th>Nro Cliente</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Nro</th>
                                <th>Pago</th>
                                <th>Total (Bs.)</th>
                                <th>Fecha</th>
                                <th>Nro Cliente</th>
                                <th>Acciones</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<div class="modal fade" id="modal-lg" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Detalle de la Venta</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body" id="detalle-venta">
                <!-- Main content -->

            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <p></p>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>



