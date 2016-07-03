<%@page import="java.sql.*"%>
<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Edit Project Details";
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

		String projectname=request.getParameter("id");
		
		rs=st.executeQuery("select * from projects where projectname='"+projectname+"' ");

		rs.next();
			
		String projectId=rs.getString("projectId");
		String projectName=rs.getString("projectName");
		String startDate=rs.getString("startDate");
		String endDate=rs.getString("endDate");
		
		
			
			
		data+="<form role=\"form\" method=post action=editProjectAction.jsp>";
		
		data+="<div class=\"form-group\">";
		data+="<label>Project Id</label>";
		data+="<input type=text value=\""+projectId+"\"  disabled  class=\"form-control\" >";
		data+="<input type=hidden value=\""+projectId+"\"  name=projectId  class=\"form-control\" >";
		data+="</div>";
		
		data+="<div class=\"form-group\">";
		data+="<label>Project Name</label>";
		data+="<input type=text value=\""+projectName+"\" name=projectName class=\"form-control\" disabled >";
		data+="</div>";

		
		data+="<div class=\"form-group\">";
		data+="<label>Start Date</label>";
		data+="<input value=\""+startDate+"\" typetext name=startDate class=\"form-control\"  >";
		data+="</div>";
		
		data+="<div class=\"form-group\">";
		data+="<label>End Date</label>";
		data+="<input value=\""+endDate+"\" type=text name=endDate class=\"form-control\"  >";
		data+="</div>";
		
		
		
		
		data+="<input type=\"submit\" class=\"btn btn-primary\" value=\"Edit Project Details\" ></input>";
		data+="</form>";
		
	
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