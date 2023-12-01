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
<title>Insert title here</title>
</head>
<body>
 <%
     long accno= Long.parseLong(request.getParameter( "accountnumber"));
     long pin1=Long.parseLong(request.getParameter("pin"));
     Class.forName( "com.mysql.cj.jdbc.Driver");
     Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","Root@1234");
     PreparedStatement ps= con.prepareStatement("delete from account where accountnumber=? and pin=?");
     ps.setLong(1,accno);
     ps.setLong(2,pin1);
     ps.execute();
     response.getWriter().println("<center>"+"<b1>"+" Account Deleted Successfuly.."+"</b1>"+"<center>");
      
  %>

</body>
</html>