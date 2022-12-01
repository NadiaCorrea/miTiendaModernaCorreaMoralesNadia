<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%session.invalidate(); %>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
		<title>Login</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        
</head>
<body background="images/fondo.png">
	<div id="container">
    	<img src="images/iconoSinFondo.png" width="200px" height="150px" id="logo">
    	
    	<div id="registro">
    	</div>
    
                     
        <div id="centroLogin">
     
        	<form action="ListMedicine"  method="post">
            	<h1 id="titulo">Bienvenido</h1>
				<%
				//Se comprueba si existe la variable error que vendría true del checkLogin si algun campo fuese incorrecto
				String messageLog = request.getParameter("msg_error");
				if(messageLog!=null){
				%>
					<div>
						<span>El usuario o la contraseña son incorrectos</span>
					</div>
				<%}%>
			
				<!--Formulario de login que enviará la información a checkLogin.jsp y hará las comprobaciones-->
			
	            <p id="textoUser">Usuario:
	            <input type="text" required name="user" id="user"> <img src="images/user.png" id="userLogo"></p>
	            
	            <p id="textoContrasena">Contraseña: 
	            <input type="password" required name="password" id="password"> <img src="images/password.png" id="passLogo"></p>
	           
                <p><a href="registro.jsp" id="link"><b>Registrate Aquí</b></a>  <input type="submit" id="Enviar" value="Enviar"></p>
          	</form>
       	</div>
   	</div>

</body>
</html>

</body>
</html>