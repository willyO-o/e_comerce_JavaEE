<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index.jsp" class="brand-link">
        <img src="img/logo.jpeg" alt="Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">Tienda</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <i class=" nav-icon  fas fa-user"></i>
            </div>
            <div class="info">
                <a href="#" class="d-block">${sessionScope.nombre} ${sessionScope.apellido}</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                
                <li class="nav-item">
                    <a href="?menu=main" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                            
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="?menu=productos" class="nav-link">
                        <i class="nav-icon fas fa-boxes"></i>
                        <p>
                            Productos
                            
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="?menu=clientes" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Clientes
                           
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="?menu=pedidos" class="nav-link">
                        <i class="nav-icon fas fa-hand-holding"></i>
                        <p>
                            Pedidos
                            
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="?menu=ventas" class="nav-link">
                        <i class="nav-icon fas fa-cart-plus"></i>
                        <p>
                            Ventas
                            
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="?menu=marcas" class="nav-link">
                        <i class="nav-icon fas fa-bookmark"></i>
                        <p>
                            Marcas / Categorias
                            
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="?menu=usuarios" class="nav-link">
                        <i class="nav-icon fas fa-user-circle"></i>
                        <p>
                            Usuarios
                            
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
