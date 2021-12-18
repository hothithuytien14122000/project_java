package bean;

public class giohangbean {
	private String  id_product;
	private String id_category;
	private String title;
	private long price;
	private long  discount;
	private String thumbnail;
	private String description;
	private long gia;
	private long SoLuong;
	private long ThanhTien;
	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giohangbean(String id_product, String title,  long discount, String thumbnail,  long soLuong) {
		super();
		this.id_product = id_product;
		this.title = title;
		this.discount = discount;
		this.thumbnail = thumbnail;
		this.SoLuong = soLuong;
		this.ThanhTien = discount*soLuong;
	}
	public String getId_product() {
		return id_product;
	}
	public void setId_product(String id_product) {
		this.id_product = id_product;
	}
	public String getId_category() {
		return id_category;
	}
	public void setId_category(String id_category) {
		this.id_category = id_category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public long getDiscount() {
		return discount;
	}
	public void setDiscount(long discount) {
		this.discount = discount;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(long soLuong) {
		this.SoLuong = soLuong;
	}
	public long getThanhTien() {
		return discount*SoLuong;
	}
	public void setThanhTien(long thanhTien) {
		this.ThanhTien = thanhTien;
	}

	
	
}
