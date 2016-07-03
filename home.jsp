<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="Home";
	String menuType="auth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	
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
	
	
	String data="Welcome <strong>"+session.getAttribute("sUserName")+" </strong>. You are logged in as a "+Role+". Use navigation menu to perform further operations.";
	
	out.println(template1.genPage(heading,message,data,menuType,Role));
%>