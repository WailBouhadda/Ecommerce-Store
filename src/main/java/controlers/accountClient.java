package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.clientDAO;
import entities.client;

/**
 * Servlet implementation class accountClient
 */
public class accountClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public accountClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int res = 0;
		HttpSession ss = request.getSession();
		
		String source = (String) ss.getAttribute("source");
		
		clientDAO cdao = new clientDAO();
		client c = new client();
		
		if(request.getParameter("action") != null) {
			
			if(request.getParameter("action").equals("login")) {
				
				String email = request.getParameter("email");
				
				String password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(request.getParameter("password")); 
				
				System.out.println(password);
				
				c = cdao.login(email, password);

				
				if(c != null) {
					
					ss.setAttribute("client", c);
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
				}else {
					
					request.getRequestDispatcher("login.jsp?err="+-1).forward(request, response);
					
				}
			}else if(request.getParameter("action").equals("register")) {
				
				c.setFirstName(request.getParameter("firstName"));
				c.setLastName(request.getParameter("lastName"));
				c.setEmail(request.getParameter("email"));
				c.setPhone(request.getParameter("phone"));
				c.setPassword(org.apache.commons.codec.digest.DigestUtils.sha256Hex(request.getParameter("password")));
				
				
				
				if(cdao.login(c.getEmail(), c.getPassword()) == null) {
					
					client c2 = cdao.register(c);
					
					if(c2 != null) {
						
						ss.setAttribute("client", c2);
						request.getRequestDispatcher("index.jsp").forward(request, response);
						
					}else {
						
						request.getRequestDispatcher("register.jsp?err="+-1).forward(request, response);
					}
				}else {
					
					c = cdao.login(c.getEmail(), c.getPassword());

					
					if(c != null) {
						
						ss.setAttribute("client", c);
						request.getRequestDispatcher("index.jsp").forward(request, response);
						
					}else {
						
						request.getRequestDispatcher("register.jsp?err="+-1).forward(request, response);
						
					}
					
				}
				

			}else {
				
				response.sendRedirect(source+"?err="+-1);
			}
			
		}else{
			
			response.sendRedirect(source+"?err="+-1);
		}
		
	}

}
