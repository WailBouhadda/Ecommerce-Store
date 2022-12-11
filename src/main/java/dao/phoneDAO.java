package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.phone;
import tools.DBConnection;

public class phoneDAO {

	public phoneDAO() {
		// TODO Auto-generated constructor stub
	}

	Statement st;
	ResultSet rs;
	
	
	
	
	/* --- Start Get all postes --- */

	public ArrayList<phone> getPhones(){
		
		ArrayList<phone> phones = new ArrayList<phone>();
		
		if(DBConnection.connect() != null) {		
			try {
				
				rs = DBConnection.get("select * from phone");
				
				while(rs.next()) {
					
					phone p = new phone();
					
					p.setId(rs.getInt(1));
					p.setName(rs.getString(2));
					p.setDetails(rs.getString(3));
					p.setImage(rs.getString(4));
					p.setQuantity(rs.getInt(5));
					p.setPrice(rs.getInt(6));
					p.setDate(rs.getDate(7));
					p.setCategorie(rs.getInt(8));
					
					phones.add(p);
				}
	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			}else {
				phones = null;
			}
		return phones;
	}
	
	
	/* --- End Get all postes --- */
	
	
	/* --- Start Get poste by id --- */

	
	public phone getPhoneById(int id){
			
		
			phone p = new phone();
	
			if(DBConnection.connect() != null) {		
				try {
					
					
					rs = DBConnection.get("select * from phone where id = "+id);
					
					if(rs.next()) {
						
						
						
						p.setId(rs.getInt(1));
						p.setName(rs.getString(2));
						p.setDetails(rs.getString(3));
						p.setImage(rs.getString(4));
						p.setQuantity(rs.getInt(5));
						p.setPrice(rs.getInt(6));
						p.setDate(rs.getDate(7));
						p.setCategorie(rs.getInt(8));
						
					}
		
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
				}else {
					p = null;
				}
			return p;
		}
	
	/* --- End Get poste by id --- */
	
	/* --- Start Get poste by categorie id --- */
	
	public ArrayList<phone> getPhonesByCategorieId(int id){
		
		ArrayList<phone> phones = new ArrayList<phone>();
		
		if(DBConnection.connect() != null) {		
			try {
				
				rs = DBConnection.get("select * from phone where categorie ="+id);
				
				while(rs.next()) {
					
					phone p = new phone();
					
					p.setId(rs.getInt(1));
					p.setName(rs.getString(2));
					p.setDetails(rs.getString(3));
					p.setImage(rs.getString(4));
					p.setQuantity(rs.getInt(5));
					p.setPrice(rs.getInt(6));
					p.setDate(rs.getDate(7));
					p.setCategorie(rs.getInt(8));
					
					phones.add(p);
				}
	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			}else {
				phones = null;
			}
		return phones;
	}
	
	/* --- End Get poste by categorie id --- */

	
	
	
}
