<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");


String userName=request.getParameter("userName");
String email=request.getParameter("email");
String password=request.getParameter("password");
String rePassword=request.getParameter("rePassword");
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String contactNumber=request.getParameter("contactNumber");
String address=request.getParameter("address");
String securityQuestion=request.getParameter("securityQuestion");
String securityAnswer=request.getParameter("securityAnswer");

Connection con=null;
Statement st=null;
Statement st1=null;
ResultSet rs=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	
	st1=con.createStatement();
	
	rs=st1.executeQuery("select * from users where username='"+userName+"'");
	
	if(rs.next())
		{
			response.sendRedirect("signUp.jsp?message=Username already taken!!");
		}
	else
		{
			st=con.createStatement();
			st.executeUpdate("insert into users values('"+userName+"','"+email+"','"+password+"','"+firstName+"','"+lastName+"','"+contactNumber+"','"+address+"','"+securityQuestion+"','"+securityAnswer+"','','','0')");
			st.close();
			response.sendRedirect("signUp.jsp?message=Account Created Successfully!!! You Can Login After Admin Approve Your Request");
		}
	}	
catch(Exception e)
{
	System.out.println("this is exception in signupAction.jsp page "+e.getMessage());
	out.println("this is exception in signupAction.jsp page "+e.getMessage());
}

finally
{
	
	//st.close();
	st1.close();
	con.close();
}


%>