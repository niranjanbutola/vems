<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");



String projectName=request.getParameter("projectName");
String userID=request.getParameter("userID");



Connection con=null;
Statement st=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
	st.executeUpdate("delete from UserProjectMapping where username='"+userID+"' and projectid='"+projectName+"' ");
	out.println("done");
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

response.sendRedirect("unAssignProject.jsp?message=Success!!!");

%>