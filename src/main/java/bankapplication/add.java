package bankapplication;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.Scanner;
public class add {
	 	 public static void main(String[] args) throws SQLException {
	 		// TODO Auto-generated method stub
	 		 
	 		Connection con = helper.getConnect();
	 		PreparedStatement ps= con.prepareStatement("select * from account where accountnumber=? and pin=?");
	 		Scanner sc= new Scanner(System.in);
	 		System.out.println("Enter the account number...");
	 		int accno= sc.nextInt();
	 		
	 		System.out.println("Enter the pin..");
	 		int pin= sc.nextInt();
	 		double balance;
	 		int id;
	 		
	 		ps.setInt(1,accno);
	 		ps.setInt(2, pin);
	 		
	 		ResultSet rs= ps.executeQuery();
	 		
	 		if(rs.next())
	 		{   
	 			balance=rs.getDouble(5);
	 			id= rs.getInt(1);
	 			
	 			System.out.println("1.add mony 2.withdraw mony");
	 			int choice= sc.nextInt();
	 			
	 			switch(choice)
	 			{
	 			case 1:{
	 				System.out.println("Enter ammount..");
	 				double amt = sc.nextDouble();
	 				balance += amt;
	 				
	 				PreparedStatement ps1= con.prepareStatement("update account set balance=? where id=?");
	 				ps1.setDouble(1, balance);
	 				ps1.setInt(2, id);
	 				ps1.execute();
	 				System.out.println("Amount added");
	 			}
	 			}
	 		}
	 		else
	 		{
	 			System.out.println("Incoorect Credintials....");
	 		}

	 	}

	 }


