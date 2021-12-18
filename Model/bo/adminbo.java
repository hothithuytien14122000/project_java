package bo;

import bean.adminbean;
import dao.admindao;

public class adminbo {
	admindao addao= new admindao();
	public adminbean getAd(String TenDN, String MatKhau) throws Exception{
    			return addao.getAd(TenDN, MatKhau);
	}

}
