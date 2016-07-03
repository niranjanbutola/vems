<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");


String userID=request.getParameter("userID");
String newPassword=request.getParameter("newPassword");
String reNewPassword=request.getParameter("reNewPassword");



Connection con=null;
Statement st=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
	
	if(reNewPassword.equals(newPassword))
	{
		st.executeUpdate("update users set password='"+reNewPassword+"' where username='"+userID+"' ");
		response.sendRedirect("resetPassword.jsp?message=Password Reset Successfully");
	}
	else
	{
		response.sendRedirect("resetPassword.jsp?message=New Password and Re-New Password does not match");
	}
	
	
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