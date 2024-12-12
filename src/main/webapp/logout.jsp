<%-- 
    Document   : logout
    Created on : 4 nov. 2024, 15:39:42
    Author     : alumno
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
HttpSession sesion=request.getSession();
sesion.invalidate();
response.sendRedirect("login.jsp");
%>
