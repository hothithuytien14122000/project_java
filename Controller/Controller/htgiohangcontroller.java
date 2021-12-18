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
 * Servlet implementation class htgiohangcontroller
 */
@WebServlet("/htgiohangcontroller")
public class htgiohangcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htgiohangcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		categorybo loai = new categorybo();
		productbo sach = new productbo();
		ArrayList<productbean> dssach = null;
		try {
			dssach = sach.getproduct();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<categorybean> dsloai = null;
		try {
			dsloai = loai.getcategory();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String ml=request.getParameter("ml");
		String key=request.getParameter("key");
		if (ml!=null)
			try {
				dssach=sach.TimMaLoai(ml);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		else
			if (key != null)
				try {
					dssach=sach.Tim(key);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		request.setAttribute("dsloai", dsloai);
		request.setAttribute("dssach", dssach);
		RequestDispatcher rd = request.getRequestDispatcher("giohang.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
