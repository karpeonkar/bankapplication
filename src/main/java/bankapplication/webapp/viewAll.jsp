<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","Root@1234");
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from account");
%>
<table cellpadding="20px" border="2" align="center">
<th>id</th>
<th>name</th>
<th>age</th>
<th>pin</th>
<th>address</th>
<th>accountnumber</th>
<th>balance</th>
<% while(rs.next()) { %>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getInt(3)%></td>
<td><%=rs.getLong(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getLong(6)%></td>
<td><%=rs.getDouble(7)%></td>
</tr>
<% } %>
</table>
</body>
</html>