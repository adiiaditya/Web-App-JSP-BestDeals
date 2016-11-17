/*
 * MongoDBDataStoreUtilities.java
 *
 */
package beans; 
import java.io.*;
import java.util.*;
import java.util.ArrayList;
import com.mongodb.*;
import com.mongodb.AggregationOutput;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;


public class MongoDBDataStoreUtilities
{
    static DBCollection myReviews;
    
    public static void getConnection()
    {
        MongoClient mongo;
        // Connect to Mongo DB
        mongo = new MongoClient("localhost", 27017);
        
        // If database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("UserReviews");
				
		// If the collection does not exists, MongoDB will create it for you
		myReviews = db.getCollection("myReviews");
    }
    
    public static void insertReview(String productName, String userName, String productType, String productPrice, String retailerName, String retailerZip, String retailerCity, String retailerState, String productOnSale, String prodManfName, String prodManfRebate, String userAge, String userGender, String userOccupation, String reviewRating,String reviewDate, String reviewText)
    {
        getConnection();
        BasicDBObject doc = new BasicDBObject("title", "myReviews").
        append("productName", productName).
        append("userName", userName).
        append("productType", productType).
        append("productPrice", productPrice).
		append("retailerName", retailerName).
		append("retailerZip", retailerZip).
		append("retailerCity", retailerCity).
		append("retailerState", retailerState).
        append("productOnSale", productOnSale).
		append("prodManfName", prodManfName).
		append("prodManfRebate", prodManfRebate).		
        append("userAge", userAge).
		append("userGender", userGender).
		append("userOccupation", userOccupation).		
        append("reviewRating", reviewRating).
        append("reviewDate", reviewDate).
        append("reviewText", reviewText);
        myReviews.insert(doc);
    }
    
    public static ArrayList<Review> selectReview(String productName)
    {
        ArrayList<Review> listReview = new ArrayList<Review>();
        try{
        getConnection();
        BasicDBObject query = new BasicDBObject("productName", productName);
        DBCursor cursor = myReviews.find(query);
        while (cursor.hasNext())
        {
            BasicDBObject obj = (BasicDBObject) cursor.next();
            Review review =new Review();
            review.setProductName(obj.getString("productName"));
            review.setUserName(obj.getString("userName"));
            review.setReviewRating(obj.getString("reviewRating"));
            review.setReviewDate(obj.getString("reviewDate"));
            review.setReviewText(obj.getString("reviewText"));
            listReview.add(review);
        }
      }
     catch(MongoException e){
            e.printStackTrace();
        }
        return listReview;
    }
    
    public static ArrayList<Product> retrieveTrendingData()
    {
        ArrayList<Product> listProduct = new ArrayList<Product>();
        try{
        getConnection();
        BasicDBObject query = new BasicDBObject();
        query.put("reviewRating", "5");
        DBCursor cursor = myReviews.find(query);
        
        while (cursor.hasNext())
        {
            BasicDBObject obj = (BasicDBObject) cursor.next();
            Product product =new Product();
            product.setName(obj.getString("productName"));
            product.setType(obj.getString("productType"));
            product.setBrand(obj.getString("prodManfName"));
            product.setPrice(Double.parseDouble(obj.getString("productPrice")));
            listProduct.add(product);
        }
      }
     catch(MongoException e){
            e.printStackTrace();
        }
        return listProduct;
    }
}