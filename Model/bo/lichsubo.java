package bo;

import java.util.ArrayList;

import bean.lichsubean;
import dao.lichsudao;



public class lichsubo {
	lichsudao lsdao= new lichsudao();
	public ArrayList<lichsubean> getLichSu(long makh) throws Exception{
		return lsdao.getLichSu(makh);
	}
	public ArrayList<lichsubean> gethd() throws Exception {
		return lsdao.gethd();
	}

}
