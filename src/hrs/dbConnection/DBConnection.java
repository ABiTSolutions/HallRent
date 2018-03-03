package hrs.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	static Connection conn = null;

	public static Connection getConnection()
	{
		String DriverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
 	    String url = "jdbc:sqlserver://localhost:1433;databaseName=HRS_DB";		
 	    String DBuser = "sa";
 	    String DBpassword = "admin@123";
 	    try {
			Class.forName(DriverName).newInstance();
			conn = DriverManager.getConnection(url, DBuser, DBpassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   return conn;
	}
}
