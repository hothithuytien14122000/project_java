package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.khachhangbean;

public class khachhangdao {
   public khachhangbean getkh(String un,String pass) throws Exception{
		
		//B1: kết nối
				DungChung dc = new DungChung();
				dc.KetNoi();
				//b2: lay du lieu ve
				String sql = "Select * from khachhang where tendn=? and pass=?";
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
					
					String makh=rs.getString("makh");
		    		String hoten=rs.getString("hoten");
		    		String diachi=rs.getString("diachi");
		    		String matkhau=rs.getString("pass");
		    		String email = rs.getString("email");
		    		String sđt = rs.getString("sodt");
		    		String tendn = rs.getString("tendn");
		    		khachhangbean kh=new khachhangbean(makh, sđt, hoten, diachi, matkhau, tendn, email);
		    		rs.close();
			    	dc.cn.close();
		    		return kh;
					}
		    	//Dong ket noi	
	}
public ArrayList<khachhangbean> gethtkh() throws Exception {
	DungChung dc=new DungChung();
	dc.KetNoi();
	ArrayList<khachhangbean> ds= new ArrayList<khachhangbean>();
	String sql="select * from khachhang";
	PreparedStatement cmd=dc.cn.prepareStatement(sql);
	ResultSet rs= cmd.executeQuery();
	while(rs.next())
	{
		String makh=rs.getString("makh");
		String hoten=rs.getString("hoten");
		String diachi=rs.getString("diachi");
		String matkhau=rs.getString("pass");
		String email = rs.getString("email");
		String sđt = rs.getString("sodt");
		String tendn = rs.getString("tendn");
		khachhangbean htkh = new khachhangbean(makh, sđt, hoten, diachi, matkhau, tendn, email);
		ds.add(htkh);
		}
	rs.close();
	return ds;
}
	public khachhangbean ktkh(String un) throws Exception{
	
		//B1: kết nối
				DungChung dc = new DungChung();
				dc.KetNoi();
				//b2: lay du lieu ve
				String sql = "Select * from khachhang where tendn=? ";
				PreparedStatement cmd = dc.cn.prepareStatement(sql);
				//Truyền 01 tham số: un; pas vào cmd
				cmd.setString(1, un);
				ResultSet rs = cmd.executeQuery();
				//Nếu rs.next==false return null
				// else: return kh;
					// Tạo ra 1 khachhang:kh và return kh;
				while (rs.next()) 
			 {
					
					String makh=rs.getString("makh");
		    		String hoten=rs.getString("hoten");
		    		String diachi=rs.getString("diachi");
		    		String matkhau=rs.getString("pass");
		    		String email = rs.getString("email");
		    		String sđt = rs.getString("sodt");
		    		String tendn = rs.getString("tendn");
		    		khachhangbean htkh = new khachhangbean(makh, sđt, hoten, diachi, matkhau, tendn, email);
		    		rs.close();
			    	dc.cn.close();
		    		return htkh;
				}
				return null;
		    	//Dong ket noi	
	}
	
	public void dangky(String hoten,String diachi, String sodt,String email,String un,String pass )throws Exception {
		
		
			DungChung dc = new DungChung();
			dc.KetNoi();
			String sql = "insert into khachhang values (?,?,?,?,?,?) ";
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, hoten);
			cmd.setString(2, diachi);
			cmd.setString(3, sodt);
			cmd.setString(4, email);
			cmd.setString(5, un);
			cmd.setString(6, pass);
			cmd.executeUpdate();
		
		
	}
	
	


}
