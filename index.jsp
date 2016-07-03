<%@include file="classes/template.jsp"%>

<%
	Template template1=new Template();
	
	String heading="About Vulnerable Employee Management System 1.0";
	String menuType="unAuth";
	String message=request.getParameter("message")==null?message=" ":request.getParameter("message");
	String Role="";
	
	String data="<h2>Introduction</h2>";
	data+="<p>VEMS is a deliberately created vulnerable application which can be used to learn and perform different web based attacks. It is a JAVA based web application using Java Server Pages (JSP) as server side scripting language and Oracle XE as database.</p>";
	
	data+="<h2>User Roles</h2>";
	data+="VEMS 1.0 consist of three different type of users";
	data+="<ul>";
	data+="<li>Super Admin</li>";
	data+="<li>Admin</li>";
	data+="<li>User</li>";
	data+="</ul>";
	
	data+="<strong>Super Admin: -</strong> This user has highest level of privilege and can perform following operations:-";
	data+="<ul><li><strong>Profile</strong><ul><li>View Own Profile</li><li>Edit Own Profile</li><li>Change Own Password</li><li>Change Own Security Question</li><li>Upload Own Profile Pic</li></ul></li></ul>";
	data+="<ul><li><strong>Users</strong><ul><li>Assign Project to a User</li><li>Un-Assign Project to a User</li><li>View All User</li><li>View Other User</li><li>Edit Other User</li></ul></li></ul>";
	data+="<ul><li><strong>Projects</strong><ul><li>Add Project </li><li>View All Project</li><li>View Specific Project</li><li>Edit Project Details</li></ul></li></ul>";
	data+="<ul><li><strong>Dashboard</strong><ul><li>Grant Access to User</li><li>Revoke Access from User</li><li>Reset Other User's Password </li></ul></li></ul>";
	data+="<ul><li><strong>Sign Out</strong></li></ul>";
	
	data+="<strong>Admin: -</strong> This is an admin user and can perform following operations:-";
	data+="<ul><li><strong>Profile</strong><ul><li>View Own Profile</li><li>Edit Own Profile</li><li>Change Own Password</li><li>Change Own Security Question</li><li>Upload Own Profile Pic</li></ul></li></ul>";
	data+="<ul><li><strong>Users</strong><ul><li>Assign Project to a User</li><li>Un-Assign Project to a User</li><li>View All User</li><li>View Other User</li><li>Edit Other User</li></ul></li></ul>";
	data+="<ul><li><strong>Projects</strong><ul><li>Add Project </li><li>View All Project</li><li>View Specific Project</li><li>Edit Project Details</li></ul></li></ul>";
	data+="<ul><li><strong>Sign Out</strong></li></ul>";
	
	data+="<strong>User: -</strong> This user has least privilege and can perform following operations:-";
	data+="<ul><li><strong>Profile</strong><ul><li>View Own Profile</li><li>Edit Own Profile</li><li>Change Own Password</li><li>Change Own Security Question</li><li>Upload Own Profile Pic</li></ul></li></ul>";
	data+="<ul><li><strong>Sign Out</strong></li></ul>";
	
	
	out.println(template1.genPage(heading,message,data,menuType,Role));
%>