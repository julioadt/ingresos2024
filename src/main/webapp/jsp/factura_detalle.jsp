<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from factura_detalle inner join factura on factura_detalle.factura=factura.id inner join postulantes on factura.postulante=postulantes.id inner join conceptos on factura_detalle.concepto=conceptos.id where factura.estado='PENDIENTE';");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(19)); %></td>
    <td><%out.print(rs.getString(2)); %></td>
    <td><%out.print(rs.getString(3)); %></td>
    <td><%out.print((Integer.parseInt(rs.getString(2))*Integer.parseInt(rs.getString(3)))); %></td>
    <td>
        <button class="dropdown-item" onclick="borrar('<%out.print(rs.getString(1)); %>')"><i class="bx bx-trash me-1" ></i></button>
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
      Integer total = 0;
      
      rs = st.executeQuery("SELECT id, total FROM factura WHERE estado='PENDIENTE'");
      rs.next();
      if(rs.getRow()==0){
        pendiente = false;
      }
      else{
        idf=rs.getString(1);
        total = Integer.parseInt(rs.getString(2));
      }
      rs.close();
      if(pendiente){
        rs = st.executeQuery("SELECT id FROM factura_detalle WHERE concepto='" + concepto + "' AND factura='" + idf + "'");
        rs.next();
        if(rs.getRow()!=0){
            out.print("Ya existe el concepto en la factura actual.");
            return;
        }
        total = total + (Integer.parseInt(cantidad)*Integer.parseInt(precio));
        st.executeUpdate("insert into factura_detalle (concepto,cantidad,precio,factura)values('"+concepto +"','"+cantidad +"','"+precio +"', '" + idf + "')");
        st.executeUpdate("update factura set total='" + total + "' where id='" + idf + "'");
      }
      else{
        
        st.executeUpdate("INSERT INTO factura(postulante, fecha) values('" + postulante + "','" + fecha + "')");
        rs = st.executeQuery("SELECT id FROM factura WHERE estado='PENDIENTE'");
        rs.next();
        String factu = rs.getString(1);
        st.executeUpdate("insert into factura_detalle (concepto,cantidad,precio,factura)values('"+concepto +"','"+cantidad +"','"+precio +"', '" + factu + "')");
        total = total + (Integer.parseInt(cantidad)*Integer.parseInt(precio));
        st.executeUpdate("update factura set total='" + total + "' where id='" + factu + "'");
        rs.close();
      }
      st.close();
      
      out.println("guardado");
}catch (Exception e) {
out.println("error PSQL" + e);
e.printStackTrace();
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
if(request.getParameter("listar") != null && request.getParameter("listar").equals("listarcabecera")){
       try{
            Statement st = null;
            ResultSet rs = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT * from factura WHERE estado='PENDIENTE'");
            rs.next();
            if(rs.getRow() != 0){
                out.print("pending=" + rs.getString(2) + "=" + rs.getString(3));
            }
        }
        catch (Exception e) {
            out.println("error PSQL"+ e); 
        }
 } 
else if (request.getParameter("listar").equals("finalizar")){

   


   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update factura set estado='FINALIZADO' where estado='PENDIENTE'");
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
        String idf = "";
        st = conn.createStatement();
        ResultSet rs = null;
        rs = st.executeQuery("select total, id from factura where estado='PENDIENTE'");
        rs.next();
        idf = rs.getString(2);
        Integer total = Integer.parseInt(rs.getString(1));
        rs.close();
        rs = st.executeQuery("select cantidad, precio from factura_detalle where id='" + pk + "'");
        rs.next();
        total = total - (Integer.parseInt(rs.getString(1))*Integer.parseInt(rs.getString(2)));
        rs.close();
        st.executeUpdate("delete from factura_detalle where id='" + pk + "'");
        st.executeUpdate("update factura set total='" + total + "' where id='" + idf + "'");
           out.println("Eliminado");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
