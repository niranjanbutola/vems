<%@page import="java.sql.*"%>
<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="View Project";
	String menuType="auth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	
	
	String dbUserName=application.getInitParameter("dbUserName");
	String dbPassword=application.getInitParameter("dbPassword");
	String jdbcDriver=application.getInitParameter("jdbcDriver");
	String urlString=application.getInitParameter("urlString");

	Connection con=null;
	Statement st=null;
	ResultSet rs=null;

	
	String 	data="";
	
	
	try
	{
		Class.forName(jdbcDriver);
		con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
		st=con.createStatement();
		
		if(request.getParameter("id").equals("all"))
		{
			rs=st.executeQuery("select projectid,projectname from projects ");
				
			data+="<table border=0>";
			
			data+="<tr>";
			data+="<th>Project ID</th>";
			data+="<th></th><th></th><th></th><th></th>";
			data+="<th>Project Name</th><th></th><th></th><th></th><th></th>";
			data+="</tr>";
			
			
			while(rs.next())
			{
				String projectID=rs.getString("projectid");
				String projectName=rs.getString("projectname");
				
				data+="<tr>";
				data+="<td>";
				data+=projectID;
				
				data+="<td> &nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp; </td><td>&nbsp;&nbsp;&nbsp; </td><td> &nbsp;  &nbsp;&nbsp; </td>";
				data+="<td>";
				data+=projectName;
				data+="</td><td></td><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href=viewProject.jsp?id="+projectName+">View Project Details</a> | <a href=editProject.jsp?id="+projectName+">Edit Project Details</a>  </td>";
				
				data+="</tr>";
				
			}
			
			data+="</table>";
			
			
		}
	else
		{
			String projectname=request.getParameter("id");
			
			
			rs=st.executeQuery("select * from projects where projectname='"+projectname+"' ");
	
			rs.next();
				
			String projectId=rs.getString("projectid");
			String projectName=rs.getString("projectname");
			String startDate=rs.getString("startdate");
			String endDate=rs.getString("enddate");			
				
			data+="<form role=\"form\">";
			
			
			
			data+="<div class=\"form-group\">";
			data+="<label>Project Id</label>";
			data+="<input type=text value=\""+projectId+"\"  disabled class=\"form-control\" >";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Project Name</label>";
			data+="<input type=text value=\""+projectName+"\" class=\"form-control\"  disabled>";
			data+="</div>";

			
			data+="<div class=\"form-group\">";
			data+="<label>Start Date</label>";
			data+="<input value=\""+startDate+"\" typetext class=\"form-control\"  disabled>";
			data+="</div>";
			
			
			data+="<div class=\"form-group\">";
			data+="<label>End Date</label>";
			data+="<input value=\""+endDate+"\" type=text class=\"form-control\"  disabled>";
			data+="</div>";
			
			
			data+="</form>";
			
		}
	
	
	}
	catch(Exception e)
	{
		System.out.println("this is exception in signupAction.jsp page "+e.getMessage());
		data+=e.getMessage();
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