package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.categorie;
import entities.phone;
import tools.DBConnection;

public class phoneDAO {

	public phoneDAO() {
		// TODO Auto-generated constructor stub
	}

	Statement st;
	ResultSet rs;
	
	
	
	
	
/* --- Start Add poste --- */
	
	public int addPhone(phone p) {
		
		int test = 0;		 

		if(DBConnection.connect() != null) {	
			
			test = DBConnection.update("insert into phone(name, details, image, quantity, price, categorie) "
					+ "values  ('"+p.getName()+"','"+p.getDetails()+"','"+p.getImage()+"',"+p.getQuantity()+","+p.getPrice()+","+p.getCategorie()+")");
		
		}else {
			test = -1;
		}

		return test;
	}
	
	
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
					p.setPrice(rs.getDouble(6));
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
	
	
	
	

	public int deletePhoneById(int id) {
		int statut = 0;
				
		if(DBConnection.connect() != null) {	

			statut = DBConnection.update("delete from phone where id =" + id);

		}else {
			statut = -1;
		}
		
		return statut;
		
	}
	
	public int updatePhone(phone p) {
		
		int res = 0;
		String sql = "";
		if(p.getImage() != null) {
			
			sql = "update phone set name = '"+p.getName()+"', details = '"+p.getDetails()+"', image = '"+p.getImage()+"', quantity = "+p.getQuantity()+", price = "+p.getPrice()+", categorie = "+p.getCategorie()+"  where id =" + p.getId();
		
		}else {
			
			sql = "update phone set name = '"+p.getName()+"', details = '"+p.getDetails()+"', quantity = "+p.getQuantity()+", price = "+p.getPrice()+", categorie = "+p.getCategorie()+"  where id =" + p.getId();
		}
		
		if(DBConnection.connect() != null) {	

			res = DBConnection.update(sql);

		}else {
			res = -1;
		}
		
		return res;
	}
	
	/* --- Start search phones --- */

	public ArrayList<phone> searchPhones(String inp){
		
		ArrayList<phone> phones = new ArrayList<phone>();
		
		if(DBConnection.connect() != null) {		
			try {
				
				rs = DBConnection.get("select * from phone where  LOWER(name) = LOWER('"+inp+"') or categorie in (select id from categorie where LOWER(name) = LOWER('"+inp+"'))");
				
				while(rs.next()) {
					
					phone p = new phone();
					
					p.setId(rs.getInt(1));
					p.setName(rs.getString(2));
					p.setDetails(rs.getString(3));
					p.setImage(rs.getString(4));
					p.setQuantity(rs.getInt(5));
					p.setPrice(rs.getDouble(6));
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
	
	
	/* --- End search phones --- */
	
}
