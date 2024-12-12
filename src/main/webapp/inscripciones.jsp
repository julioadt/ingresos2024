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


<script src="js/inscripciones.js"></script>

<br>
<br>

<div class="card">
    <div class="p-3">
        <a  href="jsp/reportes.jsp?reporte=inscripciones"id="boton" type="button" class="btn btn-primary">Reporte</a>
    </div>
    <h5 class="card-header">Datos del Inscripto</h5>
    <input type="hidden" id="pk" name="pk">
    <div class=" text-nowrap">
        <table class="table" id="resultado"> 
            <thead class="table-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Fecha de Nac.</th>
                    <th>Ciudad</th>
                    <th>C.I.</th>
                    <th>C.I. Frente</th>
                    <th>C.I. Atras</th>
                    <th>Accion</th>

                </tr>
            </thead>
            <tbody class="table-border-bottom-0">

            </tbody>
        </table>
    </div>
</div>





<%@include file="footer.jsp" %>

