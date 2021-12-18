package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CTHDbean;
import bean.giohangbean;
import bean.khachhangbean;
import bean.lichsubean;
import bo.CTHDbo;
import bo.giohangbo;
import bo.lichsubo;
import dao.khachhangdao;
import dao.lichsudao;

/**
 * Servlet implementation class donhangAdmin
 */
@WebServlet("/donhangAdmin")
public class donhangAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public donhangAdmin() {
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
			lichsudao lbo = new lichsudao();
			ArrayList<lichsubean> dskh=lbo.gethd();
		    request.setAttribute("dskh", dskh);
		    RequestDispatcher rd= request.getRequestDispatcher("hoadon.jsp");
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
