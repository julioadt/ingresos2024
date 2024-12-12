<%@include file="header2.jsp" %>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Inscripcion enviada</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5>Una vez verificado sus datos nos comunicaremos con usted con el numero de telefono proporcionado.</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="javascript:location.reload();" data-bs-toggle="modal" data-bs-target="#exampleModal">Aceptar</button>
            </div>
        </div>
    </div>
</div>




<script src="js/inscripcion.js"></script>
<div class="card">
    <div class="card-body">
        <form id="form" enctype="multipart/form-data">

            <br>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Nombre</label>
                <div class="col-sm-10">

                    <input type="hidden" name="pk" id="pk">
                    <input type="hidden" name="listar" id="listar" value="agregar">
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="" />
                </div>
            </div>



            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Apellido</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="" />
                </div>
            </div>
            
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Ciudad</label>
                <div class="col-sm-10">
                    <select  class="form-control" id="ciudades" name="ciudad" placeholder=""></select>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Fecha nacimiento</label>
                <div class="col-sm-10">

                    <input type="hidden" name="pk" id="pk">
                    <input type="hidden" name="listar" id="listar" value="agregar">
                    <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" placeholder="" />
                </div>
            </div>
            
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">C.I.</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="ci" name="ci" placeholder="" />
                </div>
            </div>
            
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">C.I. frente</label>
                <div class="col-sm-10">

                    <input type="file" class="form-control" id="cifrente" name="cifrente" placeholder="" />
                </div>
            </div>
            
            
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">C.I. atras</label>
                <div class="col-sm-10">

                    <input type="file" class="form-control" id="ciatras" name=" ciatras" placeholder="" />
                </div>
            </div>
            
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Telefono</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="telefono" name="telefono" placeholder="" />
                </div>
            </div>
            
            <div class="row justify-content-end">
                <div class="col-sm-10">
                    <button id="boton" type="button" class="btn btn-primary">Inscribirme</button>
                </div>
            </div>

        </form>

    </div>

</div>

<br>
<br>

<%@include file="footer.jsp" %>

