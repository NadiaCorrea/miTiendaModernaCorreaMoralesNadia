package com.jacaranda;

import org.hibernate.Session;

public class CRUDCarrito {

	public static boolean savePurchase(purchase m) {
		boolean resultado=false;
		Session session = Conn.getSession();
		
		try {
			
			session.getTransaction().begin();
			session.saveOrUpdate(m);
			session.getTransaction().commit();
			
			
			resultado=true;			
			
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return resultado;
	}
}
