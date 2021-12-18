package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.adminbean;


public class admindao {
	public adminbean getAd(String un, String pass) throws Exception{
		//B1: kết nối
			DungChung dc = new DungChung();
			dc.KetNoi();
			//b2: lay du lieu ve
			String sql = "select * from admin where  tendangnhap=?  and matkhau=?";
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			//Truyền 01 tham số: un; pas vào cmd
			cmd.setString(1, un);
			cmd.setString(2, pass);
			ResultSet rs = cmd.executeQuery();
			//Nếu rs.next==false return null
			// else: return kh;
				// Tạo ra 1 khachhang:kh và return kh;
			if (rs.next()==false) return null;
			else {
				
			String tendn=rs.getString("TenDangNhap");
			String matkhau=rs.getString("MatKhau");
		
	  		adminbean kh=new adminbean(tendn, matkhau);
	  		rs.close();
		    	dc.cn.close();
	  		return kh;
				}
	  	//Dong ket noi	
	}

}
