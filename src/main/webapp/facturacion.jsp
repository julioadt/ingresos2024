<%@include file="header.jsp" %>




<script src="js/facturacion.js"></script>

<input type="hidden" id="pk">
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Proceso de Eliminacion</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h2>Desea anular esta factura?</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="borrar()" data-bs-toggle="modal" data-bs-target="#exampleModal">Si</button>
            </div>
        </div>
    </div>
</div>

<br>

<div class="card">
    <div class="card-body">


        <div class="p-3 d-flex">
            <a  href="factura_detalle.jsp" id="boton" type="button" class="btn btn-primary">NUEVA FACTURA</a>
            <a class="btn btn-primary ms-5" href="jsp/reportes.jsp?reporte=facturas">Reporte</a>


        </div>

        <br>
        <div class="text-nowrap">
            <table class="table" id="resultado"> 
                <thead class="table-dark">
                    <tr>
                        <th>Id</th>
                        <th>Postulante</th>
                        <th>Fecha</th>
                        <th>Total</th>
                        <th>Accion</th>

                    </tr>
                </thead>
                <tbody class="table-border-bottom-0">

                </tbody>
            </table>
        </div>





    </div>     

</div>
<br>

<%@include file="footer.jsp" %>



