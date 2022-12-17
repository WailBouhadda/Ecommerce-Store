package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.order;
import tools.DBConnection;

public class orderDAO {

	public orderDAO() {
		// TODO Auto-generated constructor stub
	}
	
	ResultSet rs;
	Statement st;
	
	public ArrayList<order>	getOrders(){
		
		ArrayList<order> orders = new ArrayList<order>();
		
		if(DBConnection.connect() != null) {
			
			rs = DBConnection.get("select * from command");
			
			try {
				while(rs.next()) {
					
					order o = new order();
					
					o.setId(rs.getInt(1));
					o.setDate(rs.getDate(3));
					o.setTotal(rs.getDouble(4));
					o.setClient(rs.getInt(5));
					
					String prod[] =  rs.getString(2).split(",");
					ArrayList<Integer> prods = new ArrayList<Integer>();
					
					for(String p: prod) {
						prods.add(Integer.parseInt(p));
					}
					
					o.setProducts(prods);
					
					
					orders.add(o);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		return orders;
		
	}
	
	
	public ArrayList<order>	getOrdersByClient(int id){
		
		ArrayList<order> orders = new ArrayList<order>();
		
		if(DBConnection.connect() != null) {
			
			rs = DBConnection.get("select * from order where client = "+id+" order by date");
			
			try {
				while(rs.next()) {
					
					order o = new order();
					
					o.setId(rs.getInt(1));
					o.setDate(rs.getDate(3));
					o.setTotal(rs.getDouble(4));
					o.setClient(rs.getInt(5));
					
					String prod[] =  rs.getString(2).split(",");
					ArrayList<Integer> prods = new ArrayList<Integer>();
					
					for(String p: prod) {
						prods.add(Integer.parseInt(p));
					}
					
					o.setProducts(prods);
					
					
					orders.add(o);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		return orders;
		
	}
	
	
	public int addOrder(order o) {
		
		int res = 0;
		
		if(DBConnection.connect() != null) {
			
			String products = o.getProducts().toString();
			res = DBConnection.update("insert into order(products, total, client) values('"+products+"',"+o.getTotal()+","+o.getClient()+")");
		}else {
			res = -1;
		}
		return res;
	}
	
	

}
