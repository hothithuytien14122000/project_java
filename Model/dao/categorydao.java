package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.categorybean;

public class categorydao {
	DungChung dc=new DungChung();
	public ArrayList<categorybean> getcategory() throws Exception {
		dc.KetNoi();
		ArrayList<categorybean> ds= new ArrayList<categorybean>();
		String sql="select * from category";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		while(rs.next())
		{
			String id_category = rs.getString("id_category");
			String name = rs.getString("name");
			categorybean sach = new categorybean(id_category, name);
			ds.add(sach);
		}
		rs.close();
		return ds;
	}
	public void xoaLoai(String masach) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "delete from category where id_category=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		cmd.executeUpdate();
		// TODO Auto-generated method stub
		
	}
}
