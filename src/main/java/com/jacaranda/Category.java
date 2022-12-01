package com.jacaranda;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@Column(name="id")
	private Integer idCat;
	private String name;
	private String description;
	
	@OneToMany(mappedBy="category", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Medicine> listMedicine;
	
	public Category() {
		
	}
	
	public Category(Integer id, String name, String description) {
		super();
		this.idCat = id;
		this.name = name;
		this.description = description;
		listMedicine=null;
	}

	public Integer getIdCat() {
		return idCat;
	}

	public void setIdCat(Integer idCat) {
		this.idCat = idCat;
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

	public List<Medicine> getListMedicine() {
		return listMedicine;
	}

	public void setListMedicine(List<Medicine> listMedicine) {
		this.listMedicine = listMedicine;
	}



	
	
	
	
}
