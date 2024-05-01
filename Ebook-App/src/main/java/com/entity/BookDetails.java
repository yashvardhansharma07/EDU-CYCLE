package com.entity;

public class BookDetails {

	private int itemid;
	private String itemname;
	private String itemtypename;
	private String price;
	private String itemcategory; 
	private String status;
	private String photo;
	private String email;
	public BookDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDetails(String itemname, String itemtypename, String price, String itemcategory, String status,
			String photo, String email) {
		super();
		this.itemname = itemname;
		this.itemtypename = itemtypename;
		this.price = price;
		this.itemcategory = itemcategory;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getItemtypename() {
		return itemtypename;
	}
	public void setItemtypename(String itemtypename) {
		this.itemtypename = itemtypename;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getItemcategory() {
		return itemcategory;
	}
	public void setItemcategory(String itemcategory) {
		this.itemcategory = itemcategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "BookDetails [itemid=" + itemid + ", itemname=" + itemname + ", itemtypename=" + itemtypename
				+ ", price=" + price + ", itemcategory=" + itemcategory + ", status=" + status + ", photo=" + photo
				+ ", email=" + email + "]";
	}

	
	
}
