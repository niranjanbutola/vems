<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Password Recovery";
	String menuType="unAuth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	String 	data="";
			data+="<form action=forgetPasswordAction.jsp method=post role=\"form\">";
			
			data+="<div class=\"form-group\">";
			data+="<label>Username</label>";
			data+="<input name=userName type=text class=\"form-control\" placeholder=\"Enter Username Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Email Address</label>";
			data+="<input name=email type=text class=\"form-control\" placeholder=\"Enter Email Address Here\">";
			data+="</div>";

						
			
			
			data+="<input type=\"submit\" class=\"btn btn-primary\" value=\"Verify User\"></input>";

	
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