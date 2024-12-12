<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from ingresantes i inner join postulantes p on i.postulante=p.id inner join pelotones a on a.id=i.peloton inner join secciones s on s.id=i.seccion inner join compañia c on a.compañia=c.id inner join periodos pe on pe.id=i.periodo;");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(9)+ " "+rs.getString(10)); %></td>
    <td><%out.print(rs.getString(6)); %></td>
    <td><%out.print(rs.getString(7)); %></td>
    <td><%out.print(rs.getString(22)); %></td>
    <td><%out.print(rs.getString(16)); %></td>
    <td><%out.print(rs.getString(20)); %></td>
    <td><%out.print(rs.getString(24)); %></td>
    <td>
        <div class="dropdown">
            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                <i class="bx bx-dots-vertical-rounded"></i>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="eliminar('<%out.print(rs.getString(1)); %>')"
                   ><i class="bx bx-trash me-1" ></i> Eliminar</a
                >
                <a class="dropdown-item"
                   href="jsp/reportes.jsp?reporte=pelotones2&codigo=<%out.print(rs.getString(1)); %>"
                   ><i class="bx bx-trash me-1" ></i> Reporte</a
                >
            </div>
        </div>
    </td>
</tr>
<%
    }
}
catch (Exception e) {
  out.println("error PSQL"+ e); 
}
} 
else if (request.getParameter("listar").equals("agregar")){
   String postulante = request.getParameter("postulante");
   String peloton = request.getParameter("peloton");
   String seccion = request.getParameter("seccion");
    String periodo = request.getParameter("periodo");
String total = request.getParameter("total");
String promedio = request.getParameter("promedio");

   try{
      Statement st = null;
      ResultSet rs = null;
      st = conn.createStatement();
      rs = st.executeQuery("SELECT * FROM ingresantes WHERE postulante='" + postulante + "'");
      rs.next();
      if(rs.getRow() != 0){
        out.println("Este postulante ya fue asignado.");
         rs.close();
        return;
      }
      rs.close();
      st.executeUpdate("insert into ingresantes (postulante , seccion, peloton, periodo, total, promedio) values('" + postulante + "','" + seccion + "','" + peloton + "', '" + periodo + "','" + total +"', '" + promedio +"')");
      st.close();
      out.println("Guardado");
}catch (Exception e) {
out.println("error PSQL" + e);
}
}
else if (request.getParameter("listar").equals("modificar")){
   String pk = request.getParameter("pk");
   String postulante = request.getParameter("postulante");
   String compañia = request.getParameter("compañia");
   String peloton = request.getParameter("peloton");
   String seccion = request.getParameter("seccion");
 

   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update ingresante set postulante='" + postulante +"' , compañia='" + compañia +"',seccion='" + seccion +"', peloton='" + peloton +"' where id='" + pk + "'");
           out.println("<i class='alert alert-success'>Datos actulizados</i>");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
else if (request.getParameter("listar").equals("eliminar")){
   String pk = request.getParameter("pk");
  

   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("delete from ingresantes where id='" + pk + "'");
           out.println("Eliminado");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
else if(request.getParameter("listar") != null && request.getParameter("listar").equals("menu")){
       try{
       String periodo = request.getParameter("periodo");
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("WITH ExamenesPorPeriodo AS (     SELECT e.id AS examen_id     FROM examenes e     JOIN resultados r ON e.id = r.examen     WHERE r.periodos = '" + periodo + "' AND r.estado = 'FINALIZADO' ), ResultadosAprobados AS (     SELECT re.postulantes, r.periodos, re.puntaje, e.id AS examen_id     FROM resultados r     JOIN resultados_detalle re ON r.id = re.resultado     JOIN examenes e ON r.examen = e.id     WHERE r.periodos = '" + periodo + "' AND re.estado = 'APROBADO' ) SELECT a.id AS alumno_id,        CONCAT(a.nombre, ' ', a.apellido),        COALESCE(SUM(CAST(NULLIF(ra.puntaje, '') AS integer)), 0) AS total_puntaje,        COALESCE(CAST(NULLIF(AVG(CAST(NULLIF(ra.puntaje, '') AS integer)), 0) AS integer), 0) AS promedio_puntaje FROM postulantes a JOIN ExamenesPorPeriodo epp ON EXISTS (     SELECT 1     FROM resultados r     WHERE r.periodos = '" + periodo + "' ) LEFT JOIN ResultadosAprobados ra ON a.id = ra.postulantes AND ra.examen_id = epp.examen_id GROUP BY a.id HAVING COUNT(DISTINCT epp.examen_id) > 0 AND COUNT(DISTINCT epp.examen_id) = COUNT(DISTINCT ra.examen_id) ORDER BY total_puntaje DESC;");
   while(rs.next()){
%>

<option value="<%out.print(rs.getString(1)+","+rs.getString(3)+","+rs.getString(4)); %>"><%out.print(rs.getString(2)); %></option>

<%
    }
}
catch (Exception e) {
  out.println("error PSQL"+ e); 
}
}
%>

