<%

String securityAnswer=request.getParameter("securityAnswer");
String ssecurityAnswer=""+session.getAttribute("sSecurityAnswer");
String password=""+session.getAttribute("sPassword");



if(securityAnswer.equals(ssecurityAnswer))
	{
		session.invalidate();
		response.sendRedirect("login.jsp?message=Your Password is <strong>"+password+"</strong>. Login to continue");
	}
else
	{
		session.invalidate();
		response.sendRedirect("login.jsp?message=Security Answer does not match. Try Again!!");
	}
%>