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
     double amt=Long.parseLong(request.getParameter( "amount"));
     
     Class.forName( "com.mysql.cj.jdbc.Driver");
     Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","Root@1234");
     PreparedStatement ps= con.prepareStatement("select * from account where accountnumber=?");
     ps.setLong(1,accno);
     double totalbalance;
     int id;
    ResultSet rs= ps.executeQuery();
    if(rs.next())
    {
    	totalbalance=rs.getDouble(7);
		id= rs.getInt(1);
		totalbalance -= amt;
		PreparedStatement ps1= con.prepareStatement( "update account set balance=? where id=?");
		ps1.setDouble(1,totalbalance);
		ps1.setInt(2,id);
		ps1.execute();
		response.getWriter().println("<center>"+"<h1>"+"Transaction successfull..."+"</h1>"+"</center>");
		response.getWriter().println("<center>"+"<h1>"+"Your a/c no debited :"+totalbalance+" rupees"+"</h1>"+"</center>");
		System.out.println("Your a/c no debited "+totalbalance+"  successfuly...");
	}
    else
    {
    	System.out.println("Incoorect Credintials....");
    }
  %>
</body>
</html>