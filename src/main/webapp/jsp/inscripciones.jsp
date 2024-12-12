<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select i.nombre, i.apellido, i.fechanacimiento, c.nombre, i.ci, i.cifrente, i.ciatras, i.id, i.ciudad from inscripcion i inner join ciudades c on i.ciudad=c.id;");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(2)); %></td>
    <td><%out.print(rs.getString(3)); %></td>
    <td><%out.print(rs.getString(4)); %></td>
    <td><%out.print(rs.getString(5)); %></td>
    <td><img height="50px" src="jsp/cifrente.jsp?id=<%out.print(rs.getString(8)); %>" alt="alt"/></td>
    <td><img height="50px" src="jsp/ciatras.jsp?id=<%out.print(rs.getString(8)); %>" alt="alt"/></td>
    <td>
        <div class="dropdown">
            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                <i class="bx bx-dots-vertical-rounded"></i>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" onclick="postular('<%out.print(rs.getString(1)); %>', '<%out.print(rs.getString(2)); %>', '<%out.print(rs.getString(5)); %>', '<%out.print(rs.getString(9)); %>')"><i class="bx bx-edit-alt me-1"></i>Postular</a>
                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="eliminar('<%out.print(rs.getString(8)); %>')"><i class="bx bx-trash me-1" ></i> Delete</a>
                <a class="dropdown-item"
                   href="jsp/reportes.jsp?reporte=inscripto&codigo=<%out.print(rs.getString(8)); %>"
                   ><i class="bx bx-trash me-1" ></i>Reporte</a
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
} else if (request.getParameter("listar").equals("agregar")){
   String postulante = request.getParameter("postulante");
   String fecha = request.getParameter("fecha");
   try{
      Statement st = null;
      ResultSet rs = null;
      st = conn.createStatement();
      st.executeUpdate("insert into inscripcion_detalle (postulante,fecha)values('"+postulante+"','"+fecha +"')");
      out.println("guardado");
}catch (Exception e) {
out.println("error PSQL" + e);
}
}
else if (request.getParameter("listar").equals("modificar")){
   String pk = request.getParameter("pk");
   String postulante = request.getParameter("postulante");
   String fecha = request.getParameter("fecha");


   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update inscripcion_detalle set postulante='" + postulante +"', fecha='"
      +fecha+"'where id='" + pk + "'");
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
   rs = st.executeQuery("select * from inscripcion_detalle;");
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
        st.executeUpdate("delete from inscripcion where id='" + pk + "'");
           out.println("Datos Eliminados");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
