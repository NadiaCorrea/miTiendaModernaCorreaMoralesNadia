package com.jacaranda;

public class Item {
	
	private int quantity;
	private Medicine medicine;
	private Double price;
	
	
	public Item(int quantity, Medicine medicine, Double price) {
		super();
		this.quantity = quantity;
		this.medicine = medicine;
		this.price = price*quantity;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public Medicine getMedicine() {
		return medicine;
	}


	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}
	
}
