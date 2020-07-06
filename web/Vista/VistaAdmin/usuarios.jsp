
<!-- Main Sidebar Container -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Starter Page</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="?menu=main">Administracion</a></li>
                        <li class="breadcrumb-item active">Productos</li>
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
                    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-user" id="btn-agreUs">
                        Agregar Nuevo Producto
                    </button>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Listado de Productos</h3>
                </div>
                <!-- /.card-header -->

                <div class="card-body" id="lista-prod">
                    <table id="tab-usuarios" class="table table-bordered table-striped ">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Email</th>
                                <th>Estado</th>
                                <th>Ultima Conexion</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Email</th>
                                <th>Estado</th>
                                <th>Ultima Conexion</th>
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


<!-- modal agregar-->
<div class="modal fade" id="modal-user">
    <div class="modal-dialog modal-md">
        <form  action="ControladorUser" method="post" id="add-user">
            <div class="modal-content">
                <div class="modal-header ">
                    <h4 class="modal-title ">Agregar Usuario</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <!-- general form elements -->
                    <div class="row">
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="col-12 px-4">

                            <div class="form-group">
                                <label for="exampleInputEmail1"> Nombre</label>
                                <input type="text" name="nom" class="form-control"  placeholder=" "  value="" id="fm-nom"> 
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Apellido</label>
                                <input type="text" name="ape" class="form-control" placeholder=""  value="" id="fm-ape">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Email</label>
                                <input  type="text" name="email" class="form-control" placeholder=""  value="" id="fm-ema">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Password</label>
                                <input type="password" name="pas" class="form-control"  placeholder=" "  >
                            </div>

                        </div>
                       
                    </div>

                </div>
                <input type="hidden" name="id" value="" id="idus">
                <input type="hidden" name="accion" value="add" id="accionus">
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <i class="fas fa-ban"></i>
                        Cancelar
                    </button>
                    <button type="submit"  class="btn btn-success">
                        <i class="fas fa-save"></i> Guardar
                    </button>
                </div>
            </div>
        </form>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>






