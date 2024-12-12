<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from materias;");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(2)); %></td>
    <td><%out.print(rs.getString(3)); %></td>
    <td><%out.print(rs.getString(4)); %></td>
    <td><%out.print(rs.getString(5)); %></td>
    <td>
        <div class="dropdown">
            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                <i class="bx bx-dots-vertical-rounded"></i>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" onclick="rellenado('<%out.print(rs.getString(1)); %>', '<%out.print(rs.getString(2)); %>', '<%out.print(rs.getString(3)); %>', '<%out.print(rs.getString(4)); %>', '<%out.print(rs.getString(5)); %>')"
                   ><i class="bx bx-edit-alt me-1"></i> Edit</a
                >
                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="eliminar('<%out.print(rs.getString(1)); %>')"
                   ><i class="bx bx-trash me-1" ></i> Delete</a
                >
                <a class="dropdown-item"
                   href="jsp/reportes.jsp?reporte=materias2&codigo=<%out.print(rs.getString(1)); %>"
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
   String nombre = request.getParameter("nombre");
   String secciones = request.getParameter("secciones");
   String instructores = request.getParameter("instructores");
   String dias = request.getParameter("dias");
   String horario = request.getParameter("horario");
   try{
      Statement st = null;
      ResultSet rs = null;
      st = conn.createStatement();
      st.executeUpdate("insert into materias (nombre,secciones,instructores,dias,horario)values('"+nombre+"','"+secciones +"', '"+instructores+"','"+dias+"','"+horario+"')");
      out.println("guardado");
}catch (Exception e) {
out.println("error PSQL" + e);
}
}
else if (request.getParameter("modificar").equals("modificar")){
   String pk = request.getParameter("pk");
   String nombre = request.getParameter("nombre");
   String secciones = request.getParameter("secciones");
   String instructores = request.getParameter("instructores");
   String dias = request.getParameter("dias");
   String horario = request.getParameter("horario");


   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update materias set nombre='" + nombre +"', secciones='"
      +secciones+"', instructores='" + instructores +"', dias='"
      +dias+ "', horario='" + horario +"' where id='" + pk + "'");
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
   rs = st.executeQuery("select * from materias;");
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
        st.executeUpdate("delete from materias where id='" + pk + "'");
           out.println("<i class='alert alert-success'>Datos Eliminados</i>");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
