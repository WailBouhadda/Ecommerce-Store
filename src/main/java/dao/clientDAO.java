package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.client;
import tools.DBConnection;

public class clientDAO {

	public clientDAO() {
		// TODO Auto-generated constructor stub
	}
	
	ResultSet rs;
	
	public ArrayList<client> getClients(){
		
		ArrayList<client> clients = new ArrayList<client>();
		
			if(DBConnection.connect() != null) {
				
				rs = DBConnection.get("select * from client");
				
				try {
					while(rs.next()) {
						
						client c = new client();
						
						c.setId(rs.getInt(1));
						c.setFirstName(rs.getString(2));
						c.setLastName(rs.getString(3));
						c.setEmail(rs.getString(4));
						c.setPassword(rs.getString(5));
						
						clients.add(c);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		return clients;
	}
	
	
public client getClientById(int id){
				
			client c = null;
			
			if(DBConnection.connect() != null) {
				
				c = new client();

				rs = DBConnection.get("select * from client where id = "+ id);
				
				try {
					while(rs.next()) {
						
						
						c.setId(rs.getInt(1));
						c.setFirstName(rs.getString(2));
						c.setLastName(rs.getString(3));
						c.setEmail(rs.getString(4));
						c.setPassword(rs.getString(5));
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		return c;
	}
	
}
