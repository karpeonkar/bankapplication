<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Validation</title>
</head>
<body>
<h1 align="center"> USER VALIDATION</h1>
<%
  String accountnumber=request.getParameter("accountnumber" );
  String pin=request.getParameter("pin");
  long accountnumber1=Long.parseLong(accountnumber);
  long pin1=Long.parseLong(pin);
     
  Class.forName( "com.mysql.cj.jdbc.Driver");
  Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","Root@1234");
  PreparedStatement ps= con.prepareStatement("select * from account where pin=? and accountnumber=?");
  ps.setLong(1,pin1);
  ps.setLong(2,accountnumber1);
  ps.execute();
  ResultSet rs=ps.executeQuery();
  if(rs.next()!= false)
  {
	  RequestDispatcher rd= request.getRequestDispatcher("userOption.html");
	  rd.forward(request, response);
  }
  else if(rs.next()==false)
  {   
      RequestDispatcher rd= request.getRequestDispatcher("welcome.html");
	  rd.include(request, response);
	}  
%>  
</body>
</html>