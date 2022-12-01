<%@page import="java.util.List"%>
<%@page import="com.jacaranda.Category"%>
<%@page import="com.jacaranda.CRUDCategory"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<%
 	 String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("usuario");
	
	if(isSession == null && userSession == null){
		response.sendRedirect("error.jsp?msg=No tienes permisos, haz login.");
	} 
	 
	
%>

<div id="header">
	<form action="ListMedicine" method="post">
			<button><img src="images/iconoSinFondo.png" width="120px" height="80px" id="logo"></button>
	</form>

    	
</div>
	<div id="addElement">
	<form action="AddMedicineMethod" method="Post">
	<fieldset style="width:400px">
	<legend><h1>Add Product</h1></legend>
		<label><b>Name:</b></label><br>
		<input type="text" name="nameProduct" required><br><br>
		<label><b>Description</b></label><br>
		<textarea name="descriptionProduct"  cols="40" rows="5" required></textarea><br><br>
		<label><b>Price</b></label><br>
		<input type="number" step="any" name="priceProduct" required><br><br>
		<label><b>Stock</b></label><br>
		<input type="number" name="stock" required><br><br>
		<!-- <label><b>Image</b></label><br>
		<input type="file" name="fileProduct" ><br><br> -->
		<label><b>Category:</b></label><br>
		<select name="category">
		<%
		List<Category> listcategory = CRUDCategory.getCategoriasNoRepetidas();
		Iterator<Category> iterador = listcategory.iterator();
		while (iterador.hasNext()){
			Category cat = iterador.next();%>
			<option value="<%=cat.getIdCat()%>"><%=cat.getName() %></option>
		<%}
		%>	
		</select>
		<br>
		<br>
		<input type="submit" id="button" name="send" value="Send">
		</fieldset>
		
	</form>	
	</div>

	

</body>
</html>