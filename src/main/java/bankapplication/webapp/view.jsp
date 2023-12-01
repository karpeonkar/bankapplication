<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> VIEW BALANCE PAGE</title>
</head>
<body>
 <%
     long accno= Long.parseLong(request.getParameter( "accountnumber"));
     Class.forName( "com.mysql.cj.jdbc.Driver");
     Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","Root@1234");
     PreparedStatement ps= con.prepareStatement("select * from account where accountnumber=?");
     ps.setLong(1,accno);
     double totalbalance;
     ResultSet rs= ps.executeQuery();
    if(rs.next())
    {
      totalbalance=rs.getDouble(7);
	  response.getWriter().println("<center>"+"Total Balance : "+"<b1>"+ totalbalance +"</b1>"+"<center>"); 
	  System.out.println( "Your a/c has Totalbalance "+totalbalance+" rupise");
	}
    else
    {
    	System.out.println("Incoorect Credintials....");
    }
  %>
</body>
</html>