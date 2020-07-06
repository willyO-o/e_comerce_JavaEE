
<!-- Main Sidebar Container -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Administracion de Marcas  Y  Categorias</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="?menu=main">Administracion</a></li>
                        <li class="breadcrumb-item active">Marcas/Categorias</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-marca" id="btn-agreMarc">
                        Agregar Nueva Marca
                    </button>
                    <button type="button" class="btn btn-outline-primary mx-3" data-toggle="modal" data-target="#modal-categoria" id="btn-agreCateg">
                        Agregar Nueva Categoria
                    </button>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Listado de Marcas</h3>
                </div>
                <!-- /.card-header -->

                <div class="card-body" id="lista-prod">
                    <table id="tab-marcas" class="table table-bordered table-striped ">
                        <thead>
                            <tr>
                                <th>Marca</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Marca</th>
                                <th>Acciones</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>


            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Listado de Categorias</h3>
                </div>
                <!-- /.card-header -->

                <div class="card-body" id="lista-prod">
                    <table id="tab-categorias" class="table table-bordered table-striped ">
                        <thead>
                            <tr>
                                <th>Categoria</th>
                                <th>Descripcion</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Categoria</th>
                                <th>Descripcion</th>
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
<div class="modal fade" id="modal-marca">
    <div class="modal-dialog modal-sm">
        <form  action="ControladorMarca" method="post"  id="add-marca">
            <div class="modal-content">
                <div class="modal-header ">
                    <h4 class="modal-title titulo-modal">Agregar Marca</h4>
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
                                <label for="exampleInputEmail1"> Marca</label>
                                <input type="text" name="marca" class="form-control"  placeholder=" "  value="" id="fm-marc"> 
                            </div>


                        </div>
                    </div>

                </div>
                <input type="hidden" name="accion" value="add" id="accion">
                <input type="hidden" name="id" value="" id="idmarca">
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


<!--modal categoria -->
<div class="modal fade" id="modal-categoria" >
    <div class="modal-dialog modal-md">
        <form  action="ControladorCategoria" method="post"  id="add-categoria">
            <div class="modal-content">
                <div class="modal-header ">
                    <h4 class="modal-title titulo-modal">Agregar Categoria</h4>
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
                                <label for="exampleInputEmail1"> Categoria</label>
                                <input type="text" name="cate" class="form-control"  placeholder=" "  value="" id="fm-cate"> 
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Descripcion</label>
                                <textarea name="des" class="form-control"  placeholder=" "  value="" id="fm-des"></textarea>

                            </div>

                        </div>
                    </div>

                </div>
                <input type="hidden" name="accion" value="add" id="accioncat">
                <input type="hidden" name="id" value="" id="idcate">
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





