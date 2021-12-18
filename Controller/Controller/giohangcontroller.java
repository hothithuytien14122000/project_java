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

import bean.categorybean;
import bean.productbean;
import bo.categorybo;
import bo.giohangbo;
import bo.productbo;

/**
 * Servlet implementation class giohangcontroller
 */
@WebServlet("/giohangcontroller")
public class giohangcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohangcontroller() {
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
		      categorybo loai = new categorybo();
				productbo sach = new productbo();
				ArrayList<productbean> dssach = null;//laasy mag dong
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
				ArrayList<categorybean> dsloai = null;
		      
		      request.setAttribute("dsloai", dsloai);
				request.setAttribute("dssach", dssach);
				
				HttpSession session = request.getSession();
				String id_product=request.getParameter("id_product");
				String title=request.getParameter("title");
				String discount = request.getParameter("discount");
				String thumbnail=request.getParameter("thumbnail");
				String SoLuong=request.getParameter("SoLuong");
				String Thanhtien=request.getParameter("ThanhTien");

				if(id_product!=null)
				{
					//Tạo cho kh 1 giohang khi dat mua quyen sach dau tien
					giohangbo gh=null;
					if(session.getAttribute("gh")==null)
					{
						gh=new giohangbo(); //Cập nhật vùng nhớ
						session.setAttribute("gh", gh); //Tạo ra 1 giỏ
					}
					//
					gh=(giohangbo)session.getAttribute("gh");
					gh.Them(id_product, thumbnail, title,  Long.parseLong(discount), (long)1);
				}
				
				if(title!=null)
				{
					RequestDispatcher rd = request.getRequestDispatcher("htgiohangcontroller");
					rd.forward(request, response);
				}
				
				
				if(id_product==null)
				{
					if(request.getParameter("btnTraAll")!=null)
					{
						giohangbo gh=(giohangbo)session.getAttribute("gh");
						gh.XoaALL();
						session.removeAttribute("gh");
						RequestDispatcher rd = request.getRequestDispatcher("giohang.jsp");
						rd.forward(request, response);
					}
					if(request.getParameter("btnThanhToan")!=null)
					{
						RequestDispatcher rd = request.getRequestDispatcher("thanhtoan.jsp");
						rd.forward(request, response);
					}
					if(request.getParameter("btnMuaHang")!=null)
					{
						RequestDispatcher rd1 = request.getRequestDispatcher("shop.jsp");
						rd1.forward(request, response);
					}
					if(request.getParameter("btnMua")!=null)
					{
						RequestDispatcher rd2 = request.getRequestDispatcher("shop.jsp");
						rd2.forward(request, response);
					}
					response.sendRedirect("htgiohangcontroller");
				}
		      
		      
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
