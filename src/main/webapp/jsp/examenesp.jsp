<%@include file="conexion.jsp"%>

<%  
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from examenes INNER JOIN instructores ON examenes.instructores=instructores.id INNER JOIN tipo_deexamenes ON tipo_deexamenes.id=examenes.tipodeexamenes;");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(2)); %></td>
    <td><%out.print(rs.getString(3)); %></td>
    <td><%out.print(rs.getString(6)); %></td>
    <td><%out.print(rs.getString(8) + " " + rs.getString(9)); %></td>
    <td><%out.print(rs.getString(11)); %></td>

    <td>
        <div class="dropdown">
            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                <i class="bx bx-dots-vertical-rounded"></i>
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" onclick="rellenado('<%out.print(rs.getString(1)); %>', '<%out.print(rs.getString(2)); %>', '<%out.print(rs.getString(3)); %>', '<%out.print(rs.getString(4)); %>', '<%out.print(rs.getString(5)); %>', '<%out.print(rs.getString(6)); %>')"><i class="bx bx-edit-alt me-1"></i>Edit</a>
                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="eliminar('<%out.print(rs.getString(1)); %>')"><i class="bx bx-trash me-1" ></i> Delete</a>
                <a class="dropdown-item"
                                    href="jsp/reportes.jsp?reporte=examen&codigo=<%out.print(rs.getString(1)); %>"
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

else if(request.getParameter("listar") != null && request.getParameter("listar").equals("menu2")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from examenes;");
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
        st.executeUpdate("delete from examenes where id='" + pk + "'");
           out.println("<i class='alert alert-success'>Datos Eliminados</i>");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
