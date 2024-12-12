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


<script src="js/usuarios.js"></script>

<div class="card">
    <div class="card-body">
        <form id="form">
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">usuario</label>
                <div class="col-sm-10">

                    <input type="hidden" name="pk" id="pk">
                    <input type="hidden" name="listar" id="listar" value="agregar">
                    <input type="text" class="form-control" id="usuario" name="nombre" placeholder="" />
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">clave</label>
                <div class="col-sm-10">

                    <input type="text" class="form-control" id="clave" name="clave" placeholder="" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">rol</label>
                <div class="col-sm-10">
                    <select  class="form-control" id="rol" name="rol" placeholder="">
                        <option value="ADMIN"> ADMINISTRADOR </option>
                        <option value="INSTRUCTOR"> INSTRUCTOR </option>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label" for="basic-default-name">estado</label>
                <div class="col-sm-10">
                    <select  class="form-control" id="estado" name="estado" placeholder="">
                          <option value="ACTIVO"> ACTIVO </option>
                        <option value="INACTIVO"> INACTIVO </option>
                    </select>
                </div>
            </div>

            <div class="row justify-content-end">
                <div class="col-sm-10">
                    <button id="boton" type="button" class="btn btn-primary">Ingresar</button>
                </div>
            </div>

        </form>

    </div>

</div>

<br>
<br>

<div class="card">
    <div class="col-sm-10">
        <a  href="jsp/reportes.jsp?reporte=usuarios"id="boton" type="button" class="btn btn-primary">Reportes</a>
                </div>
    <h5 class="card-header">Datos del Usuarios</h5>
    <div class="text-nowrap">
        <table class="table" id="resultado"> 
            <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>clave</th>
                    <th>rol</th>
                    <th>estado</th>           
                    <th>Accion</th>

                </tr>
            </thead>
            <tbody class="table-border-bottom-0">

            </tbody>
        </table>
    </div>
</div>







<%@include file="footer.jsp" %>