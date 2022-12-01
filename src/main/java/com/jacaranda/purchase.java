package com.jacaranda;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@IdClass(purchase_id.class)
public class purchase {
	@Id
	@ManyToOne
	@JoinColumn(
			name="idMedicine", insertable = false, updatable=false
			)
	private Medicine idMedicine;
	@Id
	@ManyToOne
	@JoinColumn(
			name="user", insertable = false, updatable=false
			)
	private Users user;
	@Id
	private LocalDateTime purchase_date;
	private Double purchase_price;
	private int cuantity;
	
	public purchase() {
		
	}
	
	
	public purchase(Medicine medicine, Users user, LocalDateTime purchase_date, Double purchase_price, int cuantity) {
		super();
		this.idMedicine = medicine;
		this.user = user;
		this.purchase_date = purchase_date;
		this.purchase_price = purchase_price;
		this.cuantity = cuantity;
	}
	
	public Medicine getMedicine() {
		return idMedicine;
	}
	public void setMedicine(Medicine medicine) {
		this.idMedicine = medicine;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public LocalDateTime getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(LocalDateTime purchase_date) {
		this.purchase_date = purchase_date;
	}
	public Double getPurchase_price() {
		return purchase_price;
	}
	public void setPurchase_price(Double purchase_price) {
		this.purchase_price = purchase_price;
	}
	public int getCuantity() {
		return cuantity;
	}
	public void setCuantity(int cuantity) {
		this.cuantity = cuantity;
	}
	
	
	
	
	
}
