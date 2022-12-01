package com.jacaranda;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;

import org.hibernate.query.Query;
import org.hibernate.Session;

public class UtilUsers {
	// Obtiene un usuario en concreto partiendo del parametro name.
		public static Users getUser(String name ) {
			Session session = Conn.getSession();
				
			Users user = (Users) session.get(Users.class,name);
			return user;
			
		}
		
		// Obtiene una lista con los usuarios
		public static ArrayList<Users> getUsers(){
			Session session = Conn.getSession();
			
			Query<Users> query = session.createQuery("SELECT p FROM com.jacaranda.User p");
			ArrayList<Users> users = (ArrayList<Users>) query.getResultList();
			
			return users;
		}
		
		  //Comprueba si el usuario es valido en nuestra base de datos.
		public static boolean userIsValid(String name, String pass) {
		    boolean valid = false;
		    String passEncriptada = EncriptarMD5.getMD5(pass);
			try {
				
			    Session session = Conn.getSession();
			    Query<Users> query = session.createQuery("SELECT p FROM com.jacaranda.Users p WHERE user='" + name + "'and password='"+passEncriptada+"'",Users.class);
			    if(!query.getResultList().isEmpty()) {
			        valid = true;
			    
			    }
			}catch(Exception e) {
			    System.out.println(e.getMessage());
			}
			return valid;
		}
		
		public static boolean userAdminIAdmin(String name, String pass) {
		    boolean valid = false;
		    String passEncriptada = EncriptarMD5.getMD5(pass);
			try {
				
			    Session session = Conn.getSession();
			    Query<Users> query = session.createQuery("SELECT p FROM com.jacaranda.Users p WHERE user='" + name + "'and password='"+passEncriptada+"'and admin='"+1+"'",Users.class);
			    if(!query.getResultList().isEmpty()) {
			        valid = true;
			    
			    }
			}catch(Exception e) {
			    System.out.println(e.getMessage());
			}
			return valid;
		}
		
		
		 public static int calculateAge(LocalDate birthDate, LocalDate currentDate) {
		        if ((birthDate != null) && (currentDate != null)) {
		            return Period.between(birthDate, currentDate).getYears();
		        } else {
		            return 0;
		        }
		    }
		
		
		private String paginaError() {
			return "<!DOCTYPE html>\n"
					+ "<html>\n"
					+ "<head>\n"
					+ "<meta charset=\"ISO-8859-1\">\n"
					+ "<title>Error 404</title>\n"
					+ "		<link rel=\"stylesheet\" type=\"text/css\" href=\"css/error.css\">\n"
					+ " \n"
					+ "</head>\n"
					+ "<body background=\"images/errorPagina.png\">\n"
					+ "      <a href=\"Login.jsp\"><img src=\"images/iconoSinFondo.png\" width=\"160px\" height=\"120px\" id=\"logo\"></a> \n"
					+ "            <hr>\n"
					+ "            <div id=\"izq\">\n"
					+ "                \n"
					+ "                <img src=\"images/error.png\" id=\"iconoError\">\n"
					+ "            </div>\n"
					+ "            <div id=\"der\">\n"
					+ "                <h1 id=\"TextoGrande\"><FONT color=\"black\">¡Contacte al administrador!</FONT></h1>\n"
					+ "                <h3 id=\"TextoChico\"><FONT color=\"black\">No hemos podido encontrar<br> la página que buscas.</FONT></h3>\n"
					+ "                <h7 id=\"codError\">Codigo de error: 303</h7>\n"
					+ "            </div>\n"
					+ "</body>\n"
					+ "</html>\n"
					+ "</html>";
		}

		
		
		
	
}
