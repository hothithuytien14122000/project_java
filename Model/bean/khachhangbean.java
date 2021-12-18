package bean;

public class khachhangbean {
	private String MaKH;
	private String SĐT;
	private String HoTenKH;
	private String DiaChi;
	private String MatKhau;
	private String tendn;
	private String Email;
	public khachhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public khachhangbean(String maKH, String sĐT, String hoTenKH, String diaChi, String matKhau, String tendn,
			String email) {
		super();
		MaKH = maKH;
		SĐT = sĐT;
		HoTenKH = hoTenKH;
		DiaChi = diaChi;
		MatKhau = matKhau;
		this.tendn = tendn;
		Email = email;
	}
	public String getMaKH() {
		return MaKH;
	}
	public void setMaKH(String maKH) {
		MaKH = maKH;
	}
	public String getSĐT() {
		return SĐT;
	}
	public void setSĐT(String sĐT) {
		SĐT = sĐT;
	}
	public String getHoTenKH() {
		return HoTenKH;
	}
	public void setHoTenKH(String hoTenKH) {
		HoTenKH = hoTenKH;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public String getTendn() {
		return tendn;
	}
	public void setTendn(String tendn) {
		this.tendn = tendn;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
}
