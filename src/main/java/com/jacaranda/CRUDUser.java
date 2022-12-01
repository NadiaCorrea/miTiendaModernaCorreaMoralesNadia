package com.jacaranda;

import java.time.LocalDate;

import org.hibernate.Session;
import org.hibernate.query.Query;



public class CRUDUser {
	
	public static boolean saveUser(Users user) {
		boolean resultado=false;
		Session session = Conn.getSession();
		
		try {
			
			session.getTransaction().begin();
			session.saveOrUpdate(user);
			session.getTransaction().commit();			
			resultado=true;			

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return resultado;
	}

}
