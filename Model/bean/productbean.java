package bean;

public class productbean {
	private String  id_product;
	private String id_category;
	private String name;
	private String title;
	private String price;
	private String discount;
	private String thumbnail;
	private String description;
	public productbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public productbean(String id_product, String id_category,String name, String title, String price, String discount,
			String thumbnail, String description) {
		super();
		this.id_product = id_product;
		this.id_category = id_category;
		this.name= name;
		this.title = title;
		this.price = price;
		this.discount = discount;
		this.thumbnail = thumbnail;
		this.description = description;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
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
	
	
}
