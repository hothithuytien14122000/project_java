package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class editgiohang
 */
@WebServlet("/editgiohang")
public class editgiohang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editgiohang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
        	   String sl = request.getParameter("txtsoluong");
        	   String title = request.getParameter("title");
   			HttpSession session = request.getSession();
   			giohangbo gh1= new giohangbo();
   					if(request.getParameter("btnsua")!=null) 
   					{
   						gh1=(giohangbo) session.getAttribute("gh");
   				    	gh1.Sua(title, Long.parseLong(sl));
   				    	session.setAttribute("gh", gh1);
   					}
   					if(request.getParameter("btnxoa")!=null) 
   					{
   						gh1=(giohangbo) session.getAttribute("gh");
   						gh1.Xoa(title);
   						session.setAttribute("gh", gh1);
   					}
   				 
   				RequestDispatcher rd= request.getRequestDispatcher("htgiohangcontroller");
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
