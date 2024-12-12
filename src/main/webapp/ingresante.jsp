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


<script src="js/ingresante.js"></script>
<div class="card">
    <div class="card-body">
        <form id="form">
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Periodo</label>
                <div class="col-sm-10">
                    <select  class="form-control" id="periodo" name="periodo" placeholder="" onchange="listadopostulantesajax(this.value)"></select>
                </div>  
            </div>
            <br>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Postulante</label>
                <div class="col-sm-10">
                    <input type="hidden" name="pk" id="pk">
                    <input type="hidden" name="listar" id="listar" value="agregar">
                    <input type="hidden" name="postulante" id="postulante">
                    <select  class="form-control" id="postulantes" name="postulantes" placeholder="" onchange="puntajes();"></select>
                </div>
            </div>
            <br>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Puntaje Total</label>
                <div class="col-sm-10">
                    <input type="hidden" name="total" id="total">
                    <input class="form-control" disabled type="number" name="total_" id="total_">
                </div>
            </div>
            <br>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Promedio</label>
                <div class="col-sm-10">
                    <input type="hidden" name="promedio" id="promedio">
                    <input class="form-control" disabled type="number" name="promedio_" id="promedio_">
                </div>
            </div>
            <br>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Compañia</label>
                <div class="col-sm-10">
                    <select  class="form-control" id="compañia" name="compañia" placeholder="" onchange="listadopelotonesajax(this.value)"></select>
                </div>  
            </div>
            <br>
             <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Peloton</label>
                <div class="col-sm-10">
                    <select  class="form-control" id="peloton" name="peloton" placeholder=""></select>
                </div>  
            </div>
            <br>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Seccion</label>
                <div class="col-sm-10">
                    <select  class="form-control" id="seccion" name="seccion" placeholder=""></select>
                </div>
            </div>
            <br>
            <div class="row justify-content-end">
                <div class="col-sm-10">
                    <button id="boton" type="button" class="btn btn-primary">Agregar</button>
                </div>
            </div>

        </form>

    </div>

</div>

<br>
<br>

<div class="card">
    <div class="p-3">
        <a  href="jsp/reportes.jsp?reporte=ingresantes "id="boton" type="button" class="btn btn-primary">Reporte</a>
    </div>
    <h5 class="card-header">Ingresantes</h5>
    <div class="text-nowrap">
        <table class="table" id="resultado"> 
            <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>Postulante</th>
                    <th>P. Total</th>
                    <th>Promedio</th>
                    <th>Compañia</th>
                    <th>Peloton</th>
                    <th>Seccion</th>
                    <th>Periodo</th>
                    <th>Accion</th>

                </tr>
            </thead>
            <tbody class="table-border-bottom-0">

            </tbody>
        </table>
    </div>
</div>





<%@include file="footer.jsp" %>



