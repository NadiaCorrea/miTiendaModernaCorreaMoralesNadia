package com.jacaranda;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
/**
 * Clase con la que realizaremos la conexi�n a base de datos.
 */

public class Conn {

	private static StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
	private static SessionFactory sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
	private static Session session = sf.openSession();
	
	public static Session getSession() {	
		return session;
	}
	
	
}
