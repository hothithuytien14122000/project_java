package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.productbean;

public class productdao {
	DungChung dc=new DungChung();
	private String id_category;
	public ArrayList<productbean> getproduct() throws Exception{
		dc.KetNoi();
		ArrayList<productbean> ds= new ArrayList<productbean>();
		String sql="select * from Product left join Category on Product.id_category = Category.id_category ";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		while(rs.next())
		{
			String id_product = rs.getString("id_product");
			String id_category = rs.getString("id_category");
			String name = rs.getString("name");
			String title = rs.getString("title");
			String price = rs.getString("price");
			String discount = rs.getString("discount");
			String thumbnail = rs.getString("thumbnail");
			String description = rs.getString("description");
			productbean sach = new productbean(id_product, id_category, name, title, price, discount, thumbnail, description);
			ds.add(sach);
		}
		rs.close();
		return ds;
	}
	public productbean getmProduct(Integer masp) throws Exception
	{
		dc.KetNoi();
		productbean product = null;
		String sql="select * from Product left join Category on Product.id_category = Category.id_category ";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setInt(1, masp);
		ResultSet rs= cmd.executeQuery();
		while(rs.next())
		{
			String id_product = rs.getString("id_product");
			String id_category = rs.getString("id_category");
			String name = rs.getString("name");
			String title = rs.getString("title");
			String price = rs.getString("price");
			String discount = rs.getString("discount");
			String thumbnail = rs.getString("thumbnail");
			String description = rs.getString("description");
			product = new productbean(id_product, id_category, name, title, price, discount, thumbnail, description);
		}
		rs.close();
		return product;
	}
	public void xoaSach(String maloai) throws Exception{
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "delete from product where id_product=? ";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.executeUpdate();
	}
	public void ThemSp(String id_category, String title, String price, String discount,
			String thumbnail, String description) throws Exception
	{
		//b1: ket noi vao csdl
		DungChung dc=new DungChung();
		dc.KetNoi();
		
			String sql="insert into product (title,id_category,price,discount,thumbnail,description) values (?,?,?,?,?,?)";
			PreparedStatement cmd=dc.cn.prepareStatement(sql);
			cmd.setString(1,title);
			cmd.setString(2, id_category);
			cmd.setString(3,price);
			cmd.setString(4,discount);
			cmd.setString(5,thumbnail);
			cmd.setString(6, description);
			//b4: Thuc hien cau lieu
			cmd.executeUpdate();
		
	}

}
