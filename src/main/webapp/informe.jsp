<%@include file="header.jsp" %>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Proceso de Eliminacion</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h2>Desea Eliminar</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="borrar()" data-bs-toggle="modal" data-bs-target="#exampleModal">Si</button>
            </div>
        </div>
    </div>
</div>


<script src="js/Informes.js"></script>

<div class="card">
    <div class="card-body">
        <form id="form">
             <div class="row mb-3">
                        <label class="col-form-label" for="basic-default-name">fechainicio</label>
                        <div class="col-sm-10">

                            <input type="hidden" name="pk" id="pk">
                            <input type="hidden" name="listar" id="listar" value="agregar">
                            <input type="date" class="form-control" id="fechainicio" name="fechainicio" placeholder="" />
                        </div>
                    </div>


              <div class="row mb-3">
                        <label class="col-form-label" for="basic-default-name">fechafin</label>
                        <div class="col-sm-10">

                            <input type="hidden" name="pk" id="pk">
                            <input type="hidden" name="listar" id="listar" value="agregar">
                            <input type="date" class="form-control" id="fechafin" name="fechafin" placeholder="" />
                        </div>
                    </div>
            <div class="row justify-content-end">
                <div class="col-sm-10">
                    <button id="boton" type="button" class="btn btn-primary">Informe</button>
                </div>
            </div>

        </form>

    </div>

</div>

<%@include file="footer.jsp" %>

