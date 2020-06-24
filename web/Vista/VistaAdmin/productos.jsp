
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
                        <li class="breadcrumb-item"><a href="#">Administracion</a></li>
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
                    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-prod">
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
                    <table id="tab-productos" class="table table-bordered table-striped ">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Imagen</th>
                                <th>Precio (Bs.)</th>
                                <th>Stock </th>
                                <th>Categoria</th>
                                <th>Marca</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Producto</th>
                                <th>Imagen</th>
                                <th>Precio (Bs.)</th>
                                <th>Stock </th>
                                <th>Categoria</th>
                                <th>Marca</th>
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
<div class="modal fade" id="modal-prod">
    <div class="modal-dialog modal-xl">
        <form  action="ControladorProducto?accion=add" method="post" enctype="multipart/form-data" id="add-prod">
            <div class="modal-content">
                <div class="modal-header ">
                    <h4 class="modal-title ">Agregar Producto</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <!-- general form elements -->
                    <div class="row">
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="col-6 px-4">

                            <div class="form-group">
                                <label for="exampleInputEmail1"> Producto</label>
                                <input type="text" name="prod" class="form-control"  placeholder=" "  value=""> 
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Descripcion</label>
                                <textarea name="desc" class="form-control" placeholder="" rows="3"  value=""></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Caracteristicas</label>
                                <textarea name="carac" class="form-control" placeholder="" rows="3"  value=""></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Precio</label>
                                <input type="number" name="prec" class="form-control"  placeholder=" " step="0.05" min="1" >
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Stock</label>
                                <input type="number" name="stoc" class="form-control"  placeholder=" " min="1"  value="">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1"> Stock Minimo</label>
                                <input type="number" name="stocmin" class="form-control"  placeholder=" " min="1"  value="">
                            </div>



                        </div>
                        <div class="col-sm-6 px-4">
                            <div class="form-group">
                                <label for="exampleInputFile">Imagen</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="img" >
                                        <label class="custom-file-label" for="exampleInputFile">Subir  Imagen</label>
                                    </div>
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="">Subir</span>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group ">

                                <label >Categoria</label>
                                <select class="form-control" name="cate" id="categorias">
                                    <option value="0"><--Seleccione--></option>

                                </select>
                            </div>
                            <div class="form-group ">
                                <label >Marca</label>
                                <select class="form-control" name="marc" id="marcas">
                                    <option value="0"><--Seleccione--></option>
                                </select>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Garantia</label>
                                <input type="text" name="garan" class="form-control"  placeholder=" "  value=""> 
                            </div>
                             <div class="form-group">
                                <label for="exampleInputFile">Imagen 2</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="img2" >
                                        <label class="custom-file-label" for="exampleInputFile">Subir  Imagen</label>
                                    </div>
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="">Subir</span>
                                    </div>
                                </div>

                            </div>
                             <div class="form-group">
                                <label for="exampleInputFile">Imagen 3</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="img3" >
                                        <label class="custom-file-label" for="exampleInputFile">Subir  Imagen</label>
                                    </div>
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="">Subir</span>
                                    </div>
                                </div>

                            </div>
                             <div class="form-group">
                                <label for="exampleInputFile">Imagen 4</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="img4" >
                                        <label class="custom-file-label" for="exampleInputFile">Subir  Imagen</label>
                                    </div>
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="">Subir</span>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>

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



