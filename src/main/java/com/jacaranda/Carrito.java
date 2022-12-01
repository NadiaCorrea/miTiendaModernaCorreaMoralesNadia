package com.jacaranda;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Carrito {


	private List<Item> listShopping;
	private LocalDateTime date_purchase;
	
	public void addItem(Item item) {
		boolean contiene=false;
		if(item!=null) {
			for (Item c : listShopping) {
				if(c.getMedicine().equals(item.getMedicine())) {
					c.setQuantity(item.getQuantity());
					c.setPrice(item.getMedicine().getPrice()*c.getQuantity());
//					item.getMedicine().setStock(item.getMedicine().getStock()-item.getQuantity());

					contiene=true;
					
				}
			}
			if(contiene==false) {
				
				listShopping.add(item);
//				item.getMedicine().setStock(item.getMedicine().getStock()-item.getQuantity());
				
				
			}
		}
	}
	public void vaciarCarrito(List<Item> lista) {
		lista.clear();
	}
	
	public boolean contieneMedicina(Medicine item) {
		boolean contiene=false;
		for (Item c : listShopping) {
			if(c.getMedicine().equals(item)) {
				contiene=true;
				
			}
		}
		return contiene;
	}

	public Carrito() {
		super();
		this.listShopping = new ArrayList<>();
		this.date_purchase=LocalDateTime.now();
		
	}
	
	public Carrito(List<Item> listShopping, LocalDateTime date_purchase) {
		super();
		this.listShopping = listShopping;
		this.date_purchase=date_purchase;
		this.date_purchase=LocalDateTime.now();
		
	}

	public List<Item> getListShopping() {
		return listShopping;
	}

	public void setListShopping(List<Item> listShopping) {
		this.listShopping = listShopping;
	}

	public LocalDateTime getDate_purchase() {
		return date_purchase;
	}

	public void setDate_purchase(LocalDateTime date_purchase) {
		this.date_purchase = date_purchase;
	}
}
