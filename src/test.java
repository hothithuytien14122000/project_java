import java.util.ArrayList;

import bo.productbo;
import dao.DungChung;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
          try {
			DungChung cd =new DungChung();
					cd.KetNoi();
				productbo lbo=new productbo();
				lbo.TimMaLoai("1");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
