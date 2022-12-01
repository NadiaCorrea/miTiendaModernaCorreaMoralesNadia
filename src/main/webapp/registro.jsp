<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro</title>
 <link rel="stylesheet" type="text/css" href="css/mvp.css">
</head>




<body background="images/fondo.png">
	<div id="container">
    	<a href="Index.jsp"><img src="images/iconoSinFondo.png" width="200px" height="150px" id="logo"></a>
    	
    	<div id="registro">
    	</div>
    
                     
        <div id="centroLogin" align="center">
     	
        	<form action="Register"  method="post">
            	<h1 id="titulo">Bienvenido a Registro</h1>
            	
	            <label>Username:</label>
	            <input type="text" required name="username" id="username" required> 
	            
 				<label>Password:</label>
	            <input type="password" required name="passwordR" id="passwordR" minlength="6" required> 
	            
	            <label>Fist Name:</label>
	            <input type="text" required name="first" id="first" required>

	            <label>Last Name:</label>
	            <input type="text" required name="last" id="last" required> 
	            
	            <label>Birthday:</label>
	            <input type="date" required name="birth" id="birth"> 
	            
	            <label>Gender:</label>
	            Hombre<input type="radio" required name="gender" id="gender" value="H" required> 
	            Mujer <input type="radio" required name="gender" id="gender" value="F"> 
	            
	            <input type="hidden" name="admin" id="admin" value="0">
	            
	           
                <p>  <input type="submit" id="Enviar" value="Enviar"> <a href="Index.jsp"><b>Volver</b></a></p>
          	</form>
       	</div>
   	</div>



</body>
</html>