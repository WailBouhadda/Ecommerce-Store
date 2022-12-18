package entities;

import java.sql.Date;
import java.util.*;

public class order {
	
	
	private int id;
	private String country;
	private String adress;
	private String zipcode;
	private ArrayList<Integer[]> products;
	private Date date;
	private double total;
	private String note;
	
	public String getCountry() {
		return country;
	}




	public void setCountry(String country) {
		this.country = country;
	}




	public String getAdress() {
		return adress;
	}




	public void setAdress(String adress) {
		this.adress = adress;
	}




	public String getZipcode() {
		return zipcode;
	}




	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}




	public String getNote() {
		return note;
	}




	public void setNote(String note) {
		this.note = note;
	}




	private int client;
	
	
	

	public order() {
		// TODO Auto-generated constructor stub
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public ArrayList<Integer[]> getProducts() {
		return products;
	}




	public void setProducts(ArrayList<Integer[]> products) {
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
