<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");


String projectID=request.getParameter("projectID");
String projectName=request.getParameter("projectName");
String startDate=request.getParameter("startDate");
String endDate=request.getParameter("endDate");


Connection con=null;
Statement st=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
	st.executeUpdate("insert into projects values('"+projectID+"', '"+projectName+"', '"+startDate+"', '"+endDate+"')");
	
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


response.sendRedirect("addProject.jsp?message=Success!!!");
%>