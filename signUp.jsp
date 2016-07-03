<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Sign Up Form";
	String menuType="unAuth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	String 	data="";
			data+="<form role=\"form\" action=signUpAction.jsp method=post>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Username</label>";
			data+="<input name=userName type=text class=\"form-control\" placeholder=\"Enter Username Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Email Address</label>";
			data+="<input name=email type=text class=\"form-control\" placeholder=\"Enter Email Address Here\">";
			data+="</div>";

			data+="<div class=\"form-group\">";
			data+="<label>Password</label>";
			data+="<input name=password type=password class=\"form-control\" placeholder=\"Enter Password Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Re-Enter Password</label>";
			data+="<input name=rePassword type=password class=\"form-control\" placeholder=\"Re-Enter Password Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>First Name</label>";
			data+="<input name=firstName type=text class=\"form-control\" placeholder=\"Enter First Name Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Last Name</label>";
			data+="<input name=lastName type=text class=\"form-control\" placeholder=\"Enter Last Name Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Contact Number</label>";
			data+="<input name=contactNumber type=text class=\"form-control\" placeholder=\"Enter Contact Number Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Mailing Address</label>";
			data+="<textarea name=address class=\"form-control\" rows=\"3\" placeholder=\"Enter Mailing Address Here\"></textarea>";
			data+="</div>";
			
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
			
			
			data+="<input type=\"submit\" class=\"btn btn-primary\" value=\"Create Account\"></input>";

	
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