<%-- 
    Document   : conexio
    Created on : 9 abr 2024, 16:23:17
    Author     : Alumno
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

            <%
    Connection conn = null;
    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyecto20244","postgres","1");
            %>
