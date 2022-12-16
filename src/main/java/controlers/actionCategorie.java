package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.categorieDAO;
import entities.categorie;

/**
 * Servlet implementation class actionCategorie
 */
public class actionCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public actionCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession s = request.getSession(false);

		categorie c1 = new categorie();
		categorieDAO cdao = new categorieDAO();
		
		String source = (String) s.getAttribute("source");
		
		String action = request.getParameter("action");
				
		int result = 0;
		
		if(action != null) {	

			if(action.equals("Add")) {
				
				String cate = request.getParameter("categorie");
				c1.setName(cate);
				
				result = cdao.addcategorie(c1);
				request.getRequestDispatcher(source+"?result="+result).forward(request, response);
				
			}else if(action.equals("Delete")) {
				
				int id = Integer.parseInt(request.getParameter("id"));
				
				int  delete = cdao.deleteCategorieById(id);
				
				s.setAttribute("result", delete);
				
				result = delete;
				
				request.getRequestDispatcher(source+"?result="+result).forward(request, response);
				

			}else{
				
				response.sendRedirect(source);
				
			}
		}
	}

}
