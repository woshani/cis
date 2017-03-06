package org.apache.jsp.search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import dBConn.Conn;
import main.RMIConnector;

public final class SearchDoctor_005f_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Conn Conn = new Conn();
    String key ="siti"; //request.getParameter("name");
    String hfc ="04010101"; //request.getParameter("hfc");
    String dis ="001"; //request.getParameter("dis");
    String searchProblem = "SELECT user_name FROM adm_users inner join adm_user_access_role on adm_user_access_role.user_id=adm_users.`USER_ID` where adm_users.health_facility_code='"+hfc+"' and adm_user_access_role.`DISCIPLINE_CODE`='"+dis+"' and CONCAT(UPPER(adm_users.user_name),LOWER(adm_users.user_name)) like '%" + key + "%'";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

      out.write("\n");
      out.write("<ul id=\"matchListDoctor\" style=\"width: auto; height: 200px; overflow: auto\">\n");
      out.write("    ");
 for (int i = 0; i < search.size(); i++) {
      out.write("\n");
      out.write("    <li >");
      out.print(search.get(i).get(0));
      out.write("</li>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("</ul>\n");
} else {
      out.write("\n");
      out.write("<span>No Record Found!</span>\n");
}
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
