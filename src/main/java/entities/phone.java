package entities;


import java.sql.Date;

public class phone {
	
	
	private int id;
	private String name;
	private String image;
	private String details;
	private Date date;
	private double price;
	private int quantity;
	private int categorie;

	
	

	public int getCategorie() {
		return categorie;
	}




	public void setCategorie(int categorie) {
		this.categorie = categorie;
	}




	public phone() {
		// TODO Auto-generated constructor stub
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getImage() {
		return image;
	}




	public void setImage(String image) {
		this.image = image;
	}




	public String getDetails() {
		return details;
	}




	public void setDetails(String details) {
		this.details = details;
	}




	public Date getDate() {
		return date;
	}




	public void setDate(Date date) {
		this.date = date;
	}




	public double getPrice() {
		return price;
	}




	public void setPrice(double price) {
		this.price = price;
	}




	public int getQuantity() {
		return quantity;
	}




	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
	

}
