package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.categorybean;
import bean.productbean;
import bo.categorybo;
import bo.productbo;

/**
 * Servlet implementation class lienhe
 */
@WebServlet("/lienhe")
public class lienhe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lienhe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			categorybo sbo = new categorybo();
			productbo pbo = new productbo();
			String ml = request.getParameter("ml");
			String key = request.getParameter("txtfind");
			ArrayList<categorybean> dscategory = sbo.getcategory();
			ArrayList<productbean> dsproduct = pbo.getproduct();
			request.setAttribute("dsproduct", dsproduct);
			request.setAttribute("dscategory", dscategory);
			RequestDispatcher rd = request.getRequestDispatcher("lienhe.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
