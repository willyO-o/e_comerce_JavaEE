<sql:query dataSource = "${conn}" var = "r">
    SELECT * FROM ciudad; 
</sql:query>
<!-- Title Page -->
<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/heading-pages-06.jpg);">
    <h2 class="l-text2 t-center">
        Registrarse
    </h2>
</section>

<!-- content page -->
<section class="bgwhite p-t-66 p-b-60">
    <div class="container">
        <div class="row">


            <div class="col-md-6 p-b-30">
                <form class="leave-comment" action="ControladorCliente" method="post" id="form-cliente">
                    <h4 class="m-text26 p-b-36 p-t-15">
                        Ingrese sus datos para el registro 
                    </h4>
                    <small>(Todos los campos son obligatorios)</small><hr>
                    <div class="bo4 of-hidden size15 m-b-20">
                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="nom" placeholder="Nombres" required>
                    </div>
                    <div class="bo4 of-hidden size15 m-b-20">
                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="ape" placeholder="Apellidos" required>
                    </div>
                    <div class="bo4 of-hidden size15 m-b-20">
                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="ci" placeholder="CI. o NIT" required>
                    </div>
                    <div class="bo4 of-hidden size15 m-b-20">
                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="dir" placeholder="Direccion" required>
                    </div>
                    <div class="bo4 of-hidden size15 m-b-20">
                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="tel" placeholder="Telefono o Celular" required>
                    </div>

                    <div class="row" >
                        <div class="col-sm-6">
                            <div class="bo4 of-hidden size15 m-b-20">
                                <select class="sizefull s-text7 p-l-22 p-r-22" name="ciu" required>
                                    <option value="0"><--Seleccione Ciudad--></option>
                                    <c:forEach var="r" items="${r.rows}">
                                        <option value="${r.id_ciudad}">${r.ciudad}</option>
                                    </c:forEach>
                                </select>

                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="bo4 of-hidden size15 m-b-20">
                                <select class="sizefull s-text7 p-l-22 p-r-22" disabled="">
                                    <option value="0">Bolivia</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="bo4 of-hidden size15 m-b-20">
                        <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="email" placeholder="Direccion de E-mail" required>
                    </div>
                    <div class="bo4 of-hidden size15 m-b-20">
                        <input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="pass" placeholder="Password" required>
                    </div>
                    <div class="">
                        
                        <input type="checkbox" name="terminos" id="terminos" required="">
                        <label>Estoy de Acuerdo con los terminos y condiciones</label>
                    </div>
                    <input type="hidden" name="accion" value="add" >
                    <div class="w-size25">
                        <!-- Button -->
                        <button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
                            Registrarse
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


