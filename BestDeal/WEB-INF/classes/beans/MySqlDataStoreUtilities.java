/*
 * MySqlDataStoreUtilities.java
 *
 */
package beans;
import java.io.*;
import java.util.*;
import java.util.ArrayList;
import java.sql.*;

public class MySqlDataStoreUtilities
{
    static Connection con = null;
    public void getConnection()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static void insertUser(String name, String username, String password){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "insert into Registration values(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, password);
            ps.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static boolean validateUniqueUser(String username){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "select username from Registration");
            ResultSet results = ps.executeQuery();
           
           while (results.next()) {
            String storedUserName = results.getString("username");
                if(username.equals(storedUserName)) {
                    return false;
            }
        } 
    }
       catch(Exception e){
            e.printStackTrace();
        }
        return true;
    }
    
    
    public static boolean checkUser(String username,String password){
      try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
        
         PreparedStatement ps =
         con.prepareStatement("select password from Registration where username='"+username+"';");
         ResultSet result =ps.executeQuery();
        while (result.next()) {
            if(result.getString("password").equals(password))
            {
                return true; 
            }
        }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    return false;
  }   
  
  
  public static void insertOrder(String prodIDs, int orderID, String userName, String firstName, String lastName, String address, String city, String state, String zip, String phoneNumber, String prodTotal, String creditCard, java.sql.Date orderDate, java.sql.Date expDeliveryDate){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "insert into Orders values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
             ps.setInt(1, orderID);
            ps.setString(2, userName);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, address);
            ps.setString(6, city);
            ps.setString(7, state);
            ps.setString(8, zip);
            ps.setString(9, phoneNumber);
            ps.setDouble(10, Double.parseDouble(prodTotal));
            ps.setString(11, creditCard);
            ps.setDate(12, orderDate);
            ps.setDate(13, expDeliveryDate);
            ps.execute();
            
            String splitProdIDs[] = prodIDs.split(",");
            
            for(String id : splitProdIDs) {
            PreparedStatement psPC =
            con.prepareStatement( "insert into ProductCount values(?,?,?)");
             psPC.setInt(1, orderID);
            psPC.setString(2, id);
            psPC.setInt(3, 1);
            psPC.execute();
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static void updateOrder(int orderID, String firstName, String lastName, String address, String city, String state, String zip, String phoneNumber){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement("update Orders SET firstName='"+firstName+"', lastName='"+lastName+"', userAddress='"+address+"', userCity='"+city+"', userState='"+state+"', userZip='"+zip+"', userPhone='"+phoneNumber+"' WHERE OrderId='"+orderID+"';");
            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    
     public static void cancelOrder(String orderID){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "DELETE FROM Orders WHERE OrderId='"+orderID+"';");
            ps.execute();
            PreparedStatement ps1 =
            con.prepareStatement( "DELETE FROM ProductCount WHERE OrderId='"+orderID+"';");
            ps1.execute();

        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static List<Order> trackOrder(String orderID){
        List<Order> orderList = new ArrayList<Order>();
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "SELECT * FROM Orders WHERE OrderId='"+orderID+"';");
            ResultSet result = ps.executeQuery();
            result.first();
            Order order = new Order();
            order.setOrderId(result.getInt("OrderId"));
            order.setUsername(result.getString("userName"));
            order.setFname(result.getString("firstName"));
            order.setLname(result.getString("lastName"));
            order.setAddress(result.getString("userAddress"));
            order.setCity(result.getString("userCity"));
            order.setState(result.getString("userState"));
            order.setZip(result.getString("userZip"));
            order.setPnumber(result.getString("userPhone"));
            order.setOrderTotal(result.getDouble("orderPrice"));
            order.setCreditCard(result.getString("creditCardNo"));
            order.setOrderDate(result.getDate("orderDate"));
            order.setDelDate(result.getDate("deliveryDate"));
            orderList.add(order);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return orderList;
    }
    
     public static List<Order> listAllOrders(){
        List<Order> orderList = new ArrayList<Order>();
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "SELECT * FROM Orders");
            ResultSet result = ps.executeQuery();
            while(result.next()){
                Order order = new Order();
                order.setOrderId(result.getInt("OrderId"));
                order.setUsername(result.getString("userName"));
                order.setFname(result.getString("firstName"));
                order.setLname(result.getString("lastName"));
                order.setAddress(result.getString("userAddress"));
                order.setCity(result.getString("userCity"));
                order.setState(result.getString("userState"));
                order.setZip(result.getString("userZip"));
                order.setPnumber(result.getString("userPhone"));
                order.setOrderTotal(result.getDouble("orderPrice"));
                order.setCreditCard(result.getString("creditCardNo"));
                order.setOrderDate(result.getDate("orderDate"));
                order.setDelDate(result.getDate("deliveryDate"));
                orderList.add(order);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return orderList;
    }
    
    public static List<User> listAllUsers(){
        List<User> userList = new ArrayList<User>();
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "SELECT * FROM Registration");
            ResultSet result = ps.executeQuery();
            while(result.next()){
                User user = new User();
                user.setUsername(result.getString("username"));
                user.setFullName(result.getString("name"));
                user.setPassword(result.getString("password"));
                userList.add(user);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return userList;
    }
    
     public static List<Product> getProductList(){
        List<Product> productList = new ArrayList<Product>();
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "SELECT * FROM Product");
            ResultSet result = ps.executeQuery();
            while(result.next()){
                Product product = new Product();
                product.setId(result.getString("productId"));
                product.setType(result.getString("productType"));
                product.setRetailer(result.getString("productRetailer"));
                product.setImage(result.getString("productImage"));
                product.setBrand(result.getString("productBrand"));
                product.setDescription(result.getString("description"));
                product.setPrice(result.getDouble("price"));
                product.setManfRebate(result.getDouble("manfRebate"));
                product.setName(result.getString("productName"));
                productList.add(product);
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }
        return productList;
    }

    
    public static Map<String, Integer> listMostSoldProducts(){
        Map<String, Integer> productList = new HashMap<String, Integer>();
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "SELECT ProductId, SUM(ProductCount.count) AS total FROM Orders JOIN ProductCount ON Orders.OrderId = ProductCount.OrderId GROUP BY ProductCount.ProductId ORDER BY total DESC LIMIT 5;");
            ResultSet result = ps.executeQuery();
            while(result.next()){
                productList.put(result.getString("ProductId"), result.getInt("total"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return productList;
    }
    
    public static Map<String, Integer> listZipWhereMostProductsSold(){
        Map<String, Integer> zipList = new HashMap<String, Integer>();
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BestDealDatabase"
            ,"root","aditya@123");
            
            PreparedStatement ps =
            con.prepareStatement( "SELECT userZip, COUNT(Orders.userZip) AS count FROM Orders GROUP BY Orders.userZip ORDER BY count DESC LIMIT 5;");
            ResultSet result = ps.executeQuery();
            while(result.next()){
                zipList.put(result.getString("userZip"), result.getInt("count"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return zipList;
    }
}