
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if(email.equalsIgnoreCase("karpeonkar2000@gmail.com"))
{
  if(password.equalsIgnoreCase("7447"))
  {
	 RequestDispatcher rd= request.getRequestDispatcher("adminOption.html");
	 rd.forward(request, response);
  }
  else
  {
	response.getWriter().println("<center>"+"<h3>"+" invalid password.."+"</h3>"+"</center>");
  }
}
else
{
	response.getWriter().println("<center>"+"<h3>"+" invalid email.."+"</h3>"+"</center>");
}
%>

</body>
</html>