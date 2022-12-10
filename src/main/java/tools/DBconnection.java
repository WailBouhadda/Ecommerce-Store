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
	static Statement st;
	static ResultSet rs;
	
		private static Connection con;
		private static String driver	= "com.mysql.jdbc.Driver";
		
		
		private	static String url 		= "jdbc:mysql://localhost:3306/ecomercedb";
		private	static String username = "root";
		private	static String pass 	= "";	

		
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
		
		public static ResultSet get(String SQL) {
			
			try {
				
				st = connect().createStatement();
				rs = st.executeQuery(SQL);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return rs;
			
		}
		
		
		public static int update(String SQL) {
			
			
			try {
				
				st = connect().createStatement();
				int res = st.executeUpdate(SQL);
				return res;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return -1;

			}
						
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
