package com.jacaranda.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.CRUDCategory;
import com.jacaranda.CRUDMedicine;
import com.jacaranda.Category;
import com.jacaranda.Medicine;

/**
 * Servlet implementation class AddMedicineMethod
 */
@WebServlet("/AddMedicineMethod")
public class AddMedicineMethod extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMedicineMethod() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append(paginaError());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Recupero la session
		HttpSession session = request.getSession();
		String usuario = (String) session.getAttribute("usuario");
	  	String password = (String) session.getAttribute("password");
	  	 if(usuario==null && password==null) { //Compruebo si este es nulo, para meter página de error
	  		response.getWriter().append(paginaError());
	  	 }else { //Si no, realizo todo proceso
	  		 ServletContext context = this.getServletContext();
	  		 RequestDispatcher dispacher = context.getRequestDispatcher("/ListMedicine");
	  		 List<Integer> listId = CRUDMedicine.getIdMax(); //Obtengo el id máximo de la base de datos para incrementarle 1
	  		 Integer id = listId.get(0);
	  		 String name=null;
	  		 String description=null;
	  		 Double price=null;
	  		 Integer category=null;
	  		 Category cat=null;
	  		 Integer stock = null;

	  		 
	  		 try { //Capturo todos los valores de los inputs, y sus excepciones, si estas se producen
	  			 name = String.valueOf(request.getParameter("nameProduct"));
	  			 description = String.valueOf(request.getParameter("descriptionProduct"));
	  			 price = Double.valueOf(request.getParameter("priceProduct"));
	  			 category = Integer.valueOf(request.getParameter("category"));
	  			 cat = CRUDCategory.getCategory(category);
	  			 stock = Integer.valueOf(request.getParameter("stock"));
	  			 
	  			 //Si estos campos no son nulos o no estan vacios, realizo el guardado de la medicina
	  			 if((name!=null && !name.isEmpty()) && (description!=null && !description.isEmpty())
		  				 && (price!=null && !price.isNaN()) && (category!=null) && (cat!=null) && (stock!=null)) {
		  			 if (CRUDMedicine.getMedicineName(name).isEmpty()){
		  				 
		  				 //Creo que la medicina e incremento el id maximo, 1 más, de esta forma se aumenta solo
		  				 Medicine m = new Medicine(id+1,name,description, price, cat,stock);
		  				 CRUDMedicine.saveMedicine(m);	
		  				 dispacher.forward(request, response);
		  				 
		  			 }
		  			 
		  		 }
	  		 }catch (Exception e) {
				response.getWriter().append(paginaErrorNoAnnadir()); //Si no, lanzo pagina de error
			}
	  		 
	  		
	  		 
	  		 
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
				+ "      <a href=\"ListMedicine?\"><img src=\"images/iconoSinFondo.png\" width=\"160px\" height=\"120px\" id=\"logo\"></a> \n"
				+ "            <hr>\n"
				+ "            <div id=\"izq\">\n"
				+ "                \n"
				+ "                <img src=\"images/error.png\" id=\"iconoError\">\n"
				+ "            </div>\n"
				+ "            <div id=\"der\">\n"
				+ "                <h1 id=\"TextoGrande\"><FONT color=\"black\">Â¡Vaya!</FONT></h1>\n"
				+ "                <h3 id=\"TextoChico\"><FONT color=\"black\">Ha ocurrido un error no puedes acceder aqui <br> Pulse en el icono para ir al login.</FONT></h3>\n"
				+ "                <h7 id=\"codError\">Codigo de error: 303 </h7>\n"
				+ "            </div>\n"
				+ "</body>\n"
				+ "</html>\n"
				+ "</html>";
	}

	private String paginaErrorNoAnnadir() {
		return "<!DOCTYPE html>\n"
				+ "<html>\n"
				+ "<head>\n"
				+ "<meta charset=\"ISO-8859-1\">\n"
				+ "<title>Error 404</title>\n"
				+ "		<link rel=\"stylesheet\" type=\"text/css\" href=\"css/error.css\">\n"
				+ " \n"
				+ "</head>\n"
				+ "<body background=\"images/errorPagina.png\">\n"
				+ "      <a href=\"ListMedicine?\"><img src=\"images/iconoSinFondo.png\" width=\"160px\" height=\"120px\" id=\"logo\"></a> \n"
				+ "            <hr>\n"
				+ "            <div id=\"izq\">\n"
				+ "                \n"
				+ "                <img src=\"images/error.png\" id=\"iconoError\">\n"
				+ "            </div>\n"
				+ "            <div id=\"der\">\n"
				 + "                <h1 id=\"TextoGrande\"><FONT color=\"black\">Â¡Vaya no se puede aÃ±adir!</FONT></h1>\n"
					 + "                <h3 id=\"TextoChico\"><FONT color=\"black\">Ha ocurrido un error al aÃ±adir la medicina <br> Pulse en el icono para ir al login.</FONT></h3>\n"
					 + "                <h7 id=\"codError\">Codigo de error: 404 (Ese nombre ya existe)</h7>\n"
				+ "            </div>\n"
				+ "</body>\n"
				+ "</html>\n"
				+ "</html>";
	}

}
