<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Change Profile Pic";
	String menuType="auth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	String 	data="";
			data+="<form role=\"form\" enctype=\"multipart/form-data\" method=post action=\"uploadFile\">";
			
			
			data+="<div class=\"form-group\" >";
			data+="<label>Profile Pic</label>";
			data+="<input type=file name=\"uploadFile\">";
			data+="</div>";
			
			data+="<input type=\"submit\" class=\"btn btn-primary\" value=\"Upload Profile Pic\"></input>";

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