<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");


String userName=request.getParameter("userName");
String email=request.getParameter("email");
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String contactNumber=request.getParameter("contactNumber");
String address=request.getParameter("mailingAddress");


Connection con=null;
Statement st=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
	st.executeUpdate("update users set email='"+email+"',firstName='"+firstName+"',lastName='"+lastName+"',contactNumber='"+contactNumber+"',mailingaddress='"+address+"' where userName='"+userName+"'");
	
	
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

response.sendRedirect("editUser.jsp?message=User Updated Successfully!!!!");

%>