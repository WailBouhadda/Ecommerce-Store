package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringJoiner;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import org.apache.catalina.tribes.util.Arrays;

import com.mysql.cj.util.StringUtils;

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
					o.setCountry(rs.getString(2));
					o.setAdress(rs.getString(3));
					o.setZipcode(rs.getString(4));
					o.setDate(rs.getDate(6));
					o.setTotal(rs.getDouble(7));
					o.setNote(rs.getString(8));
					o.setClient(rs.getInt(9));
					
					String[] prod =  rs.getString(5).split(":");
					ArrayList<Integer[]> prods = new ArrayList<Integer[]>();
					
					for(String p: prod) {
						System.out.println(p);
						
						String PQ[] = p.split(",");
						Integer elInt[] = new Integer[2];
						elInt[0] = Integer.parseInt(PQ[0]);
						elInt[1] = Integer.parseInt(PQ[1]);
						
						System.out.println(prod[0]);


						prods.add(elInt);
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
			
			rs = DBConnection.get("select * from command where client = "+id+" order by date");
			
			try {
				while(rs.next()) {
					
					order o = new order();
					
					o.setId(rs.getInt(1));
					o.setCountry(rs.getString(2));
					o.setAdress(rs.getString(3));
					o.setZipcode(rs.getString(4));
					o.setDate(rs.getDate(6));
					o.setTotal(rs.getDouble(7));
					o.setNote(rs.getString(8));
					o.setClient(rs.getInt(9));
					
					
					String prod[] =  rs.getString(5).split(":");
					ArrayList<Integer[]> prods = new ArrayList<Integer[]>();
					
					for(String p: prod) {
						String PQ[] = p.split(",");
						Integer elInt[] = new Integer[2];
						
						elInt[0] = Integer.parseInt(PQ[0]);
						elInt[1] = Integer.parseInt(PQ[1]);
						
						prods.add(elInt);
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
			
			ArrayList<String> rows = new ArrayList<String>();
			for(Integer[] ele:o.getProducts()) {
				
				
				String row = Stream.of(ele).map(String::valueOf).collect(Collectors.joining(","));
				rows.add(row);
			}
			
			String products = String.join(":", rows);
			
			res = DBConnection.update("insert into command(country, adress, zipcode, products, total, note, client) "
					+ "values('"+o.getCountry()+"','"+o.getAdress()+"','"+o.getZipcode()+"','"+products+"',"+o.getTotal()+",'"+o.getNote()+"',"+o.getClient()+")");
		}else {
			res = -1;
		}
		return res;
	}
	
	

}
