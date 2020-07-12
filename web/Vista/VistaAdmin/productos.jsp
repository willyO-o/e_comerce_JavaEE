
<!-- Main Sidebar Container -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Administrar Productos</h1>
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
                    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-prod" id="btn-agrePr">
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
                                <th>Stock Min.</th>
                                <th>Garantia</th>
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
                                <th>Stock Min.</th>
                                <th>Garantia</th>
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
                                <input type="text" name="prod" class="form-control"  placeholder=" "  value="" id="fm-pro"> 
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Descripcion</label>
                                <textarea name="desc" class="form-control" placeholder="" rows="3"  value="" id="fm-des"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Caracteristicas</label>
                                <textarea name="carac" class="form-control" placeholder="" rows="3"  value="" id="fm-car"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Precio</label>
                                <input type="number" name="prec" class="form-control"  placeholder=" " step="0.05" min="1" id="fm-pre">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Stock</label>
                                <input type="number" name="stoc" class="form-control"  placeholder=" " min="1"  value="" id="fm-sto">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1"> Stock Minimo</label>
                                <input type="number" name="stocmin" class="form-control"  placeholder=" " min="1"  value="" id="fm-stM">
                            </div>



                        </div>
                        <div class="col-sm-6 px-4">
                            <div class="form-group">
                                <label for="exampleInputFile">Imagen</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="img"  id="fm-img" >
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
                                <input type="text" name="garan" class="form-control"  placeholder=" "  value="" id="fm-gar"> 
                            </div>
                             <div class="form-group">
                                <label for="exampleInputFile">Imagen 2</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="img2" id="fm-img2">
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
                                        <input type="file" class="custom-file-input" name="img3" id="fm-img3">
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
                                        <input type="file" class="custom-file-input" name="img4" id="fm-img4">
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

<div class="modal fade" id="modal-lg" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Large Modal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="card card-solid">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    <h3 class="d-inline-block d-sm-none" >LOWA Men?s Renegade GTX Mid Hiking Boots Review asdasdasd</h3>
                                    <div class="col-12">
                                        <img src="" id="img1-prod" class="product-image" alt="Product Image">
                                    </div>
                                    <div class="col-12 product-image-thumbs">
                                        <div class="product-image-thumb active"><img src="" id="img2-prod"  alt="Product Image"></div>
                                        <div class="product-image-thumb" ><img src="" id="img3-prod" alt="Product Image"></div>
                                        <div class="product-image-thumb" ><img src="" id="img4-prod" alt="Product Image"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <h3 class="my-3" id="tit-prod">LOWA Men?s Renegade GTX Mid Hiking Boots Review cm1pt</h3>

                                    <hr>
                                    <h4>Stock</h4>
                                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-default text-center active">
                                            <input type="radio" name="color_option" id="color_option1" autocomplete="off" checked="">
                                            Stock Actual
                                            <br>
                                            <h2 id="stock-prod"></h2>
                                        </label>
                                        <label class="btn btn-default text-center">
                                            <input type="radio" name="color_option" id="color_option2" autocomplete="off">
                                            Stock minimo
                                            <br>
                                            <h2 id="stoMin-prod"></h2>
                                        </label>
                                        
                                    </div>

                                    <h3 class="mt-3">Garantia</h3>
                                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-default text-center">
                                            <input type="radio" name="color_option" id="color_option1" autocomplete="off">
                                            <h3 id="gara-prod"></h3>
                                            <br>
                                            
                                        </label>

                                    </div>

                                    <div class="bg-gray py-2 px-3 mt-4">
                                        <h3>Precio de Venta Bs.</h3>
                                        <h2 class="mb-0" id="prec-prod">
                                            $80.00
                                        </h2>

                                    </div>

                                    <div class="mt-4">
                                        <div class="btn btn-default btn-lg btn-flat">
                                            <p><b>Marca</b></p>
                                            
                                            <p id="mar-prod">Add to Cart</p>
                                        </div>

                                        <div class="btn btn-default btn-lg btn-flat">
                                            <p><b>Categoria</b></p>
                                            
                                            <p id="cat-prod">Add to Wishlist</p>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="row mt-4">
                                <nav class="w-100">
                                    <div class="nav nav-tabs" id="product-tab" role="tablist">
                                        <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
                                        <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">Caracteristicas</a>
                                    </div>
                                </nav>
                                <div class="tab-content p-3" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae condimentum erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed posuere, purus at efficitur hendrerit, augue elit lacinia arcu, a eleifend sem elit et nunc. Sed rutrum vestibulum est, sit amet cursus dolor fermentum vel. Suspendisse mi nibh, congue et ante et, commodo mattis lacus. Duis varius finibus purus sed venenatis. Vivamus varius metus quam, id dapibus velit mattis eu. Praesent et semper risus. Vestibulum erat erat, condimentum at elit at, bibendum placerat orci. Nullam gravida velit mauris, in pellentesque urna pellentesque viverra. Nullam non pellentesque justo, et ultricies neque. Praesent vel metus rutrum, tempus erat a, rutrum ante. Quisque interdum efficitur nunc vitae consectetur. Suspendisse venenatis, tortor non convallis interdum, urna mi molestie eros, vel tempor justo lacus ac justo. Fusce id enim a erat fringilla sollicitudin ultrices vel metus. </div>
                                    <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab"> Vivamus rhoncus nisl sed venenatis luctus. Sed condimentum risus ut tortor feugiat laoreet. Suspendisse potenti. Donec et finibus sem, ut commodo lectus. Cras eget neque dignissim, placerat orci interdum, venenatis odio. Nulla turpis elit, consequat eu eros ac, consectetur fringilla urna. Duis gravida ex pulvinar mauris ornare, eget porttitor enim vulputate. Mauris hendrerit, massa nec aliquam cursus, ex elit euismod lorem, vehicula rhoncus nisl dui sit amet eros. Nulla turpis lorem, dignissim a sapien eget, ultrices venenatis dolor. Curabitur vel turpis at magna elementum hendrerit vel id dui. Curabitur a ex ullamcorper, ornare velit vel, tincidunt ipsum. </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </section>
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








