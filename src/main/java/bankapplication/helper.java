package bankapplication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class helper {
	public static Connection getConnect() throws SQLException
	{
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost/bankapplication","root","Root@1234");
		return con;
	}

}
