<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select ed.id, (p.nombre || ' ' || p.apellido) as postulante,ed.puntaje,ed.estado from resultados_detalle ed join resultados e on ed.resultado = e.id join postulantes p on ed.postulantes = p.id where e.estado='PENDIENTE';");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(2)); %></td>
    <td><%out.print(rs.getString(3)); %></td>
    <td><%out.print(rs.getString(4)); %></td>

    <td>
        <div class="dropdown">
            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                <i class="bx bx-dots-vertical-rounded"></i>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="eliminar('<%out.print(rs.getString(1)); %>')"><i class="bx bx-trash me-1" ></i> Delete</a>
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

%>



<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listado")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("SELECT r.id, r.fecha, e.nombre,p.nombre from resultados r inner join examenes e on r.examen=e.id INNER JOIN periodos p on p.id = r.periodos WHERE r.estado='FINALIZADO'");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(2)); %></td>
    <td><%out.print(rs.getString(3)); %></td>
    <td><%out.print(rs.getString(4)); %></td>

    <td>
        <div class="dropdown">
            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                <i class="bx bx-dots-vertical-rounded"></i>
            </button>
            <div class="dropdown-menu">
                <button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="eliminar('<%out.print(rs.getString(1)); %>')"><i class="bx bx-trash me-1" ></i> Anular</button> 
                <a class="dropdown-item"
                   href="jsp/reportes.jsp?reporte=resultado&codigo=<%out.print(rs.getString(1)); %>"><i class="bx bx-file me-1" ></i> Reporte</a>
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

%>



<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listarcabecera")){
       try{
            Statement st = null;
            ResultSet rs = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT examen, puntaje, promedio, periodos, instructor from resultados r inner join examenes e on r.examen=e.id WHERE estado='PENDIENTE'");
            rs.next();
            if(rs.getRow() != 0){
                out.print("pending=" + rs.getString(1) + "," + rs.getString(2) + "," + rs.getString(3) + "=" + rs.getString(4) + "=" + rs.getString(5));
            }
        }
        catch (Exception e) {
            out.println("error PSQL"+ e); 
        }
 } 


else if (request.getParameter("listar").equals("agregar")){
    String examen = request.getParameter("examen");
    String postulante = request.getParameter("postulante");
    String puntaje = request.getParameter("puntaje");
    String promedio = request.getParameter("promedio");
    String estado = request.getParameter("estado");
    String fecha = request.getParameter("fecha");
   String periodo = request.getParameter("periodo_");
   String instructor = request.getParameter("instructor");


   try{
      Statement st = null;
      ResultSet rs = null;
      ResultSet rs2 = null;
      st = conn.createStatement();

      rs = st.executeQuery("SELECT * from resultados WHERE estado='PENDIENTE'");
      rs.next();
      if(rs.getRow() == 0){
        rs2 = st.executeQuery("SELECT id from resultados WHERE examen='" + examen + "' AND periodos='" + periodo + "' AND NOT estado='CANCELADO'");
        rs2.next();
        if(rs2.getRow()!=0){
            out.print("Ya se califico el examen en el periodo seleccionado");
            rs2.close();
            return;
        }
        st.executeUpdate("INSERT into resultados(fecha, examen,periodos, instructor) values('" + fecha + "', '" + examen + "','"+periodo+"', '" + instructor +"')");
      }

      rs.close();

      rs = st.executeQuery("SELECT id from resultados WHERE estado='PENDIENTE'");
      rs.next();
      String rdid = rs.getString(1);
      rs.close();
      rs = st.executeQuery("SELECT id from resultados_detalle WHERE resultado='" + rdid + "' AND postulantes='" + postulante + "'");
      rs.next();
      if(rs.getRow()!=0){
        out.print("El postulante ya fue calificado en el examen seleccionado.");
        rs.close();
        return;
      }
      st.executeUpdate("insert into resultados_detalle(puntaje,estado,resultado,postulantes) values('" + puntaje + "','" + estado + "','" + rdid + "','" + postulante + "')");
      out.println("Guardado");
      st.close();
}catch (Exception e) {
out.println("error PSQL" + e);
}
}
else if (request.getParameter("listar").equals("modificar")){
   String pk = request.getParameter("pk");
   String examen = request.getParameter("examen");
   String postulante = request.getParameter("postulante");
   String puntaje = request.getParameter("puntaje");
   String promedio = request.getParameter("promedio");
   String estado = request.getParameter("estado");
 

   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update examenes_detalle set puntaje='" + puntaje +"', estado='" + estado +"', examenes='" + examen +"', postulantes='" + postulante +"', promedio='" + promedio +"' where id='" + pk + "'");
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
   rs = st.executeQuery("select ed.id, e.nombre as examen, (p.nombre || ' ' || p.apellido) as postulante,ed.puntaje,ed.promedio,ed.estado from examenes_detalle ed join examenes e on ed.examenes = e.id join postulantes p on ed.postulantes = p.id");
   while(rs.next()){
%>

<option value="<%out.print(rs.getString(1)); %>,<%out.print(rs.getString(4)); %>,<%out.print(rs.getString(5)); %>"><%out.print(rs.getString(2)); %></option>

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
        st.executeUpdate("update resultados set estado='CANCELADO' where id='" + pk + "'");
           out.println("Anulado");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}

else if (request.getParameter("listar").equals("eliminar2")){
   String pk = request.getParameter("pk");
  

   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("delete from resultados_detalle where id='" + pk + "'");
           out.println("Eliminado");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}

else if (request.getParameter("listar").equals("finalizar")){
   
  

   try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();
        rs = st.executeQuery("SELECT id from resultados WHERE estado='PENDIENTE'");
        rs.next();
      if(rs.getRow() != 0){
        st.executeUpdate("update resultados set estado='FINALIZADO' where id='" + rs.getString(1) + "'");
        out.println("<i class='alert alert-success'>Finalizado</i>");
      }
        rs.close();
        st.close();
        
        
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}


else if (request.getParameter("listar").equals("cancelar")){
   
  

   try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();
        rs = st.executeQuery("SELECT id from resultados WHERE estado='PENDIENTE'");
        rs.next();
      if(rs.getRow() != 0){
        st.executeUpdate("update resultados set estado='CANCELADO' where id='" + rs.getString(1) + "'");
        out.println("<i class='alert alert-success'>Finalizado</i>");
      }
        rs.close();
        st.close();
        
        
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
