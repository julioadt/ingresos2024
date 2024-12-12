<%@include file="header.jsp" %>

<script src="js/factura_detalle.js"></script>

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



<div class="card">
    <div class="card-body">
        <form id="form">         
            <div class="row mb-3">

                <div class="d-flex w-100">

                    <div class="row mb-3 w-50">
                        <label class="col-form-label" for="basic-default-name">Postulante</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="pk" id="pk">
                            <input type="hidden" name="listar" id="listar" value="agregar">
                            <select  class="form-control" id="postulante" name="postulante" placeholder=""></select>
                        </div>
                    </div>
                    <div class="row mb-3 w-50">
                        <label class="col-form-label" for="basic-default-name">Concepto</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="pk" id="pk">
                            <input type="hidden" name="listar" id="listar" value="agregar">
                            <input type="hidden" name="concepto_" id="concepto_">
                            <select  class="form-control" id="concepto" name="concepto" onchange="dividir(this.value)"></select>
                        </div>
                    </div>
                </div>


            </div>



            <div class="row mb-3">

                <div class="d-flex w-100">

                    <div class="row mb-3">
                        <label class="col-form-label" for="basic-default-name">Fecha</label>
                        <div class="col-sm-10">

                            <input type="hidden" name="pk" id="pk">
                            <input type="hidden" name="listar" id="listar" value="agregar">
                            <input type="date" class="form-control" id="fecha" name="fecha" placeholder="" />
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-form-label" for="basic-default-name">Cantidad</label>
                        <div class="col-sm-10">
                            <input type="hidden" id="cantidad_" name="cantidad_" value="1" />
                            <input disabled type="text" class="form-control" id="cantidad" value="1" placeholder="" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-form-label" for="basic-default-name">Precio</label>
                        <div class="col-sm-10">
                            <input type="hidden" id="precio_" name="precio_" />
                            <input disabled type="text" class="form-control" id="precio" placeholder="" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="row mb-3">

                </div>
                <div class="d-flex">
                    <div class="">
                        <button id="boton" type="button" class="btn btn-primary">Agregar</button>
                    </div>
                    <div class="ms-3">
                        <button id="cancelar" type="button" class="btn btn-primary">Cancelar</button>
                    </div>
                    <div class="ms-3">
                        <button id="finalizar" type="button" class="btn btn-primary">Finalizar</button>
                    </div>                   
                </div>

        </form>

    </div>
</div>


</div>

<br>
<br>

<div class="card">
    <h5 class="card-header">FACTURA</h5>
    <div class="card-body">
        <div class="text-nowrap">
            <table class="table" id="resultado"> 
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Concepto</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>SUBTOTAL</th>
                        <th>Accion</th>

                    </tr>
                </thead>
                <tbody class="table-border-bottom-0">

                </tbody>
            </table>
        </div>
    </div>
</div>





<%@include file="footer.jsp" %>

