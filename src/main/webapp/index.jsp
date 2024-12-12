<%-- 
    Document   : login
    Created on : 20 sept. 2024, 15:01:16
    Author     : alumno
--%>
<%-- 
    Document   : login
    Created on : 20 sept. 2024, 15:01:16
    Author     : alumno
--%>


<%@include file="header2.jsp" %>







<br>
<script src="js/index.js"></script>
<div class="card">
    <div class="card-body">

        <div class="row">
            <p>En la siguiente lista se visualiza unicamente a las personas que lograron ingresar en el periodo seleccionado. Si su nombre no aparece en la lista, no alcanzo el puntaje necesario.</p>
            <p>Puede solicitar revision en el departamento academico de Lunes a Viernes de 09:00 a 17:00 horas.</p>
        </div>

        <br>
        <div class="table-responsive text-nowrap">
            <table class="table" id="resultado"> 
                <thead class="table-dark">
                    <tr>
                        <th>Postulante</th>
                        <th>P. Total</th>
                        <th>Promedio</th>
                        <th>Compañia</th>
                        <th>Peloton</th>
                        <th>Seccion</th>
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

