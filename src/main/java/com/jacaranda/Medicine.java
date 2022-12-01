package com.jacaranda;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.mysql.cj.jdbc.Blob;

@Entity
public class Medicine {
	@Id
	private Integer id;
	private String name;
	private String description;
	private Double price;
	private Integer stock;
	@ManyToOne
	@JoinColumn (name="category")
	private Category category;
	


	
	
	public Medicine() {
		
	}
	
	public Medicine(Integer id, String name, String description, Double price,Category category) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.category=category;
		
	}
	public Medicine(Integer id, String name, String description, Double price,Category category,Integer stock) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.category=category;
		this.stock=stock;
		
	}
	public Medicine( String name, String description, Double price,Category category) {
		super();
		this.name = name;
		this.description = description;
		this.price = price;
		this.category=category;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
}
