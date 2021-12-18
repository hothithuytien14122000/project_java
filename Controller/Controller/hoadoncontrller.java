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

import bo.hoadonbo;

/**
 * Servlet implementation class hoadoncontrller
 */
@WebServlet("/hoadoncontrller")
public class hoadoncontrller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hoadoncontrller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		try {
			HttpSession session= request.getSession();
			khachhangbean kh=(khachhangbean)session.getAttribute("kh");
			
			  	String makh=kh.getMaKH();
			//  	long makh1=Long.parseLong(makh);
			  	long millis=System.currentTimeMillis(); 
			  	java.sql.Date NgayMua=new java.sql.Date(millis);
				String damua="False";
				
				hoadonbo hd1=new hoadonbo();
				hd1.gethd(makh, NgayMua, damua);
				
				RequestDispatcher rd= request.getRequestDispatcher("CTHDController");
			    rd.forward(request, response);
				//response.sendRedirect("CTHDController");
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
