package bean;

public class lichsubean {
	private long MaChiTietHD;
	private String hoten;
	private String title;
	private int soluong;
	private float discount;
	private float thanhtien;
	private String damua;
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsubean(long MaChiTietHD, String hoten, String title, int soluong, float discount, float thanhtien, String damua) {
		super();
		this.MaChiTietHD = MaChiTietHD;
		this.hoten = hoten;
		this.title = title;
		this.soluong = soluong;
		this.discount = discount;
		this.thanhtien = thanhtien;
		this.damua = damua;
	}
	public long getMaCTHD() {
		return MaChiTietHD;
	}
	public void setMaCTHD(long MaChiTietHD) {
		this.MaChiTietHD = MaChiTietHD;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(float thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getDamua() {
		return damua;
	}
	public void setDamua(String damua) {
		this.damua = damua;
	}
	
}
