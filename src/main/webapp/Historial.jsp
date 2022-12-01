<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.jacaranda.CRUDPurchase"%>
<%@page import="com.jacaranda.purchase"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Historial</title>
<link rel='stylesheet' type='text/css' href='css/styleTablePage.css'>
<link rel='stylesheet' type='text/css' href='css/styles.css'>
</head>
<%String usuario = (String) session.getAttribute("usuario"); %>
<body>
<div id="header">
	<form action="ListMedicine" method="post">
			<button><img src="images/iconoSinFondo.png" width="120px" height="80px" id="logo"></button>
	</form>

    	
</div>
<img src='images/user.png' width='20px' height='20px'>: <%=usuario %>
<hr>
<%

List<purchase> listPurchase = CRUDPurchase.getPurchases(usuario);

Iterator<purchase> iterador = listPurchase.iterator();%>
<table border=2>
<tr>
	<th>Medicina: </th>
	<th>Fecha de compra: </th>
	<th>Usuario de compra: </th>
	<th>Cantidad: </td>
	<th>Precio final: </th>
</tr>
<% while(iterador.hasNext()){
purchase p = iterador.next(); %>
<tr>
	<td><%=p.getMedicine().getName() %></td>
	<td><%=DateTimeFormatter.ISO_LOCAL_DATE.format(p.getPurchase_date())+ "  " + DateTimeFormatter.ISO_LOCAL_TIME.format(p.getPurchase_date()) %> </td>
	<td><%=p.getUser().getUser() %></td>
	<td><%=p.getCuantity() %></td>
	<td><%=p.getPurchase_price() %></td>
</tr>
<%}%>
</table>

</body>
</html>