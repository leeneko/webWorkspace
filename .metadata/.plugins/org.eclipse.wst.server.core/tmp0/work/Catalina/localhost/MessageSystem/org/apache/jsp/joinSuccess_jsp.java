/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.92
 * Generated at: 2018-12-20 03:40:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.member.MemberDTO;

public final class joinSuccess_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("    \r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<title>Forty by HTML5 UP</title>\r\n");
      out.write("\t\t<meta charset=\"utf-8\" />\r\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=EUC-KR\">\r\n");
      out.write("\t\t<!--[if lte IE 8]><script src=\"assets/js/ie/html5shiv.js\"></script><![endif]-->\r\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"assets/css/main.css\" />\r\n");
      out.write("\t\t<!--[if lte IE 9]><link rel=\"stylesheet\" href=\"assets/css/ie9.css\" /><![endif]-->\r\n");
      out.write("\t\t<!--[if lte IE 8]><link rel=\"stylesheet\" href=\"assets/css/ie8.css\" /><![endif]-->\r\n");
      out.write("\t</head>\r\n");
      out.write("\r\n");
      out.write("\t<style>\r\n");
      out.write("\t\r\n");
      out.write("\t</style>\r\n");
      out.write("\r\n");
      out.write("\t<body style=\"text-align: center;\">\r\n");

	MemberDTO dto = (MemberDTO) request.getAttribute("dto");

      out.write("\r\n");
      out.write("\t\t<!-- Wrapper -->\r\n");
      out.write("\t\t\t<div id=\"wrapper\">\r\n");
      out.write("\t\t\t\t<!-- Menu -->\r\n");
      out.write("\t\t\t\t\t<nav id=\"Update\">\r\n");
      out.write("\t\t\t\t\t<font size=\"8\">회원가입성공</font><br>\r\n");
      out.write("\t\t\t\t\t정보를 확인하세요<br><br>\r\n");
      out.write("\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>Email</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>HP</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>Addr</td>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( dto.getEmail() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( dto.getTel() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( dto.getAddress() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"main.jsp\"><input type=\"button\" value=\"메인페이지로\"></a>\r\n");
      out.write("\t\t\t\t\t</nav>\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t<!-- Scripts -->\r\n");
      out.write("\t\t\t<script src=\"assets/js/jquery.min.js\"></script>\r\n");
      out.write("\t\t\t<script src=\"assets/js/jquery.scrolly.min.js\"></script>\r\n");
      out.write("\t\t\t<script src=\"assets/js/jquery.scrollex.min.js\"></script>\r\n");
      out.write("\t\t\t<script src=\"assets/js/skel.min.js\"></script>\r\n");
      out.write("\t\t\t<script src=\"assets/js/util.js\"></script>\r\n");
      out.write("\t\t\t<!--[if lte IE 8]><script src=\"assets/js/ie/respond.min.js\"></script><![endif]-->\r\n");
      out.write("\t\t\t<script src=\"assets/js/main.js\"></script>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
