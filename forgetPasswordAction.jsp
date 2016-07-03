<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");

String userName=request.getParameter("userName");
String email=request.getParameter("email");

Connection con=null;
Statement st=null;
ResultSet rs=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
	rs=st.executeQuery("select email from users where username='"+userName+"' ");
	
	if(!rs.next())
		{
			response.sendRedirect("forgetPassword.jsp?message=User ID not Found");
		}
	else
		{
			String dEmail=rs.getString("email");
			
			if(dEmail.equals(email))
				{
					session.setAttribute("sUserName",userName);
					response.sendRedirect("verifySecurityQA.jsp");
				}
			else
				{
					response.sendRedirect("forgetPassword.jsp?message=Invalid Email Address");
				}
		}
	
}	
catch(Exception e)
{
	System.out.println("this is exception in signupAction.jsp page "+e.getMessage());
}

finally
{
	st.close();
	con.close();
}
%>