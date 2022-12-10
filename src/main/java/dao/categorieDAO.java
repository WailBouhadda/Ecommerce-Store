package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import entities.categorie;
import tools.DBConnection;

public class categorieDAO {

	public categorieDAO() {
		// TODO Auto-generated constructor stub
	}
	
	Statement st;
	ResultSet rs;
	
	
	
	public int addcategorie(categorie c) {
		
		int statut = 0;
		
		if(DBConnection.connect() != null) {	

			statut = DBConnection.update("insert into categorie(name) values ('"+c.getName()+"')");

		}else {
			statut = -1;
		}
		
		return statut;
	}
	
	
	
	
	
	public ArrayList<categorie> getcategories(){
		
		ArrayList<categorie> c = new ArrayList<categorie>();
		
		if(DBConnection.connect() != null) {		
				try {
					
					rs = DBConnection.get("select * from categorie");
					
					while(rs.next()) {
						categorie cn = new categorie();
						
						cn.setId(rs.getInt(1));
						cn.setName(rs.getString(2));
						
						c.add(cn);
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else {
			c = null;
		}
		
		return c;
	}
	
	
	
	public categorie getcategorieById(int id){
		
		categorie c = new categorie();
		if(DBConnection.connect() != null) {
				try {
					
					rs = DBConnection.get("select * from categorie where id = "+id);

					
					if(rs.next()) {
						
						c.setId(rs.getInt(1));
						c.setName(rs.getString(2));
						
						return c;
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else {
			c = null;
		}
		
		
		return c;
	}
	
	
	public int deleteCategorieById(int id) {
		int statut = 0;
				
		if(DBConnection.connect() != null) {	

			statut = DBConnection.update("delete from categorie where id =" + id);

		}else {
			statut = -1;
		}
		
		return statut;
		
	}

	
	
	

}
