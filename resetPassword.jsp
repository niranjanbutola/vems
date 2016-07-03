<%@page import="java.sql.*"%>

<%@include file="classes/template.jsp"%>

<%
	String dbUserName=application.getInitParameter("dbUserName");
	String dbPassword=application.getInitParameter("dbPassword");
	String jdbcDriver=application.getInitParameter("jdbcDriver");
	String urlString=application.getInitParameter("urlString");
	
	Template template1=new Template();
	
	String heading="Reset Password";
	String menuType="auth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	
	String 	data="";
	
	try
	{
		Class.forName(jdbcDriver);
		con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
		st=con.createStatement();
		
		
		rs=st.executeQuery("select username from users");
			
		data+="<form role=\"form\" action=resetPasswordAction.jsp method=post>";
			
		data+="<div class=\"form-group\">";
		data+="<label>Select User ID</label>";
		data+="<select name=userID class=\"form-control\">";
		
		
		while(rs.next())
		{
			data+="<option>"+rs.getString("username")+"</option>";
		}
		data+="</select>";
		data+="</div>";
		
		data+="<div class=\"form-group\">";
		data+="<label>New Password</label>";
		data+="<input type=text name=newPassword class=\"form-control\" placeholder=\"Enter Password Here\">";
		data+="</div>";
	
		data+="<div class=\"form-group\">";
		data+="<label>Re-New Password</label>";
		data+="<input type=text name=reNewPassword class=\"form-control\" placeholder=\"Re-Enter Password Here\">";
		data+="</div>";
		
		
		data+="<input type=\"submit\" class=\"btn btn-primary\" value=\"Reset\"></input>";
		data+="</form>";
		
		
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
	
	String Role="";
	Cookie cookie=null;
	Cookie[] cookies=null;
	cookies=request.getCookies();
	
	if(cookies!=null)
	{
		for (int i = 0; i < cookies.length; i++)
		{
			cookie=cookies[i];
		
			if(cookie.getName().equals("Role"))
			{
				Role=cookie.getValue();
				
			}
		}
	}
	
	out.println(template1.genPage(heading,message,data,menuType,Role));
%>