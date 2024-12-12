<%-- 
    Document   : login
    Created on : 4 nov. 2024, 15:19:52
    Author     : alumno
--%>
<%-- 
    Document   : login
    Created on : 9 jul. 2024, 15:17:59
    Author     : Oficina
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>

<%                                   
Statement st = null;
ResultSet rs = null;



/*Tomamos los parametros del HTML*/
String user = request.getParameter("usuario");
String password = request.getParameter("pswrd");

/*Instanciamos para crear nuestras sesiones*/
HttpSession sesion = request.getSession();

try {
                                           
st = conn.createStatement();
rs = st.executeQuery("SELECT * FROM usuarios  where usu_nombre='" + user + "' and usu_clave='" + password + "';");
while (rs.next()) {
sesion.setAttribute("logueado", "1");
sesion.setAttribute("user", rs.getString("usu_nombre"));
sesion.setAttribute("id", rs.getString("id_usuarios"));
sesion.setAttribute("rol", rs.getString("usu_rol"));
out.println("<script>location.href='dashboard.jsp'</script>");
return;
}
out.println("<div class=\"alert alert-danger\" role=\"alert\">Usuario no valido</div>");
} catch (Exception e) {
out.print(e.getMessage());
}

%> 