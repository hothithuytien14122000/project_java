package bean;

public class adminbean {
	private String TenDN;
	private String MatKhau;
	public adminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public adminbean(String tenDN, String matKhau) {
		super();
		TenDN = tenDN;
		MatKhau = matKhau;
	}
	public String getTenDN() {
		return TenDN;
	}
	public void setTenDN(String tenDN) {
		TenDN = tenDN;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}


}
