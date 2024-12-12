<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listado")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from factura INNER JOIN postulantes on factura.postulante = postulantes.id where factura.estado='FINALIZADO';");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(7) + " " + rs.getString(8)); %></td>
    <td><%out.print(rs.getString(3)); %></td>
    <td><%out.print(rs.getString(5)); %></td>

    <td>
        <div class="dropdown">
            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                <i class="bx bx-dots-vertical-rounded"></i>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="jsp/reportes.jsp?reporte=facturaventas&codigo=<%out.print(rs.getString(1)); %>"><i class="bx bx-edit-alt me-1"></i>Reporte</a>
                <button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="eliminar('<%out.print(rs.getString(1)); %>')"><i class="bx bx-trash me-1" ></i> Anular</button>
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
} else if (request.getParameter("listar").equals("agregar")){
    String postulante = request.getParameter("postulante");
    String fecha = request.getParameter("fecha");
    String concepto = request.getParameter("concepto_");
    String cantidad = request.getParameter("cantidad_");
    String precio = request.getParameter("precio_");
   try{
      Statement st = null;
      ResultSet rs = null;
      boolean pendiente = true;
      st = conn.createStatement();
      String idf = "";
      
      rs = st.executeQuery("SELECT id FROM factura WHERE estado='PENDIENTE'");
      rs.next();
      if(rs.getRow()==0){
        pendiente = false;
      }
      else{
        idf=rs.getString(1);
      }
      rs.close();
      if(pendiente){
        rs = st.executeQuery("SELECT id FROM factura_detalle WHERE concepto='" + concepto + "' AND factura='" + idf + "'");
        rs.next();
        if(rs.getRow()!=0){
            out.print("Ya existe el concepto en la factura actual.");
            return;
        }
        st.executeUpdate("insert into factura_detalle (concepto,cantidad,precio,factura)values('"+concepto +"','"+cantidad +"','"+precio +"', '" + idf + "')");
      }
      else{
        
        st.executeUpdate("INSERT INTO factura(postulante, fecha) values('" + postulante + "','" + fecha + "')");
        rs = st.executeQuery("SELECT id FROM factura WHERE estado='PENDIENTE'");
        rs.next();
        st.executeUpdate("insert into factura_detalle (concepto,cantidad,precio,factura)values('"+concepto +"','"+cantidad +"','"+precio +"', '" + rs.getString(1) + "')");
        rs.close();
      }
      st.close();
      
      out.println("guardado");
}catch (Exception e) {
out.println("error PSQL" + e);
}
}
else if (request.getParameter("listar").equals("modificar")){
   String pk = request.getParameter("pk");
    String postulante = request.getParameter("postulante");
    String fecha = request.getParameter("fecha");
    String concepto = request.getParameter("concepto");
    String cantidad = request.getParameter("cantidad");
    String precio = request.getParameter("precio");
   


   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update inscripcion_detalle set postulante='" + postulante +"', fecha='"
      +fecha+ "', concepto='"+concepto+"', cantidad='"+cantidad+"',precio='"+precio+"'where id='" + pk + "'");
           out.println("<i class='alert alert-success'>Datos actulizados</i>");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
else if (request.getParameter("listar").equals("anular")){

   


   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update factura set estado='ANULADO' where estado='PENDIENTE'");
           out.println("Factura guardada");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}


else if (request.getParameter("listar").equals("cancelar")){

   


   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update factura set estado='CANCELADO' where estado='PENDIENTE'");
           out.println("Factura cancelada");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}


else if(request.getParameter("listar") != null && request.getParameter("listar").equals("menu")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from factura_detalle;");
   while(rs.next()){
%>

<option value="<%out.print(rs.getString(1)); %>"><%out.print(rs.getString(2)); %> <%out.print(rs.getString(3)); %> </option>

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
        st.executeUpdate("update factura set estado='ANULADO' where id='" + pk + "'");
           out.println("Factura Anulada");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
