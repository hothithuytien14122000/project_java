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
 * Servlet implementation class htproductController
 */
@WebServlet("/htproductController")
public class htproductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htproductController() {
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
			  categorybo lbo=new categorybo();
		      productbo sbo=new productbo();
		      ArrayList<productbean> dssp=sbo.getproduct();//laasy mag dong
		      String ml=request.getParameter("ml");
		      String key =request.getParameter("txtsearch");
		      if(ml!=null) dssp=sbo.TimMaLoai(ml);
		      else if(key!=null) dssp=sbo.Tim(key);
		      ArrayList<categorybean> dsloai =lbo.getcategory();
		      
		      request.setAttribute("dssp", dssp);
		      request.setAttribute("dsloai", dsloai);
		      
			  String tt=request.getParameter("tt");
			  productbean p =sbo.getmProduct(Integer.parseInt(tt));
			  request.setAttribute("p", p);
			  RequestDispatcher rd = request.getRequestDispatcher("deltai.jsp");
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
