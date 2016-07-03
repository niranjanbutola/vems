<%@page import="java.sql.*"%>

<%
String dbUserName=application.getInitParameter("dbUserName");
String dbPassword=application.getInitParameter("dbPassword");
String jdbcDriver=application.getInitParameter("jdbcDriver");
String urlString=application.getInitParameter("urlString");



String userName=""+session.getAttribute("sUserName");
String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String reNewPassword=request.getParameter("reNewPassword");


Connection con=null;
Statement st=null;

ResultSet rs=null;

try
{
	Class.forName(jdbcDriver);
	con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
	st=con.createStatement();
	rs=st.executeQuery("select password from users where username='"+userName+"'");
	
	if(rs.next())
		{
			String dbuPassword=rs.getString("password");
			
			if(oldPassword.equals(dbuPassword))
				{
					if(newPassword.equals(reNewPassword))
					{
						
						st.executeUpdate("update users set password='"+newPassword+"' where username='"+userName+"'");
					
						response.sendRedirect("changePassword.jsp?message=Password Change Successfully!!!");
					}
					else
					{
						response.sendRedirect("changePassword.jsp?message=New Password does not match!!!");
					}
				}
			else
				{
					response.sendRedirect("changePassword.jsp?message=Incorrect Password!!!!");

				}
				
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