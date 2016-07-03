<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Change Security Question/Answer";
	String menuType="auth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	String 	data="";
			data+="<form role=\"form\" method=post action=changeSecurityQuestionAction.jsp>";
			
			
			data+="<div class=\"form-group\">";
			data+="<label>Select Security Question</label>";
			data+="<select name=securityQuestion class=\"form-control\">";
			data+="<option>What is your fav color?</option>";
			data+="<option>What is your birth place?</option>";
			data+="<option>What is your nick name?</option>";
			data+="<option>What is your first school name?</option>";
			data+="</select>";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Security Answer</label>";
			data+="<input name=securityAnswer type=text class=\"form-control\" placeholder=\"Enter Security Answer Here\">";
			data+="</div>";
			
			
			data+="<input type=\"submit\" class=\"btn btn-primary\" value=Update></input>";

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