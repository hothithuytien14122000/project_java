package bo;

import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao= new khachhangdao();
	khachhangbean kh=new khachhangbean();
	   public void getkh(String hoten,String diachi, String sodt,String email,String un,String pass) throws Exception{
		    khdao.dangky(hoten, diachi, sodt, email, un, pass);
		    }
	   
	   public khachhangbean ktdn(String makh, String matkhau) throws Exception
	   {
	    	return khdao.getkh(makh, matkhau);
	   }
	   public khachhangbean ktkh(String makh) throws Exception
	   {
	    	return khdao.ktkh(makh);
	   }


}
