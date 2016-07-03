<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");



String access=request.getParameter("access");
String userID=request.getParameter("userID");



Connection con=null;
Statement st=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
	
	if(access.equals("De Activate Profile"))
	{
		st.executeUpdate("update users set status='0' where username='"+userID+"' ");
	}
	else
	{
		st.executeUpdate("update users set role='"+access+"',status='1' where username='"+userID+"' ");
	}
		
	response.sendRedirect("access.jsp?message=Action Performed Successfully!!!");
	
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