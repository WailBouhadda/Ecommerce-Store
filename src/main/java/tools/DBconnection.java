package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {

	public DBConnection() {
		// TODO Auto-generated constructor stub
		}
	
	
		private static Connection con;
		private static String driver	= "com.mysql.jdbc.Driver";
		
		
		private	static String url 		= "jdbc:mysql://localhost:3306/ecomercedb";
		private	static String username = "root";
		private	static String pass 	= "";	
		/*
		private	static String url 		= "jdbc:mysql://uttiudbmpgckk5bm:ocsg5an1UGscxikV4Nen@b8rafwcoozfgwpk0zxvh-mysql.services.clever-cloud.com:3306/b8rafwcoozfgwpk0zxvh";
		private	static String username = "uttiudbmpgckk5bm";
		private	static String pass 	= "ocsg5an1UGscxikV4Nen";	
		*/
		public static  Connection connect()  {
		
		try {
				Class.forName(driver);


				try {	
						con = DriverManager.getConnection(url,username,pass);
					
						
					
				}catch(SQLException e) {
					
						System.out.println("connection Failed");
					
				}
		} catch (ClassNotFoundException e) {
			
				// TODO Auto-generated catch block
				e.printStackTrace();		
			
				System.out.println("Driver Not Found");
		}
	
		return con;
			
		}
		

		
		public static void disconnect() {
			
			try {
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Disconnection Failed");
			}
		
	}
		
	

}
