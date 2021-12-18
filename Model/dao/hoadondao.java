package dao;

import java.sql.Date;
import java.sql.PreparedStatement;

public class hoadondao {
	public void themhd(String makh,Date ngayMua, String damua )throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "insert into hoadon values (?,?,?) ";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, makh);
		cmd.setDate(2, ngayMua);
		cmd.setString(3, damua);
		cmd.executeUpdate();
			
}

}
