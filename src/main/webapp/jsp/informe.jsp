<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.time.*" %> 
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ include file="conexion.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>


<%
                        String reporte = request.getParameter("informe");
                        String codigo = request.getParameter("codigo");
                        String inicio = request.getParameter("inicio");
                        String fin = request.getParameter("fin");
                        try
                        {
                        
                        File reportFile=new File(application.getRealPath("informes/" + reporte + ".jasper"));
                        /**/
                        Map parametros=new HashMap();
                        
                        parametros.put("code",Integer.parseInt(codigo));
                        
                        parametros.put("inicio",java.sql.Date.valueOf(LocalDate.parse(inicio)));
                        
                        parametros.put("fin",java.sql.Date.valueOf(LocalDate.parse(fin)));
                        
                        byte [] bytes= JasperRunManager.runReportToPdf(reportFile.getPath(), parametros,conn);
                        response.setContentType("application/pdf");
                        response.setContentLength(bytes.length);

                        ServletOutputStream output=response.getOutputStream();
                        response.getOutputStream();
                        output.write(bytes,0,bytes.length);
                        output.flush();
                        output.close();
                        }
                        catch(java.io.FileNotFoundException ex)
                        {
                            ex.getMessage();
                        }
%>