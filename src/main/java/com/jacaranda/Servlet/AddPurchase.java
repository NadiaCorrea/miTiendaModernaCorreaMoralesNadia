package com.jacaranda.Servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.CRUDCarrito;
import com.jacaranda.CRUDPurchase;
import com.jacaranda.Carrito;
import com.jacaranda.Item;
import com.jacaranda.Users;
import com.jacaranda.UtilUsers;
import com.jacaranda.purchase;

/**
 * Servlet implementation class AddPurchase
 */
@WebServlet("/AddPurchase")
public class AddPurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPurchase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append(ListMedicine.paginaError()); //Pagina de error en caso de acceder por GET
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Recupero la session
		HttpSession session = request.getSession();
		 ServletContext context = this.getServletContext();
  		 RequestDispatcher dispacher = context.getRequestDispatcher("/ListMedicine");
		Carrito c = (Carrito) session.getAttribute("carrito"); //Recupero el carrito para a�adir los productos
		
		//el carrito no es null pero está vacío (NC)
		
		if(c==null || c.getListShopping().size() <= 0) { //Si el carrito es nulo, en caso de error, lanzo la p�gina de error
			response.sendRedirect("error.jsp");
		}else {//Si esta correctamente recorro la lista de Items
			
		//el carrito no es null pero está vacío 
		Iterator<Item> iterador = c.getListShopping().iterator();
		
		String name = (String) session.getAttribute("usuario"); //Obtengo el nombre del usuario para asignarle la compra
		Users usuario = UtilUsers.getUser(name); //Recupero el usuario con el metodo de buscar usuario por nombre
		while(iterador.hasNext()){
			Item it = iterador.next();
			Integer cantidad = Integer.valueOf(request.getParameter(it.getMedicine().getName()));
			purchase p = new purchase(it.getMedicine(),usuario,LocalDateTime.now(),it.getMedicine().getPrice()*cantidad,cantidad);
				try {
					CRUDPurchase.restarCantidad(p);
					CRUDCarrito.savePurchase(p);
					c.vaciarCarrito(c.getListShopping());
					
					dispacher.forward(request, response);
				} catch (Exception e) {
					
					response.getWriter().append(paginaError());
				}
			
			
			
		}
		}
		
	}
	public static String paginaError() {
		return "<!DOCTYPE html>\n"
				+ "<html>\n"
				+ "<head>\n"
				+ "<meta charset=\"ISO-8859-1\">\n"
				+ "<title>Error 404</title>\n"
				+ "		<link rel='stylesheet' type='text/css' href='css/error.css'>"
				+ " \n"
				+ "</head>\n"
				+ "<body background='images/errorPagina.png'>"
				+ "<form action=\"ListMedicine\" method=\"post\">\r\n"
				+ "			<button><img src=\"images/iconoSinFondo.png\" width=\"120px\" height=\"80px\" id=\"logo\"></button>\r\n"
				+ "	</form>"
				+ "            <hr>\n"
				+ "            <div id=\"izq\">\n"
				+ "                \n"
				+ "                <img src=\"images/error.png\" id=\"iconoError\">\n"
				+ "            </div>\n"
				+ "            <div id=\"der\">\n"
				+ "                <h1 id=\"TextoGrande\"><FONT color=\"black\">�Vaya!</FONT></h1>\n"
				+ "                <h3 id=\"TextoChico\"><FONT color=\"black\">No hay suficiente stock<br> Pulse en el icono para ir devuelta al listado.</FONT></h3>\n"
				+ "                <h7 id=\"codError\">Codigo de error: 303</h7>\n"
				+ "            </div>\n"
				+ "</body>\n"
				+ "</html>\n"
				+ "</html>";
	}

}
