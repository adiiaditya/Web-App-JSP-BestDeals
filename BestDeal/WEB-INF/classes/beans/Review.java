package beans;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class Review {
	public String productType;
	public double productPrice;
	public String retailerName;
	public String retailerZip;
	public String retailerCity;
	public String retailerState;
	public String productOnSale;
	public String prodManfName;
	public String prodManfRebate;
	public String userGender;
	public String userOccupation;	
	public int userAge;
    public String productName;
    public String userName;
    public String reviewRating;
    public String reviewDate;
    public String reviewText;
    
    public void setProductType(String productType) {
		this.productType = productType;
	}
	
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public void setRetailerName(String retailerName) {
		this.retailerName = retailerName;
	}

	public void setRetailerZip(String retailerZip) {
		this.retailerZip = retailerZip;
	}

	public void setRetailerCity(String retailerCity) {
		this.retailerCity = retailerCity;
	}

	public void setRetailerState(String retailerState) {
		this.retailerState = retailerState;
	}

	public void setProductOnSale(String productOnSale) {
		this.productOnSale = productOnSale;
	}

	public void setProdManfName(String prodManfName) {
		this.prodManfName = prodManfName;
	}

	public void setProdManfRebate(String prodManfRebate) {
		this.prodManfRebate = prodManfRebate;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public void setUserOccupation(String userOccupation) {
		this.userOccupation = userOccupation;
	}
    
	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}


	public void setReviewRating(String reviewRating) {
		this.reviewRating = reviewRating;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
}