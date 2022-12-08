package entities;

import java.sql.Date;
import java.util.*;

public class command {
	
	
	private int id;
	private List<Integer> products;
	private Date date;
	private double total;
	private int client;
	
	
	

	public command() {
		// TODO Auto-generated constructor stub
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public List<Integer> getProducts() {
		return products;
	}




	public void setProducts(List<Integer> products) {
		this.products = products;
	}




	public Date getDate() {
		return date;
	}




	public void setDate(Date date) {
		this.date = date;
	}




	public double getTotal() {
		return total;
	}




	public void setTotal(double total) {
		this.total = total;
	}




	public int getClient() {
		return client;
	}




	public void setClient(int client) {
		this.client = client;
	}

	
	
	
}
