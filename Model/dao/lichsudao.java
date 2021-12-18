package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.lichsubean;


public class lichsudao {
	DungChung dc=new DungChung();
	public ArrayList<lichsubean> getLichSu(long makh) throws Exception {
		
		dc.KetNoi();
		ArrayList<lichsubean> ds=new ArrayList<lichsubean>();
		String sql="select * from LichSu where makh =?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		ResultSet rs= cmd.executeQuery();
		while(rs.next())
		{
	        long makh1  = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String tensach = rs.getString("title");
			int soluong= rs.getInt("SoLuongMua");
			float discount = rs.getFloat("discount");
			float thanhtien = rs.getFloat("ThanhTien");
			String damua=rs.getString("damua");
			lichsubean lichsu = new lichsubean(makh1, hoten, tensach, soluong, discount, thanhtien, damua);
			ds.add(lichsu);
		}
		rs.close();
		return ds;
		
	}
public ArrayList<lichsubean> gethd() throws Exception {
	DungChung dc=new DungChung();
		dc.KetNoi();
		ArrayList<lichsubean> ds=new ArrayList<lichsubean>();
		String sql="select * from LichSu ";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		while(rs.next())
		{
	        long makh1  = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String tensach = rs.getString("title");
			int soluong= rs.getInt("SoLuongMua");
			float discount = rs.getFloat("discount");
			float thanhtien = rs.getFloat("ThanhTien");
			String damua=rs.getString("damua");
			lichsubean hd = new lichsubean(makh1, hoten, tensach, soluong, discount, thanhtien, damua);
			ds.add(hd);
		}
		rs.close();
		return ds;
		
	}

}
