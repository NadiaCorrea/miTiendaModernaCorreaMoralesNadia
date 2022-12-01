package com.jacaranda;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class CRUDPurchase {
	public static ArrayList<purchase> getPurchases(String u){
		Session session = Conn.getSession();
		
		Query<purchase> query = session.createQuery("SELECT p FROM com.jacaranda.purchase p WHERE user='" + u+ "'ORDER BY purchase_date DESC");
		ArrayList<purchase> purchases = (ArrayList<purchase>) query.getResultList();
		
		return purchases;
		
}
	public static void restarCantidad(purchase p) throws Exception {
		if((p.getMedicine().getStock()!=null && p.getMedicine().getStock()>=p.getCuantity()) && (p.getMedicine().getStock()>0)) {
			p.getMedicine().setStock(p.getMedicine().getStock()-p.getCuantity());
			
		}else {
			throw new Exception("No hay suficiente stock");
		}
	}
}
