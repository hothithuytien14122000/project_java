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
 * Servlet implementation class htthhemsp
 */
@WebServlet("/htthhemsp")
public class htthhemsp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htthhemsp() {
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
			categorybo lbo = new categorybo();
		 	productbo sbo= new productbo();
		 	String ml= request.getParameter("ml");
		 	String key= request.getParameter("txtfind");
		 	ArrayList<categorybean> dsloai=lbo.getcategory();
		 	ArrayList<productbean> dssach= sbo.getproduct();
		    if(ml!=null) dssach= sbo.TimMaLoai(ml);
		    else
		   		if(key!=null) dssach=sbo.Tim(key);
		    request.setAttribute("dsloai", dsloai);
		    request.setAttribute("dssach", dssach);
		    RequestDispatcher rd= request.getRequestDispatcher("addProduct.jsp");
		    rd.forward(request, response);
		}catch (Exception e) {
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
