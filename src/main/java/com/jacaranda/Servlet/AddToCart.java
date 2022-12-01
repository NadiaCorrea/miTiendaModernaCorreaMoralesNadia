package com.jacaranda.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.CRUDMedicine;
import com.jacaranda.Carrito;
import com.jacaranda.Item;
import com.jacaranda.Medicine;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
	
 		int cant = Integer.valueOf(request.getParameter("cant"));
		Integer id = Integer.valueOf(request.getParameter("annadirCarro"));
		Medicine m = CRUDMedicine.getMedicineId(id).get(0);
		Item i = new Item(cant, m,m.getPrice()); 
		
		Carrito c = (Carrito) session.getAttribute("carrito");
		if(c==null) {
			c= new Carrito();
		}
		c.addItem(i);
		response.sendRedirect("Carrito.jsp");
	}

}
