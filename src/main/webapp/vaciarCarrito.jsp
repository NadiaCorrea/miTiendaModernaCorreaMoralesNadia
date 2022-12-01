<%@page import="com.jacaranda.Carrito"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Carrito c = (Carrito) session.getAttribute("carrito");
c.vaciarCarrito(c.getListShopping());
response.sendRedirect("Carrito.jsp");



%>

</body>
</html>