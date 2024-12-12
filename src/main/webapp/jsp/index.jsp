<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
       String periodo = request.getParameter("periodo");
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   
   rs = st.executeQuery("select * from ingresantes i inner join postulantes p on i.postulante=p.id inner join pelotones a on a.id=i.peloton inner join secciones s on s.id=i.seccion inner join compañia c on a.compañia=c.id inner join periodos pe on pe.id=i.periodo where i.periodo='" + periodo + "';");
   
   
   while(rs.next()){

%>
<tr>
    <td><%out.print(rs.getString(9)+ " "+rs.getString(10)); %></td>
    <td><%out.print(rs.getString(6)); %></td>
    <td><%out.print(rs.getString(7)); %></td>
    <td><%out.print(rs.getString(22)); %></td>
    <td><%out.print(rs.getString(16)); %></td>
    <td><%out.print(rs.getString(20)); %></td>

</tr>
<%
    }
}
catch (Exception e) {
  out.println("error PSQL"+ e); 
}
} 

else if(request.getParameter("listar") != null && request.getParameter("listar").equals("listaringresante")){
       try{
       String periodo = request.getParameter("periodo");
       periodo = "6";
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   
   rs = st.executeQuery("WITH ExamenesPorPeriodo AS (     SELECT e.id AS examen_id     FROM examenes e     JOIN resultados r ON e.id = r.examen     WHERE r.periodos = '" + periodo + "' AND r.estado = 'FINALIZADO' ), ResultadosAprobados AS (     SELECT re.postulantes, r.periodos, re.puntaje, e.id AS examen_id     FROM resultados r     JOIN resultados_detalle re ON r.id = re.resultado     JOIN examenes e ON r.examen = e.id     WHERE r.periodos = '" + periodo + "' AND re.estado = 'APROBADO' ) SELECT a.id AS alumno_id,        CONCAT(a.nombre, ' ', a.apellido),        COALESCE(SUM(CAST(NULLIF(ra.puntaje, '') AS integer)), 0) AS total_puntaje,        COALESCE(CAST(NULLIF(AVG(CAST(NULLIF(ra.puntaje, '') AS integer)), 0) AS integer), 0) AS promedio_puntaje FROM postulantes a JOIN ExamenesPorPeriodo epp ON EXISTS (     SELECT 1     FROM resultados r     WHERE r.periodos = '" + periodo + "' ) LEFT JOIN ResultadosAprobados ra ON a.id = ra.postulantes AND ra.examen_id = epp.examen_id GROUP BY a.id HAVING COUNT(DISTINCT epp.examen_id) > 0 AND COUNT(DISTINCT epp.examen_id) = COUNT(DISTINCT ra.examen_id) ORDER BY total_puntaje DESC;");
   
   
   while(rs.next()){

%>
<option value="<%out.print(rs.getString(1)); %>"><%out.print(rs.getString(2)); %></option>
<%
    }
}
catch (Exception e) {
  out.println("error PSQL"+ e); 
}
}else if (request.getParameter("listar").equals("agregar")){
    String nombre = request.getParameter("nombre");
    String puntaje = request.getParameter("puntaje");
    String instructores = request.getParameter("instructores");
    String promedio = request.getParameter("promedio");
    String tipodeexamenes = request.getParameter("tipodeexamenes");
  

   try{
      Statement st = null;
      ResultSet rs = null;
      st = conn.createStatement();
      st.executeUpdate("insert into examenes(nombre,puntaje,instructores,tipodeexamenes, promedio) values('" + nombre + "','" + puntaje + "','" + instructores + "','" + tipodeexamenes + "', '" + promedio + "')");
      out.println("guardado");
}catch (Exception e) {
out.println("error PSQL" + e);
}
}
else if (request.getParameter("listar").equals("modificar")){
   String pk = request.getParameter("pk");
    String nombre = request.getParameter("nombre");
    String puntaje = request.getParameter("puntaje");
    String instructores = request.getParameter("instructores");
    String promedio = request.getParameter("promedio");
    String tipodeexamenes = request.getParameter("tipodeexamenes");
 

   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update examenes set nombre='" + nombre +"', puntaje='" + puntaje +"', instructores='" + instructores +"', tipodeexamenes='" + tipodeexamenes +"', promedio='" + promedio + "' where id='" + pk + "'");
           out.println("<i class='alert alert-success'>Datos actulizados</i>");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
else if(request.getParameter("listar") != null && request.getParameter("listar").equals("menu")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from examenes;");
   while(rs.next()){
%>

<option value="<%out.print(rs.getString(1)); %>,<%out.print(rs.getString(3)); %>,<%out.print(rs.getString(6)); %>"><%out.print(rs.getString(2)); %></option>

<%
    }
}
catch (Exception e) {
  out.println("error PSQL"+ e); 
}
}
else if (request.getParameter("listar").equals("eliminar")){
   String pk = request.getParameter("pk");
  

   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("delete from examenes where id='" + pk + "'");
           out.println("<i class='alert alert-success'>Datos Eliminados</i>");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
