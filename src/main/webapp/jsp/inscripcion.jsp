<%@include file="conexion.jsp"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<%  
 String opt = new String(request.getPart("listar").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
 if(request.getParameter("listar") != null && request.getParameter("listar").equals("listar")){
       try{
   Statement st = null;
   ResultSet rs = null;
   st = conn.createStatement();
   rs = st.executeQuery("select * from inscripcion inner join ciudades on inscripcion.ciudad=ciudades.id;");
   while(rs.next()){
%>
<tr>
    <td><%out.print(rs.getString(1)); %></td>
    <td><%out.print(rs.getString(2)); %></td>
    <td><%out.print(rs.getString(7)); %></td>
    <td><%out.print(rs.getString(3)); %></td>
    <td><%out.print(rs.getString(5)); %></td>
    <td><%out.print(rs.getString(6)); %></td>
<div class="dropdown">
    <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
        <i class="bx bx-dots-vertical-rounded"></i>
    </button>
    <div class="dropdown-menu">
        <a class="dropdown-item" onclick="rellenado('<%out.print(rs.getString(1)); %>', '<%out.print(rs.getString(2)); %>', '<%out.print(rs.getString(3)); %>', '<%out.print(rs.getString(4)); %>', '<%out.print(rs.getString(5)); %>')"><i class="bx bx-edit-alt me-1"></i>Edit</a>
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
} else if (opt.equals("agregar")){
   String nombre = new String(request.getPart("nombre").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
   String apellido = new String(request.getPart("apellido").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
   String ciudad = new String(request.getPart("ciudad").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
   String fechanacimiento = new String(request.getPart("fechanacimiento").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
   String telefono = new String(request.getPart("telefono").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
   String ci = new String(request.getPart("ci").getInputStream().readAllBytes(), StandardCharsets.UTF_8);

   Part archivo1 = request.getPart("cifrente"); // Primer archivo
   Part archivo2 = request.getPart("ciatras");

    if(archivo1 == null || archivo2 == null){
        out.print("Adjunte su C.I.");
    }

    byte[] cifrente = null;
    byte[] ciatras = null;// Segundo archivo

   if (archivo1 != null) {
       InputStream contenidoArchivo1 = archivo1.getInputStream();
       
       // Convertir el InputStream a un arreglo de bytes (byte[])
       ByteArrayOutputStream buffer = new ByteArrayOutputStream();
       byte[] data = new byte[1024];
       int bytesRead;

       while ((bytesRead = contenidoArchivo1.read(data, 0, data.length)) != -1) {
           buffer.write(data, 0, bytesRead);
       }

       cifrente = buffer.toByteArray();

       // Cerrar el InputStream después de leer
       contenidoArchivo1.close();

   }

   if (archivo2 != null) {
       InputStream contenidoArchivo1 = archivo2.getInputStream();
       
       // Convertir el InputStream a un arreglo de bytes (byte[])
       ByteArrayOutputStream buffer = new ByteArrayOutputStream();
       byte[] data = new byte[1024];
       int bytesRead;

       while ((bytesRead = contenidoArchivo1.read(data, 0, data.length)) != -1) {
           buffer.write(data, 0, bytesRead);
       }

       ciatras = buffer.toByteArray();

       // Cerrar el InputStream después de leer
       contenidoArchivo1.close();

       // Puedes guardar el archivo si necesitas:
       // Files.copy(contenidoArchivo2, Paths.get("/ruta/para/guardar", nombreArchivo2));
   }
   
 
   try{
      PreparedStatement st = null;
      ResultSet rs = null;
      String sql = "insert into inscripcion (nombre,apellido,ciudad,fechanacimiento,cifrente,ciatras, telefono, ci)values(?,?,?,?,?,?,?,?);";
      st = conn.prepareStatement(sql);
      st.setString(1, nombre);
      st.setString(2, apellido);
      st.setInt(3, Integer.parseInt(ciudad));
      st.setDate(4, java.sql.Date.valueOf(fechanacimiento));
      st.setBytes(5, cifrente);
      st.setBytes(6, ciatras);
      st.setString(7, telefono);
      st.setString(8, ci);
      st.executeUpdate();
      out.println("guardado");
}catch (Exception e) {
e.printStackTrace();
}
}
else if (request.getParameter("listar").equals("modificar")){
   String pk = request.getParameter("pk");
   String nombre = request.getParameter("nombre");
   String apellido = request.getParameter("apellido");
    String ciudad = request.getParameter("ciudad");
   String fechanacimiento = request.getParameter("fechanacimiento");
   String cifrente = request.getParameter("cifrente");
   String ciatras = request.getParameter("ciatras");



   try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("update inscripcion set nombre='" + nombre +"',apellido='" + apellido +"',fechanacimiento='" + fechanacimiento +"',cifrente='" + cifrente +"',ciatras='" + ciatras +"',ciudad='" + ciudad +"'where id='" + pk + "'");
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
   rs = st.executeQuery("select * from inscripcion;");
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
           out.println("<i class='alert alert-success'>Datos Eliminados</i>");
}       catch (Exception e){
           out.println("error PSQL" + e);
}
}
%>
