<%-- 
    Document   : ShowPDF
    Created on : Jan 31, 2017, 10:32:50 AM
    Author     : user
--%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // String PMI_NO = request.getParameter("PMI_NO");
            // String ID_NO = request.getParameter("ID_NO");
            // String NEW_IC_NO = request.getParameter("NEW_IC_NO");
            // String OLD_IC_NO = request.getParameter("OLD_IC_NO");
            String pmhType = request.getParameter("pmhType");
            String pmhInput = request.getParameter("pmhInput");
           // String ID_TYPE = request.getParameter("ID_TYPE");

            try {

                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");

                File reportFile = new File(application.getRealPath("//reports//PatientMedicalHistory.jasper"));

                if (pmhType.equals("PMI_NO")) {

                    Map parameters = new HashMap();
                    parameters.put("pmhInput",pmhInput);
                    //parameters.put("ID_TYPE", ID_TYPE);

                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream outStream = response.getOutputStream();
                    outStream.write(bytes, 0, bytes.length);
                    outStream.flush();
                    outStream.close();

                } else if (pmhType.equals("NEW_IC_NO") || pmhType.equals("OLD_IC_NO")) {

                    Map parameters = new HashMap();
                    parameters.put("pmhInput", pmhInput);
                    //parameters.put("ID_TYPE", ID_TYPE);
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream outStream = response.getOutputStream();
                    outStream.write(bytes, 0, bytes.length);
                    outStream.flush();
                    outStream.close();

                } else {

                    Map parameters = new HashMap();
                    parameters.put("pmhInput", pmhInput);
                   // parameters.put("ID_TYPE", ID_TYPE);
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream outStream = response.getOutputStream();
                    outStream.write(bytes, 0, bytes.length);
                    outStream.flush();
                    outStream.close();

                }

            } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }


        %>


    </body>
</html>
