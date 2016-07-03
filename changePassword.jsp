<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Change Password";
	String menuType="auth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	String 	data="";
			data+="<form role=\"form\" action=changePasswordAction.jsp method=post>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Old Password</label>";
			data+="<input type=password name=oldPassword class=\"form-control\" placeholder=\"Enter Old Password Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>New Password</label>";
			data+="<input type=password name=newPassword class=\"form-control\" placeholder=\"Enter New Password Here\">";
			data+="</div>";

			
			data+="<div class=\"form-group\">";
			data+="<label>Re-Enter New Password</label>";
			data+="<input type=password name=reNewPassword class=\"form-control\" placeholder=\"Re-Enter New Password Here\">";
			data+="</div>";
			
			
			data+="<input type=\"submit\" class=\"btn btn-primary\" value=Change></input>";

	
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