package bean;

public class CTHDbean {
	private int MaChiTietHD;
	private String id_product;
	private int SoLuongMua;
	private String title;
	private String DaMua;
	private String hoten;
	private String sdt;
	private String diachi;
	public CTHDbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CTHDbean(int maChiTietHD, String id_product, int soLuongMua, String title, String daMua, String hoten,
			String sdt, String diachi) {
		super();
		MaChiTietHD = maChiTietHD;
		this.id_product = id_product;
		SoLuongMua = soLuongMua;
		this.title = title;
		DaMua = daMua;
		this.hoten = hoten;
		this.sdt = sdt;
		this.diachi = diachi;
	}
	public int getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(int maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public String getId_product() {
		return id_product;
	}
	public void setId_product(String id_product) {
		this.id_product = id_product;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDaMua() {
		return DaMua;
	}
	public void setDaMua(String daMua) {
		DaMua = daMua;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	
	
	
}
