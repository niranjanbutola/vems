<%
	
	
class Template
	{
		
		
		String genPage(String heading,String message,String content,String menuType,String Role)
			{
				
				String data="";
				
				data+="<!DOCTYPE html>";
				data+="<html>";
				data+="<head>";
				data+="<meta charset=\"utf-8\">";
				data+="<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">";
				data+="<title>Employee Management System</title>";

				data+="<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">";
				data+="<link href=\"css/datepicker3.css\" rel=\"stylesheet\">";
				data+="<link href=\"css/styles.css\" rel=\"stylesheet\">";

				data+="<!--[if lt IE 9]>";
				data+="<script src=\"js/html5shiv.js\"></script>";
				data+="<script src=\"js/respond.min.js\"></script>";
				data+="<![endif]-->";

				data+="</head>";

				data+="<body>";
				data+="<nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">";
				data+="<div class=\"container-fluid\">";
				data+="<div class=\"navbar-header\">";
				data+="<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#sidebar-collapse\">";
				data+="<span class=\"sr-only\">Toggle navigation</span>";
				data+="<span class=\"icon-bar\"></span>";
				data+="<span class=\"icon-bar\"></span>";
				data+="<span class=\"icon-bar\"></span>";
				data+="</button>";
				data+="<a class=\"navbar-brand\" href=\"#\"><span> Vulnerable Employee Management System | </span>| 1.0</a>";

				data+="</div>";

				data+="</div><!-- /.container-fluid -->";
				data+="</nav>";

				data+="<div id=\"sidebar-collapse\" class=\"col-sm-3 col-lg-2 sidebar\">";

				data+=menu(menuType,Role);
				
				data+="</div><!--/.sidebar-->";
				
				
				data+="<div class=\"col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main\">";			
				data+="<div class=\"row\">";
				data+="<ol class=\"breadcrumb\">";
				data+="<li><a href=\"#\"><span class=\"glyphicon glyphicon-home\"></span></a></li>";
				data+="<li class=\"active\">"+heading+"</li>";
				data+="</ol>";
				data+="</div><!--/.row-->";

				data+="<div class=\"row\">";
				data+="<div class=\"col-lg-12\">";
				data+="<div class=\"panel panel-default\">";

				data+="<div class=\"panel-body\">";
				data+="<div class=\"col-md-6\">";
				
				data+="<center>"+message+"</center>";
				data+=content;

				data+="</div>";
				data+="</div>";
				data+="</div>";
				data+="</div>";
				data+="</div>";					
				data+="</div>";


				data+="<script src=\"js/jquery-1.11.1.min.js\"></script>";
				data+="<script src=\"js/bootstrap.min.js\"></script>";
				data+="<script src=\"js/easypiechart-data.js\"></script>";
				data+="<script src=\"js/bootstrap-datepicker.js\"></script>";

				data+="</body>";

				data+="</html>";


				return data;
			}
			
		String menu(String menuType,String Role)
			{
				String menuData="";
				
				if(menuType.equals("unAuth"))
					{
					
				
						menuData+="<ul class=\"nav menu\">";
						menuData+="<li><a href=\"index.jsp\"><span class=\"glyphicon glyphicon-dashboard\"></span> About VEMS 1.0</a></li>";
						/*
						menuData+="<li class=\"parent \">";
						menuData+="<a href=\"#\">";
						menuData+="<span class=\"glyphicon glyphicon-list\"></span> Vulnerabilities Covered <span data-toggle=\"collapse\" href=\"#sub-item-1\" class=\"icon pull-right\"><em class=\"glyphicon glyphicon-s glyphicon-plus\"></em></span>"; 
						menuData+="</a>";
						menuData+="<ul class=\"children collapse\" id=\"sub-item-1\">";
						menuData+="<li>";
						menuData+="<a class=\"\" href=\"#\">";
						menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> SQL Injection ";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="<li>";
						menuData+="<a class=\"\" href=\"#\">";
						menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> Cross Site Scripting";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="</ul>";
						menuData+="</li>";
						*/
						menuData+="<li role=\"presentation\" class=\"divider\"></li>";
						menuData+="<li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-user\"></span> Login</a></li>";
						menuData+="<li><a href=\"signUp.jsp\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li>";
						menuData+="</ul>";

					}
				else
					{
					
						menuData+="<ul class=\"nav menu\">";
						menuData+="<li class=\"parent \">";
						menuData+="<a href=\"#\">";
						menuData+="<span class=\"glyphicon glyphicon-list\"></span> Profile <span data-toggle=\"collapse\" href=\"#sub-item-2\" class=\"icon pull-right\"><em class=\"glyphicon glyphicon-s glyphicon-plus\"></em></span>"; 
						menuData+="</a>";
						menuData+="<ul class=\"children collapse\" id=\"sub-item-2\">";
						menuData+="<li>";
						menuData+="<a class=\"\" href=\"viewProfile.jsp\">";
						menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span>View Profile";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="<li>";
						menuData+="<a class=\"\" href=\"editUser.jsp\">";
						menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span>Edit Profile";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="<li>";
						menuData+="<a class=\"\" href=\"changePassword.jsp\">";
						menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span>Change Password";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="<li>";
						menuData+="<a class=\"\" href=\"changeSecurityQuestion.jsp\">";
						menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span>Change Security Ques";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="<li>";
						menuData+="<a class=\"\" href=\"changeProfilePic.jsp\">";
						menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span>Update Profile Pic";
						menuData+="</a>";
						menuData+="</li>";
						menuData+="</ul>";
						menuData+="</li>";
						
						if(Role.equals("Admin")|| Role.equals("Super Admin"))
						{
							menuData+="<li class=\"parent \">";
							menuData+="<a href=\"#\">";
							menuData+="<span class=\"glyphicon glyphicon-list\"></span> Users <span data-toggle=\"collapse\" href=\"#sub-item-3\" class=\"icon pull-right\"><em class=\"glyphicon glyphicon-s glyphicon-plus\"></em></span>"; 
							menuData+="</a>";
							menuData+="<ul class=\"children collapse\" id=\"sub-item-3\">";
							
							menuData+="<li>";
							menuData+="<a class=\"\" href=\"assignProject.jsp\">";
							menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> Assign Project";
							menuData+="</a>";
							menuData+="</li>";
							menuData+="<li>";
							menuData+="<a class=\"\" href=\"unAssignProject.jsp\">";
							menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> Un-Assign Project";
							menuData+="</a>";
							menuData+="</li>";
							
							menuData+="<li>";
							menuData+="<a class=\"\" href=\"viewProfile.jsp?id=all\">";
							menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> View All Users";
							menuData+="</a>";
							menuData+="</li>";
							menuData+="</a>";
							menuData+="</li>";
							menuData+="</ul>";
							menuData+="</li>";
						
							menuData+="<li class=\"parent \">";
							menuData+="<a href=\"#\">";
							menuData+="<span class=\"glyphicon glyphicon-list\"></span> Project <span data-toggle=\"collapse\" href=\"#sub-item-4\" class=\"icon pull-right\"><em class=\"glyphicon glyphicon-s glyphicon-plus\"></em></span>"; 
							menuData+="</a>";
							menuData+="<ul class=\"children collapse\" id=\"sub-item-4\">";
							
							menuData+="<li>";
							menuData+="<a class=\"\" href=\"addProject.jsp\">";
							menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> Add Project";
							menuData+="</a>";
							menuData+="</li>";
							menuData+="<li>";
							menuData+="<a class=\"\" href=\"viewProject.jsp?id=all\">";
							menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> View All Projects";
							menuData+="</a>";
							menuData+="</li>";

							menuData+="</a>";
							menuData+="</li>";
							menuData+="</ul>";
							menuData+="</li>";
							
							if(Role.equals("Super Admin"))
							{
								menuData+="<li class=\"parent \">";
								menuData+="<a href=\"#\">";
								menuData+="<span class=\"glyphicon glyphicon-list\"></span>Dashboard <span data-toggle=\"collapse\" href=\"#sub-item-1\" class=\"icon pull-right\"><em class=\"glyphicon glyphicon-s glyphicon-plus\"></em></span>"; 
								menuData+="</a>";
								menuData+="<ul class=\"children collapse\" id=\"sub-item-1\">";
								menuData+="<li>";
								menuData+="<a class=\"\" href=\"access.jsp\">";
								menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> Grant/Revoke Access";
								menuData+="</a>";
								menuData+="</li>";
								menuData+="<li>";
								menuData+="<a class=\"\" href=\"resetPassword.jsp\">";
								menuData+="<span class=\"glyphicon glyphicon-share-alt\"></span> Reset Password";
								menuData+="</a>";
								menuData+="</li>";
								menuData+="</a>";
								menuData+="</li>";
								menuData+="</ul>";
								menuData+="</li>";

							}
						}
						

						menuData+="<li role=\"presentation\" class=\"divider\"></li>";
						menuData+="<li><a href=\"logout.jsp\"><span class=\"glyphicon glyphicon-user\"></span>Sign Out</a></li>";
						menuData+="</ul>";
					}
								
				return menuData;
			}
	}

%>