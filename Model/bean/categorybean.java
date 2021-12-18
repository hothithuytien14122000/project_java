package bean;

public class categorybean {
	private String id_category;
	private String name;
	public categorybean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public categorybean(String id_category, String name) {
		super();
		this.id_category = id_category;
		this.name = name;
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

}
