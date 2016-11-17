package beans;
import java.util.ArrayList;
import java.util.List;

public class Product {
    public String retailer;
    public String name;
    public String id;
    public String type;
    public String image;
    public String brand;
    public String description;
    public double price;
    public double manfRebate;
    
	public void setId(String id) {
		this.id = id;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setRetailer(String retailer) {
		this.retailer = retailer;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	public void setManfRebate(double manfRebate) {
		this.manfRebate = manfRebate;
	}

	public void setName(String name) {
		this.name = name;
	}
}