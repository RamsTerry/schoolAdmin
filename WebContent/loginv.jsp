
<%

String email = request.getParameter("email");
String pass = request.getParameter("password");

if(email.equals("terry@gmail.com") && pass.equals("12345")){
String redirect="menu.jsp"	;
response.sendRedirect(redirect);
	
}else{
	out.println("Not An Admin!!");
}


%>