package com.jacaranda;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity (name = "Users")
public class Users {
	@Id
	private String user;
	private String password;
	private int admin;
	private String name;
	private String surname;
	private LocalDate birthday;
	private String gender;
	
	

//CONSTRUCTOR
public Users() {
	
}
public Users(String user, String pass, int admin, String namePerson, String surname, LocalDate fecha,
		String genero) {
	super();
	this.user = user;
	this.password = pass;
	this.admin = admin;
	this.name = namePerson;
	this.surname = surname;
	this.birthday = fecha;
	this.gender = genero;
}

//GETTERS AND SETTERS
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getPass() {
	return password;
}
public void setPass(String pass) {
	this.password = pass;
}
public int isAdmin() {
	return admin;
}
public void setAdmin(int admin) {
	this.admin = admin;
}
public String getNamePerson() {
	return name;
}
public void setNamePerson(String namePerson) {
	this.name = namePerson;
}
public String getSurname() {
	return surname;
}
public void setSurname(String surname) {
	this.surname = surname;
}
public LocalDate getFecha() {
	return birthday;
}
public void setFecha(LocalDate fecha) {
	this.birthday = fecha;
}
public String getGenero() {
	return gender;
}
public void setGenero(String genero) {
	this.gender = genero;
}



}
