package bo;

import java.util.ArrayList;

import bean.categorybean;
import dao.categorydao;

public class categorybo {
	categorydao ldao = new categorydao();
	public ArrayList<categorybean> getcategory() throws Exception
	{
		return ldao.getcategory();
	}
	public void getXoaLoai(String masach) throws Exception{
		ldao.xoaLoai(masach);
	}
}
