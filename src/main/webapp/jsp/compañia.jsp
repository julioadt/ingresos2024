<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from compañia;");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(2)); %></td>
   
    <td>
        <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" onclick="rellenado('<%out.print(rs.getString(1)); %>', '<%out.print(rs.getString(2)); %>')"
                                   ><i class="bx bx-edit-alt me-1"></i> Edit</a
                                >
                                 <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="eliminar('<%out.print(rs.getString(1)); %>')"
                                   ><i class="bx bx-trash me-1" ></i> Delete</a
                                >
                                    <a class="dropdown-item"
                                    href="jsp/reportes.jsp?reporte=compañia2&codigo=<%out.print(rs.getString(1)); %>"
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
} else if (request.getParameter("listar").equals("agregar")){
   String nombre = request.getParameter("nombre");
  

   try{
      Statement st = null;
      ResultSet rs = null;
      st = conn.createStatement();
      st.executeUpdate("insert into compañia (nombre) values('" + nombre + "')");
      out.println("guardado");
}catch (Exception e) {
out.println("error PSQL" + e);
}
}
else if (request.getParameter("listar").equals("modificar")){
   String pk = request.getParameter("pk");
   String nombre = request.getParameter("nombre");
 

   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update compañia set nombre='" + nombre +"' where id='" + pk + "'");
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
   rs = st.executeQuery("select * from compañia;");
   while(rs.next()){
%>

    <option value="<%out.print(rs.getString(1)); %>"><%out.print(rs.getString(2)); %></option>
 
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
        st.executeUpdate("delete from compañia where id='" + pk + "'");
           out.println("<i class='alert alert-success'>Datos Eliminados</i>");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
