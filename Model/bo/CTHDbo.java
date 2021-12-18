package bo;

import java.util.ArrayList;

import bean.CTHDbean;
import dao.CTHDdao;

public class CTHDbo {
	CTHDdao khdao= new CTHDdao();
	public void getcthd(String id_product, Long soluongmua, int MaHD, String damua ) throws Exception{
		    khdao.themcthd(id_product, soluongmua, MaHD, damua);
   }
	public int maxhd() throws Exception {
		return khdao.maxhd();
		
	}
	 public ArrayList<CTHDbean> geththd() throws Exception {
		 return khdao.geththd();
	 }
	 public void xacnhancthd(String id,String damua)throws Exception {
		 khdao.xacnhancthd(id, damua);
	 }
	 public void xoacthd(String id) throws Exception{
		 khdao.xoacthd(id);
	 }
}
