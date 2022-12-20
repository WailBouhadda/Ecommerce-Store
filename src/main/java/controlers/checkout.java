package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import dao.clientDAO;
import dao.orderDAO;
import entities.cart;
import entities.client;
import entities.order;

/**
 * Servlet implementation class checkout
 */
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int res = 0;
		HttpSession s = request.getSession();
		
		clientDAO cdao = new clientDAO();
		client c = new client();
		
		orderDAO odao = new orderDAO();
		order o = new order();
		

		
		if(request.getParameter("placeorder") != null) {
			
			String email = request.getParameter("email");
			
			String password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(request.getParameter("password")); 
			
			System.out.println(password);
			
			c = cdao.login(email, password);

			
			if(c != null) {
				
				cart cart = (cart)s.getAttribute("cart");
				
				ArrayList<Integer[]> products = new ArrayList<Integer[]>();
				
				o.setCountry(request.getParameter("country"));
				o.setAdress(request.getParameter("adress"));
				o.setZipcode(request.getParameter("zipcode"));
				o.setNote(request.getParameter("note"));
				o.setClient(c.getId());
				o.setTotal(cart.getTotal());
				o.setProducts(cart.getProducts());
				
				
				res = odao.addOrder(o);
				
				cart.setProducts(products);			
				cart.setTotal(0);
				
				s.setAttribute("cart", cart);
				
				request.getRequestDispatcher("index.jsp?res="+res).forward(request, response);
				
			}else {
				
				request.getRequestDispatcher("login.jsp?err="+-1).forward(request, response);
				
			}
			
		}else{
			request.getRequestDispatcher("login.jsp?err="+-2).forward(request, response);
		}
	
	}

}
