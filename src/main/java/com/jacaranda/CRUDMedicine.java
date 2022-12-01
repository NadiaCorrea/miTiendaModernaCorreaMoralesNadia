package com.jacaranda;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class CRUDMedicine {
//	public static ArrayList<Medicine> getMedicine(Category c){
//		Session session = Conn.getSession();
//		
//		ArrayList<Medicine> list = (ArrayList<Medicine>) c.getListMedicine();
//		
//		
//		return list;
//	}
//	
//	public static ArrayList<Medicine> getMedicines() {
//		Session session = Conn.getSession();
//		String hql = "SELECT id, name, description, price, category FROM Medicine a";
//		Query<Medicine> query = session.createNativeQuery(hql, Medicine.class);
//		ArrayList<Medicine> listMedicines = (ArrayList<Medicine>) query.getResultList();
//		return listMedicines;          
//	}
	
	
	
	public  static boolean  deleteBrand(Medicine m) {
		boolean resultado= false;
		Session session =Conn.getSession();
		
		try {
			
			session.getTransaction().begin();
			session.delete(m);
			session.getTransaction().commit();;
			resultado=true;
			
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
		return resultado;
	}
	
	public static boolean saveMedicine(Medicine m) {
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
	
	public static List<Medicine> getMedicines() {
	   Session session= Conn.getSession();
	   Query<Medicine> query = session.createQuery("SELECT p FROM com.jacaranda.Medicine p");
	   ArrayList<Medicine> listMedicina = (ArrayList<Medicine>) query.getResultList();
		return listMedicina;
	}
	public static List<Medicine> getMedicineName(String name) {
		   Session session= Conn.getSession();
		   Query<Medicine> query = session.createQuery("SELECT p FROM com.jacaranda.Medicine p WHERE name='" + name+ "'");
		   ArrayList<Medicine> listMedicina = (ArrayList<Medicine>) query.getResultList();
			return listMedicina;
		}
	
	public static List<Medicine> getMedicineId(Integer id) {
		   Session session= Conn.getSession();
		   Query<Medicine> query = session.createQuery("SELECT p FROM com.jacaranda.Medicine p WHERE id='" + id+ "'");
		   ArrayList<Medicine> listMedicina = (ArrayList<Medicine>) query.getResultList();
			return listMedicina;
		}
	public static List<Integer> getIdMax() {
		   Session session= Conn.getSession();
		   Query<Integer> query = session.createQuery("SELECT MAX(id) FROM com.jacaranda.Medicine p ");
		   ArrayList<Integer> listMedicina = (ArrayList<Integer>) query.getResultList();
			return listMedicina;
		}
}
