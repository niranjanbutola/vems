<%@page import="java.sql.*"%>

<%@include file="classes/template.jsp"%>

<%
	String dbUserName=application.getInitParameter("dbUserName");
	String dbPassword=application.getInitParameter("dbPassword");
	String jdbcDriver=application.getInitParameter("jdbcDriver");
	String urlString=application.getInitParameter("urlString");
	
	Template template1=new Template();
	
	String heading="Assign Project";
	String menuType="auth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	
	Connection con=null;
	Statement st1=null;
	Statement st2=null;
	ResultSet rs1=null;
	ResultSet rs2=null;
	
	String 	data="";
	
	try
	{
		Class.forName(jdbcDriver);
		con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
		st1=con.createStatement();
		st2=con.createStatement();
		
		rs1=st1.executeQuery("select projectname from projects");
		rs2=st2.executeQuery("select username from users");
			
		data+="<form role=\"form\" action=assignProjectAction.jsp method=post>";
			
		data+="<div class=\"form-group\">";
		data+="<label>Select User ID</label>";
		data+="<select name=userID class=\"form-control\">";
		
		
		while(rs2.next())
		{
			data+="<option>"+rs2.getString("username")+"</option>";
		}
		data+="</select>";
		data+="</div>";
		
		data+="<div class=\"form-group\">";
		data+="<label>Select Project</label>";
		data+="<select name=projectName class=\"form-control\">";
		while(rs1.next())
		{
			data+="<option>"+rs1.getString("projectname")+"</option>";
		}
		data+="</select>";
		data+="</div>";
		
		data+="<input type=\"submit\" class=\"btn btn-primary\" value=\"Assign Project\"></input>";
		data+="</form>";
		
		
	}	
	catch(Exception e)
	{
		System.out.println("this is exception in signupAction.jsp page "+e.getMessage());
	}

	finally
	{
		st1.close();
		st2.close();
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