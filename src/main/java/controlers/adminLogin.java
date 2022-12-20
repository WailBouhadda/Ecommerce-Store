package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.clientDAO;
import entities.admin;
import entities.client;

/**
 * Servlet implementation class adminLogin
 */
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int res = 0;
		HttpSession ss = request.getSession();
		
		String source = (String) ss.getAttribute("source");
		
		clientDAO cdao = new clientDAO();
		admin admin = new admin();
		
		if(request.getParameter("action")!=null) {
			
			if(request.getParameter("action").equals("login")) {
				
				String email = request.getParameter("email");
				
				String password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(request.getParameter("password")); 
				
				System.out.println(password);
				
				admin = cdao.adminLogin(email, password);
	
				
				if(admin != null) {
					
					ss.setAttribute("admin", admin);
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
				}else {
					
					request.getRequestDispatcher("login.jsp?err="+-1).forward(request, response);
					
				}
			}else if(request.getParameter("action").equals("Logout")) {
				
				HttpSession session=request.getSession(false);
				session.removeAttribute("admin");
				session.invalidate();
				response.sendRedirect("Login");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("login.jsp?err="+-1).forward(request, response);

		}
	}

}
