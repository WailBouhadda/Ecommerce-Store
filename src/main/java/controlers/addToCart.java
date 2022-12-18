package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import dao.phoneDAO;
import entities.cart;
import entities.phone;

/**
 * Servlet implementation class addToCart
 */
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession s = request.getSession();
		
		String source = (String)s.getAttribute("source");
		
		
		cart c = null;
		
		if(s.getAttribute("cart") != null) {
			
			c = (cart)s.getAttribute("cart");
		}
		
		
		if(request.getParameter("id") != null) {
			
			Integer product[] = new Integer[2];
			
			double Total = 0; 
			
			product[0] = Integer.parseInt(request.getParameter("id"));
			product[1] = Integer.parseInt(request.getParameter("quantity"));
			
			
			phoneDAO pdao = new phoneDAO();
			phone p = pdao.getPhoneById(product[0]);
			
			Total = (p.getPrice() * product[1]) + c.getTotal();
			ArrayList<Integer[]> products = new ArrayList<Integer[]>();
			products = c.getProducts();
			products.add(product);
			
			c.setProducts(products);			
			c.setTotal(Total);
			
			s.setAttribute("cart", c);
			
			response.sendRedirect(source);
			
		}
	}

}
