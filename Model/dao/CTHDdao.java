package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CTHDbean;
import bean.khachhangbean;
import bean.productbean;

public class CTHDdao {
public void themcthd(String id_product, Long soluongmua, int MaHD, String damua  )throws Exception {
		
		
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "insert into ChiTietHoaDon(id_product,SoLuongMua,MaHoaDon,damua) values (?,?,?,?) ";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, id_product);
		cmd.setLong(2, soluongmua);
		cmd.setInt(3, MaHD);
		cmd.setString(4, damua);
		cmd.executeUpdate();
			
}
  public int maxhd() throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		
          Statement  st= dc.cn.createStatement();
		ResultSet rs = st.executeQuery("select max(MaHoaDon)from hoadon");
		int id2 = -1;
		if (rs.next()) {
		   id2 = rs.getInt(1);  
		}
		return id2;
	}
  public ArrayList<CTHDbean> geththd() throws Exception {
		DungChung dc=new DungChung();
		dc.KetNoi();
		ArrayList<CTHDbean> ds= new ArrayList<CTHDbean>();
		String sql="select * from ChiTietHoaDon left join hoadon on ChiTietHoaDon.MaHoaDon = hoadon.MaHoaDon left join khachhang on khachhang.makh= hoadon.makh";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		while(rs.next())
		{
			int MaChiTietHD = rs.getInt("MaChiTietHD");
			String id_product = rs.getString("id_product");
			int SoLuongMua = rs.getInt("SoLuongMua");
			String title = rs.getString("title");
			String DaMua = rs.getString("DaMua");
			String hoten = rs.getString("hoten");
			String sodt = rs.getString("sodt");
			String diachi = rs.getString("diachi");
			CTHDbean hthd = new CTHDbean(MaChiTietHD, id_product, SoLuongMua, title, DaMua, hoten, sodt, diachi);
			ds.add(hthd);
			}
		rs.close();
		return ds;
	}
  public void xacnhancthd(String id,String damua)throws Exception {
		
		
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "update ChiTietHoaDon set damua=? where MaChiTietHD=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, damua);
		cmd.setString(2, id);
		cmd.executeUpdate();
			
}
  public void xoacthd(String id) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "delete from ChiTietHoaDon where MaChiTietHD=? ";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, id);
		cmd.executeUpdate();
	} 
}
