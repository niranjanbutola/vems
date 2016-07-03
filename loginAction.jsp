<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");


String userName=request.getParameter("userName");
String password=request.getParameter("password");


Connection con=null;
Statement st=null;
ResultSet rs=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
	rs=st.executeQuery("select firstname,role,status from users where username='"+userName+"' and password='"+password+"' ");
	
	if(!rs.next())
		{
			response.sendRedirect("login.jsp?message=User ID or Passowrd Incorrect");
		}
	else if(rs.getString("status").equals("0"))
		{
			response.sendRedirect("login.jsp?message=Admin Has Not Approved Your Request!!! Try Later");
		}
	else
		{
			
			session.setAttribute("sUserName",userName);
			
			String role=rs.getString("role");
			Cookie cookie=new Cookie("Role",role);
			response.addCookie(cookie);
			
			response.sendRedirect("home.jsp");
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