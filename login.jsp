<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Login";
	String menuType="unAuth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	String Role="";
	
	String 	data="";
			data+="<form role=\"form\" action=loginAction.jsp method=post>";
			data+="<div class=\"form-group\">";
			data+="<label>Username</label>";
			data+="<input type=text name=userName class=\"form-control\" placeholder=\"Enter Username Here\">";
			data+="</div>";

			data+="<div class=\"form-group\">";
			data+="<label>Password</label>";
			data+="<input type=password name=password class=\"form-control\" placeholder=\"Enter Password Here\">";
			data+="</div>";
			
			data+="<input type=\"submit\" class=\"btn btn-primary\" value=Login></input> | <a href=\"forgetPassword.jsp\">Forget Password</a>";
			data+="</form>";
		
	
	out.println(template1.genPage(heading,message,data,menuType,Role));
%>