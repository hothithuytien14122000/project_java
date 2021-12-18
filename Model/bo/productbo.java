package bo;

import java.util.ArrayList;

import bean.categorybean;
import bean.productbean;
import dao.categorydao;
import dao.productdao;

public class productbo {
	productdao ldao = new productdao();
	public ArrayList<productbean> getproduct() throws Exception
	{
		return ldao.getproduct();
	}
	public ArrayList<productbean> TimMaLoai(String id_category) throws Exception
	{
		ArrayList<productbean> tam = new ArrayList<productbean>();
		ArrayList<productbean> ds = getproduct();
		for(productbean sp:ds)
			if(sp.getId_category().equals(id_category))
				tam.add(sp);
		return tam;
	}
	public ArrayList<productbean> Tim(String key) throws Exception
	{
		ArrayList<productbean> tam = new ArrayList<productbean>();
		ArrayList<productbean> ds = getproduct();
		for(productbean sp: ds)
			if(sp.getTitle().toLowerCase().trim().contains(key.toLowerCase().trim())||
					sp.getPrice().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(sp);
		return tam;
	}
	public productbean getmProduct(Integer masp) throws Exception
	{
	 return ldao.getmProduct(masp);
	}
	public Long Dem(String maloai) throws Exception
	{
		Long d=(long)0;
		ArrayList<productbean> ds = getproduct();
		for(productbean s:ds)
			if(s.getId_product().equals(maloai))
				d++;
		return d;
	}
	public void getXoaSach(String maloai) throws Exception{
		ldao.xoaSach(maloai);
	}
	public void getThemSp(String id_category, String title, String price, String discount,
			String thumbnail, String description) throws Exception
	{
                  ldao.ThemSp(id_category, title, price, discount, thumbnail, description);
	}
}
	
