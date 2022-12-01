package com.jacaranda;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class CRUDCategory {
	public static List<Category> getCategoriasNoRepetidas() {
			List<Category> listaFinal = new ArrayList<Category>();
		   Session session= Conn.getSession();
		   Query<Category> query = session.createQuery("SELECT p FROM com.jacaranda.Category p");
		   ArrayList<Category> listCategory = (ArrayList<Category>) query.getResultList();
		   for (Category c: listCategory) {
			   	if (!listaFinal.contains(c.getName())) {
			   		listaFinal.add(c);
			   	}
		   }
			return listaFinal;
		}
	public static Category getCategory(Integer id ) {
		Session session = Conn.getSession();
		Category Category = (Category) session.get(Category.class,id);
		return Category;
	}
}
