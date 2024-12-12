<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ include file="conexion.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>


<%
                        String reporte = request.getParameter("reporte");
                        String codigo = request.getParameter("codigo");
                        try
                        {
                        
                        File reportFile=new File(application.getRealPath("reportes/" + reporte + ".jasper"));
                        /**/
                        Map parametros=new HashMap();
                        if(codigo != null){
                           parametros.put("code",Integer.parseInt(codigo));
                           parametros.put("detalle",Integer.parseInt(codigo));
                        }
                        
                        if(reporte.equals("inscripto")){
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("SELECT cifrente, ciatras FROM inscripcion WHERE id='" + codigo + "'");
                            rs.next();
                            byte[] bfre = rs.getBytes(1);
                            byte[] batr = rs.getBytes(2);
                            InputStream isfre = new ByteArrayInputStream(bfre);
                            InputStream isatr = new ByteArrayInputStream(batr);
                            parametros.put("cifre",isfre);
                            parametros.put("ciatr",isatr);
                            rs.close();
                            st.close();
                        }


                        
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