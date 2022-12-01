<%@page import="com.jacaranda.Item"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.jacaranda.Carrito"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrito Jsp</title>
<link rel="stylesheet" type="text/css" href="css/grid.css">
<link rel="stylesheet" type="text/css" href="css/styleTablePage.css">
</head>
<%String usuario = (String) session.getAttribute("usuario"); %>
<body>
<div class="header">
<form action="Volver.jsp" method="POST">
	<div class="izq">
			<button><img src="images/iconoSinFondo.png" width="120px" height="80px" id="logo"></button>
	</div>
	
	</form>
	
	
</div>
	    <img src='images/user.png' width='20px' height='20px'>: <%=usuario %>
<hr>
<div class="grid-container">
<!-- <form action="" method="POST"> -->
<form action="AddPurchase" method="POST">
<%
	Carrito c=(Carrito) session.getAttribute("carrito");
if(c==null){
	response.sendRedirect("error.jsp");
	
}else{
	

	Iterator<Item> iterador = c.getListShopping().iterator();

while(iterador.hasNext()){%>
<%Item it = iterador.next(); %>
        <div class="card">
            <div class="titulo">
                <h1>Medicina: </h1>
            </div>
            <div class="texto"><p align="center"><b>Nombre:</b> <%=it.getMedicine().getName() %><br>
            <b>Cantidad </b>
            <input type="number" name="<%=it.getMedicine().getName() %>" id="cantidad" min=1 max=50 value=<%=it.getQuantity()%>><br>
			<b>Precio Unidad:</b>
			  <%=it.getMedicine().getPrice() %></p>
            <hr>
           <p align="right"> <b>Precio total:</b>
             <%=it.getPrice() %></p></div>
        </div>
        <%} %>
        
 </div>
        <div class="botones">
        <button type="submit" name="add" id='add'>Buy now</button></a></form>
        <a href="vaciarCarrito.jsp"><button type="submit" name="add" id='add'>Vaciar carrito</button></a></div>
<%} %>


</body>
</html>