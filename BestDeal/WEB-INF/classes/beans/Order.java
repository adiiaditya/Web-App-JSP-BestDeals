package beans;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class Order {
    public int orderid;
    public String prodIDs;
    public String uname;
    public String fname;
    public String lname;
    public String address;
    public String city;
    public String state;
    public String zip;
    public String pnumber;
    public String ccnumber;
    public Date orderDate;
    public Date delDate;
    public double orderTotal;
    
	public void setProdIDs(String prodIDs) {
		this.prodIDs = prodIDs;
	}
	
	public void setOrderId(int orderid) {
		this.orderid = orderid;
	}
	
	public void setUsername(String uname) {
		this.uname = uname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public void setZip(String zip) {
		this.zip = zip;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	public void setCreditCard(String ccnumber) {
		this.ccnumber = ccnumber;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}
}