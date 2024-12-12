<%@include file="header.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
    Date fechaa = new Date();
    SimpleDateFormat formato1 = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat formato2 = new SimpleDateFormat("dd-MM-yyyy");
    String fecha = formato1.format(fechaa);
    String fecha2 = formato2.format(fechaa);
%>





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




<script src="js/examenes.js"></script>
<div class="col-sm-10">
</div>
<form id="form">
    <div class="card">
        <div class="card-body">
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Periodo</label>
                <div class="col-sm-10">
                    <select class="form-control" id="periodo_" name="periodo_"></select>
                    <input type="hidden" id="examen" name="examen" />
                </div>
                <br>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Fecha</label>
                <div class="col-sm-10">
                    <input type="hidden" id="fecha" name="fecha" value="<% out.print(fecha);  %>" />
                    <input disabled type="text" class="form-control" id="fecha_" placeholder="" value="<% out.print(fecha2);  %>" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Instructor</label>
                <div class="col-sm-10">
                    <select class="form-control" id="instructor" name="instructor"></select>
                </div>
                <br>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Examen</label>
                <div class="col-sm-10">
                    <input type="hidden" name="pk" id="pk">
                    <input type="hidden" name="listar" id="listar" value="agregar">
                    <select class="form-control" id="examen_" name="examen_"></select>
                    <input type="hidden" id="examen" name="examen" />
                </div>
                <br>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">TOTAL</label>
                <div class="col-sm-10">
                    <input type="hidden" id="total" name="total" />
                    <input disabled type="text" class="form-control" id="total_" placeholder="" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Minimo</label>
                <div class="col-sm-10">
                    <input type="hidden" id="promedio" name="promedio" />
                    <input disabled type="text" class="form-control" id="promedio_" placeholder="" />
                </div>
            </div>
        </div>     
    </div>
    <br>
    <div class="card">
        <div class="card-body">
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Postulante</label>
                <div class="col-sm-10">
                    <input type="hidden" name="pk" id="pk">
                    <input type="hidden" name="listar" id="listar" value="agregar">
                    <select  class="form-control" id="postulante" name="postulante" placeholder=""></select>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Puntaje</label>
                <div class="col-sm-10">
                    <input oninput="calcular()" type="number" class="form-control" id="puntaje" name="puntaje" placeholder="" />
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">Estado</label>
                <div class="col-sm-10">
                    <input type="hidden" id="estado" name="estado" />
                    <input disabled type="text" class="form-control" id="estado_" placeholder="" />
                </div>
            </div>
            <div class="pt-5">
                <div class="d-flex">
                    <div>
                        <button id="boton" type="button" class="btn btn-primary">Agregar</button>
                    </div>
                    <div class="ms-3">
                        <button id="cancelar" type="button" class="btn btn-primary">Cancelar</button>
                    </div>
                    <div class="ms-3">
                        <button id="finalizar" type="button" class="btn btn-primary">Finalizar</button>
                    </div>

                </div>
            </div>
        </div>

    </div>

</form>


<br>
<br>

<div class="card">
    <div class="col-sm-10">
        <a  href="jsp/reportes.jsp?reporte=examenes"id="boton" type="button" class="btn btn-primary">Reportes</a>
    </div>
    <h5 class="card-header">Resultados del Examen</h5>
    <div class="text-nowrap">
        <table class="table" id="resultado"> 
            <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>Postulante</th>
                    <th>Puntaje</th>
                    <th>Estado</th>
                    <th>Accion</th>

                </tr>
            </thead>
            <tbody class="table-border-bottom-0">

            </tbody>
        </table>
    </div>
</div>





<%@include file="footer.jsp" %>

