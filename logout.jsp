<%

Cookie myCookie=new Cookie("Role","");
myCookie.setMaxAge(0);
//myCookie.setPath("/");
response.addCookie(myCookie);

session.invalidate();

response.sendRedirect("login.jsp?message=Logout Successfully!!");
%>