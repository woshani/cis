<%-- 
    Document   : SearchDisability
    Created on : 03-Feb-2017, 12:19:06
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
                               String key = request.getParameter("input");
                                //String key1 = request.getParameter("input2");
                                  
                                String searchProblem = "SELECT rd_desc FROM readcode_disability where CONCAT(UPPER(rd_desc),LOWER(rd_desc)) like '%" +  key + "%'";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                 if (search.size() > 0) 
                                        {
%>
<ul id="matchList" style="width: 100%; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) 
                                            {%>
    <li onClick= "selectCountry('<%=search.get(i).get(0)%>');"><%=search.get(i).get(0)%></li>
<%}%>
</ul>
<%}else{%>
<span>No Record Found!</span>
<%}%>