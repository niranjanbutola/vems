<%@page import="java.sql.*"%>
<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="View Profile";
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
		
		if(request.getParameter("id")==null)
		{
			rs=st.executeQuery("select * from users where username='"+session.getAttribute("sUserName")+"' ");
	
			rs.next();
				
			String userName=rs.getString("username");
			String email=rs.getString("email");
			String firstName=rs.getString("firstname");
			String lastName=rs.getString("lastname");
			String contactNumber=rs.getString("contactnumber");
			String mailingAddress=rs.getString("mailingaddress");
			String profilePic=rs.getString("profilepic");	
				
			data+="<form role=\"form\">";
			
			if(profilePic!=null)
			{
				data+="<div class=\"form-group\">";
				data+="<img src=\"upload/"+profilePic+" \" width=100px height=100px></img>";
				data+="</div>";
			}
			
			data+="<div class=\"form-group\">";
			data+="<label>Username</label>";
			data+="<input type=text value=\""+userName+"\"  disabled class=\"form-control\" >";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Email Address</label>";
			data+="<input type=text value=\""+email+"\" class=\"form-control\"  disabled>";
			data+="</div>";

			
			data+="<div class=\"form-group\">";
			data+="<label>First Name</label>";
			data+="<input value=\""+firstName+"\" typetext class=\"form-control\"  disabled>";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Last Name</label>";
			data+="<input value=\""+lastName+"\" type=text class=\"form-control\"  disabled>";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Contact Number</label>";
			data+="<input value=\""+contactNumber+"\" type=text class=\"form-control\"  disabled>";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Mailing Address</label>";
			data+="<textarea class=\"form-control\" rows=\"3\"  disabled>"+mailingAddress+"</textarea>";
			data+="</div>";
			
			data+="</form>";
			
			

		}
	else if(request.getParameter("id").equals("all"))
		{
			rs=st.executeQuery("select username,firstname from users ");
				
			data+="<table border=0>";
			
			data+="<tr>";
			data+="<th>User Name</th>";
			data+="<th></th><th></th><th></th><th></th>";
			data+="<th>First Name</th><th></th><th></th><th></th><th></th>";
			data+="</tr>";
			
			
			while(rs.next())
			{
				String userName=rs.getString("username");
				String firstname=rs.getString("firstname");
				
				data+="<tr>";
				data+="<td>";
				data+=userName;
				
				data+="<td> &nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp; </td><td>&nbsp;&nbsp;&nbsp; </td><td> &nbsp;  &nbsp;&nbsp; </td>";
				data+="<td>";
				data+=firstname;
				data+="</td><td></td><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href=viewProfile.jsp?id="+userName+">View Profile</a> | <a href=editUser.jsp?id="+userName+">Edit Profile</a>  </td>";
				
				data+="</tr>";
				
			}
			
			data+="</table>";
			
			
		}
	else
		{
			String username=request.getParameter("id");
			
			
			rs=st.executeQuery("select * from users where username='"+username+"' ");
	
			rs.next();
				
			String userName=rs.getString("username");
			String email=rs.getString("email");
			String firstName=rs.getString("firstname");
			String lastName=rs.getString("lastname");
			String contactNumber=rs.getString("contactnumber");
			String mailingAddress=rs.getString("mailingaddress");
			String profilePic=rs.getString("profilepic");	
				
			data+="<form role=\"form\">";
			
			if(profilePic!=null)
			{
				data+="<div class=\"form-group\">";
				data+="<img src=\"upload/"+profilePic+" \" width=100px height=100px></img>";
				data+="</div>";
			}
			
			data+="<div class=\"form-group\">";
			data+="<label>Username</label>";
			data+="<input type=text value=\""+userName+"\"  disabled class=\"form-control\" >";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Email Address</label>";
			data+="<input type=text value=\""+email+"\" class=\"form-control\"  disabled>";
			data+="</div>";

			
			data+="<div class=\"form-group\">";
			data+="<label>First Name</label>";
			data+="<input value=\""+firstName+"\" typetext class=\"form-control\"  disabled>";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Last Name</label>";
			data+="<input value=\""+lastName+"\" type=text class=\"form-control\"  disabled>";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Contact Number</label>";
			data+="<input value=\""+contactNumber+"\" type=text class=\"form-control\"  disabled>";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Mailing Address</label>";
			data+="<textarea class=\"form-control\" rows=\"3\"  disabled>"+mailingAddress+"</textarea>";
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