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
ServletContext context = this.getServletContext();
	  		 RequestDispatcher dispacher = context.getRequestDispatcher("/ListMedicine");
	  		 dispacher.forward(request, response);
	  		%>

</body>
</html>