package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class DangNhapController
 */
@WebServlet("/DangNhapController")
public class DangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String UserName=request.getParameter("TenDN");
			String Password=request.getParameter("Matkhau");
			khachhangbo khbo=new khachhangbo();
			khachhangbean kh = khbo.ktdn(UserName, Password);
			HttpSession session = request.getSession();
			if (kh!=null){
				session.setAttribute("kh", kh);
				session.setAttribute("kt", (long)1);
	   			  
	   		   }else{
	   			   
	   			   session.setAttribute("kt", (long)0);
	   		   }
	   	
			RequestDispatcher rd = request.getRequestDispatcher("Htcategory");
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
