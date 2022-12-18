package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import dao.phoneDAO;
import entities.cart;
import entities.phone;

/**
 * Servlet implementation class removeFromCart
 */
public class removeFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeFromCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		HttpSession s = request.getSession();
		phoneDAO pdao = new phoneDAO();
		String source = (String)s.getAttribute("source");
		

		
		if(request.getParameter("id") != null) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			cart c = (cart)s.getAttribute("cart");
			
			Integer product[] = new Integer[2];
			
			phone p = pdao.getPhoneById(id);
			
			double Total = c.getTotal(); 
			int quantity = 0;
			ArrayList<Integer[]> products = new ArrayList<Integer[]>();
			
			
			for(Integer[] pro : c.getProducts()) {
				if(pro[0] == id) {
					quantity = pro[1];
					
				}else {
					products.add(pro);
				}
			}
			
			
			
			
			
			Total = c.getTotal() - (p.getPrice() * quantity);
			
						
			c.setProducts(products);			
			c.setTotal(Total);
			
			s.setAttribute("cart", c);
			
			response.sendRedirect(source);
			
		}
		
	}

}
