package bankapplication;

import java.io.IOException;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import java.util.Random;
 

@WebServlet("/saveaccount")
public class SaveAccount extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   String id= req.getParameter( "id");
	   String name=req.getParameter( "name");
	   String age=req.getParameter( "age");
	   String pin=req.getParameter("pin");
	   String address=req.getParameter( "address");
	   
	   int id1= Integer.parseInt(id);
	   int age1=Integer.parseInt(age);
	   long pin1= Long.parseLong(pin);
	   
	   Random r= new Random();
       Long accountnumber=  r.nextLong(100000000001l);  
	   System.out.println(accountnumber);
	   double balance= 500;
	   
	    
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","Root@1234");
		 PreparedStatement ps=con.prepareStatement("insert into account values(?,?,?,?,?,?,?)");
		 ps.setInt(1,id1);
		 ps.setString(2,name);
		 ps.setInt(3, age1);
		 ps.setLong( 4, pin1);
		 ps.setString( 5, address);
		 ps.setLong( 6,accountnumber);
		 ps.setDouble( 7, balance);
		 ps.execute();
		 resp.getWriter().println("Account created successfully..");
		 
		 System.out.println("Account created successfully.." );
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		 
	   
	   
	   
	   
	   
	   	
	}

}
