<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Create a New Project";
	String menuType="auth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
	String 	data="";
			data+="<form role=\"form\" action=addProjectAction.jsp method=post>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Project ID</label>";
			data+="<input name=projectID type=text class=\"form-control\" placeholder=\"Enter Project ID Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Project Name</label>";
			data+="<input name=projectName type=text class=\"form-control\" placeholder=\"Enter Project Name Here\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>Start Date</label>";
			data+="<input name=startDate type=text class=\"form-control\" placeholder=\"DD/MM/YYYY\">";
			data+="</div>";
			
			data+="<div class=\"form-group\">";
			data+="<label>End Date</label>";
			data+="<input name=endDate type=text class=\"form-control\" placeholder=\"DD/MM/YYYY\">";
			data+="</div>";
			
			
			data+="<input type=\"submit\" class=\"btn btn-primary\" value=\"Create Project\"></input>";

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