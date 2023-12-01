<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
 long accno1=Long.parseLong(request.getParameter("accountnumber1"));
 double amt=Double.parseDouble(request.getParameter("amount"));
 long accno2=Long.parseLong(request.getParameter("accountnumber2"));
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con= DriverManager.getConnection( "jdbc:mysql://localhost:3306/bankapplication","root","Root@1234");
 PreparedStatement ps1=con.prepareStatement("select * from account where accountnumber=? ");
 ps1.setLong( 1,accno1);
 double totalbalance1;
 int id1;
 ResultSet rs1= ps1.executeQuery();
 if(rs1.next())
 {
	    totalbalance1=rs1.getDouble(7);
		id1= rs1.getInt(1);
		totalbalance1 -= amt;
		PreparedStatement ps2= con.prepareStatement( "update account set balance=? where id=?");
		ps2.setDouble(1,totalbalance1);
		ps2.setInt(2,id1);
		ps2.execute();
		response.getWriter().println("<center>"+"<h1>"+"Transaction successfull..."+"</h1>"+"</center>");
		System.out.println("Your a/c no debited "+amt+"  successfuly...");
 }
 else
 {
  response.getWriter().println("<h1>"+"Incorrect crediantials..."+"</h1>");
 }
 %>
 <%
 //long accno2=Long.parseLong(request.getParameter("account
 //double amt1=Double.parseDouble(request.getParameter("amount"));
// Class.forName("com.mysql.cj.jdbc.Driver");
 //Connection con= DriverManager.getConnection( "jdbc:mysql://localhost:3306/bankapplication","root","Root@1234");
 PreparedStatement ps3=con.prepareStatement("select * from account where accountnumber=? ");
 ps3.setLong( 1,accno2);
 double totalbalance2;
 int id2;
 ResultSet rs2= ps3.executeQuery();
 if(rs2.next())
 {
	    totalbalance2=rs2.getDouble(7);
		id2= rs2.getInt(1);
		totalbalance2 += amt;
		PreparedStatement ps4= con.prepareStatement( "update account set balance=? where id=?");
		ps4.setDouble(1,totalbalance2);
		ps4.setInt(2,id2);
		ps4.execute();
		
		System.out.println("Your a/c no created "+amt+"  successfuly...");
 }
 else
 {
  response.getWriter().println("<h1>"+"Incorrect crediantials..."+"</h1>");
 }
 %>
</body>
</html>