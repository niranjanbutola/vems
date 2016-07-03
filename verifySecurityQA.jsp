<%@page import="java.sql.*"%>

<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	
	String dbUserName=application.getInitParameter("dbUserName");
	String dbPassword=application.getInitParameter("dbPassword");
	String jdbcDriver=application.getInitParameter("jdbcDriver");
	String urlString=application.getInitParameter("urlString");

	String  userName=""+session.getAttribute("sUserName");
	
	String heading="Verify Security Question and Answer";
	String menuType="unAuth";
	
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	
	String 	data="";
	data+="<form role=\"form\" action=verifySecurityQAAction.jsp method=post>";
	data+="<div class=\"form-group\">";
	data+="<label>Security Question</label>";
	
	try
	{
		Class.forName(jdbcDriver);
		con = DriverManager.getConnection(urlString,dbUserName,dbPassword);
		st=con.createStatement();
		rs=st.executeQuery("select securityquestion,securityanswer,password from users where username='"+userName+"' ");
		
		rs.next();
		
		String sq=rs.getString("securityquestion");
		String sa=rs.getString("securityanswer");
		String pa=rs.getString("password");
		
		session.setAttribute("sSecurityAnswer",sa);
		session.setAttribute("sPassword",pa);
		
		data+="<input type=text class=\"form-control\" value=\""+sq+"\" disabled>";
		data+="</div>";

		data+="<div class=\"form-group\">";
		data+="<label>Security Answer</label>";
		data+="<input type=text name=securityAnswer class=\"form-control\" >";
		data+="</div>";
		
		data+="<input type=\"submit\" class=\"btn btn-primary\" value=\"Show Password\"></input> ";
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