<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");

String userName=""+session.getAttribute("sUserName");
String securityQuestion=request.getParameter("securityQuestion");
String securityAnswer=request.getParameter("securityAnswer");

Connection con=null;
Statement st=null;


try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
						
	st.executeUpdate("update users set securityQuestion='"+securityQuestion+"', securityAnswer='"+securityAnswer+"'  where username='"+userName+"'");
	
	response.sendRedirect("changeSecurityQuestion.jsp?message=Security Question/Answer Updated Successfully!!!!!");
					
}	
catch(Exception e)
{
	System.out.println("this is exception in signupAction.jsp page "+e.getMessage());
	out.println(e.getMessage());
}

finally
{
	st.close();
	con.close();
}

%>