<%-- 
    Document   : cifrente
    Created on : 6 nov 2024, 19:58:24
    Author     : Usuario
--%>

<%@include file="conexion.jsp"%>
<%@ page import="java.io.OutputStream"%>
<%
    try{
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();
        rs = st.executeQuery("select * from inscripcion where id='" +request.getParameter("id") + "';");
        rs.next();
        byte[] archivoBytes = rs.getBytes("cifrente");
        response.setContentType("image/jpeg");
                

        OutputStream os = response.getOutputStream();
        os.write(archivoBytes);
        os.flush();
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>
