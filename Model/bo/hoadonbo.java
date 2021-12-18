package bo;

import java.sql.Date;

import dao.hoadondao;

public class hoadonbo {
	hoadondao khdao= new hoadondao();
	public void gethd(String makh, Date NgayMua, String damua) throws Exception{
		    khdao.themhd(makh, NgayMua, damua);
   }

}
