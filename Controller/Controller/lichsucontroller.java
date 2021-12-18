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

import bean.khachhangbean;
import bean.lichsubean;
import bo.lichsubo;

/**
 * Servlet implementation class lichsucontroller
 */
@WebServlet("/lichsucontroller")
public class lichsucontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsucontroller() {
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
			lichsubo lsbo= new lichsubo();
			ArrayList<lichsubean> dsls= new ArrayList<lichsubean>();
			HttpSession session= request.getSession();
			khachhangbean kh=(khachhangbean)session.getAttribute("kh");
			long makh=Long.parseLong(kh.getMaKH());
			if(kh!=null) dsls=lsbo.getLichSu(makh);
			request.setAttribute("dsls", dsls);
			session.removeAttribute("gh");
			  RequestDispatcher rd= request.getRequestDispatcher("lichsu.jsp");
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
