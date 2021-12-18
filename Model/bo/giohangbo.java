package bo;

import java.util.ArrayList;

import bean.giohangbean;


public class giohangbo {
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	public void Them(String id_product, String thumbnail, String title, long discount, Long SoLuong)
	{
		for(giohangbean g:ds)
		{
			if(g.getId_product().equals(id_product))
			{
				g.setSoLuong(g.getSoLuong()+SoLuong);
				return;
			}
		}
		ds.add(new giohangbean(id_product, title, (long)discount, thumbnail, (long)1));
	}
	public void Sua(String id_product, long sl)
	{
		for(giohangbean g:ds)
		{
			if(g.getId_product().equals(id_product))
			{
				g.setSoLuong(sl);
				return;
			}
		}
	}
	public void Xoa(String id_product)
	{
		for(giohangbean g:ds)
		{
			if(g.getId_product().equals(id_product))
			{
				ds.remove(g);
				return;
			}
		}
	}
	public void XoaALL()
	{
		ds.removeAll(ds);
		return;
	}
	public Long TongTien()
	{
		long s=0;
		for(giohangbean g:ds)
			s=s+g.getThanhTien();
		return s;
	}
	public int TongSP() {
		int dem=0;
		for(giohangbean g: ds)
    		dem=ds.size();
		return dem;
	}

}
