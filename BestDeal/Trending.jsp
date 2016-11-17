<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%@ page
import= "beans.Product, beans.SaxParser4BestDealXMLdataStore, beans.MySqlDataStoreUtilities, beans.MongoDBDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
	//List to hold product object
    List<Product> productsDataList = null;
	ArrayList<Product>  likedProductList = null;
	Map<String, Integer> soldProductList = null;
	Map<String, Integer> zipProductList = null;
	
	response.setContentType("text/html;charset=UTF-8");
	likedProductList = MongoDBDataStoreUtilities.retrieveTrendingData();
	soldProductList = MySqlDataStoreUtilities.listMostSoldProducts();
	zipProductList = MySqlDataStoreUtilities.listZipWhereMostProductsSold();
		
	SaxParser4BestDealXMLdataStore dataStore = new SaxParser4BestDealXMLdataStore("/usr/local/Cellar/tomcat/8.5.5/libexec/webapps/BestDeal/WEB-INF/ProductCatalog.xml");
    productsDataList = dataStore.getProductList();
		
	String selectedTrendingType = null;
		
	String logoutTag = null;
    String trackTag= null;
    String homeTag = null;
    String navHomeTag = null;
        
    selectedTrendingType = request.getParameter("selectedType").toString();
    if(request.getSession(false) != null)
    {
          logoutTag = "<li class='end'><a href='/BestDeal/LogOut.jsp'>Sign Out</a></li>";
          trackTag = "<li class='end'><a href='trackOrder.html'>Track Order</a></li>";
          homeTag= "<h1><a href='/BestDeal/Home.jsp'>Best<span>Deal</span></a></h1>";
          navHomeTag="<li class='start selected'><a href='/BestDeal/Home.jsp'>Home</a></li>";

    }
    else
    {
        logoutTag = "<li class='end'><a href='/BestDeal/login.html'>Sign In</a></li>"; 
        trackTag  = "";
        homeTag = "<h1><a href='index.html'>Best<span>Deal</span></a></h1>";
        navHomeTag="<li class='start selected'><a href='index.html'>Home</a></li>";
    }
          
	try{
%>
            
            <html>
            <head>
            <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
            <title>BestDeal: Expert Service. Unbelievable Deals.</title>
            <link rel='stylesheet' href='styles.css' type='text/css' />
            </head>
            <body>
            <div id='container'>
            <header>
            <%= homeTag %>
             <h2>Expert Service. Unbelievable Deals.</h2>
            </header>
            <nav>
    	        <ul>
    	        <%= navHomeTag %>
    	         <li class='dropdown'>
                    <a class='dropbtn' href=''>Products</a>
                    <div class='dropdown-content'>
                    <a href='/BestDeal/MobilePage.jsp'>Mobile Phones</a>
                    <a href='/BestDeal/TabletPage.jsp'>Tablets</a>
                    <a href='/BestDeal/LaptopPage.jsp'>Laptops</a>
                    <a href='/BestDeal/TVPage.jsp'>TV</a>
                    </div>
                    </li>
                    <li><a href='/BestDeal/AccessoryPage.jsp'>Accessories</a></li>
                    <li><a href='/BestDeal/WarrantyPage.jsp'>Warranty</a></li>
                    <%= trackTag %>
                    <%= logoutTag %>
                </ul>
                </nav>
                <img class='header-image' src='images/image.jpg' alt='Buildings' />
                <div id='body'>
                <section id='content'>
                <br/>
                <div class='panelHeader'>

<%
                if(selectedTrendingType.equals("liked")){
%>
                    <b>Top 5 most liked products</b>
                </div>
<%
                    if(likedProductList.isEmpty() == true){
%>
					    <h3>There are no trending products currently.</h3>
<%
				}else{			
%>				
					<article class='expanded'>
					<table>
<%
				            for(Product likedProduct : likedProductList)
				            {
				                for(Product product : productsDataList)
				                {
				                    if(likedProduct.name.equals(product.name))
				                    {
%>
				                          <tr>
			                             <td>
			                             <img src = 'images/<%= product.image %>' width = '200' height = '200'  />
			                             </td>
			                             <td>
			                            <span style='color: green;'><b>ID: </b><%= product.id %></b></span></br>
			                            <b>Rating: </b><span style='color: gold;'><b>☆☆☆☆☆</b></span></br>
			                            <b>Name: </b><%= product.name %></br>
			                            <b>Manufacturer: </b><%= product.brand %></br>
			                            <b>Description: </b><%= product.description %></br>
			                            <b>Price: </b><%= product.price %>$</br>
			                            <b>Discount: </b><%= product.manfRebate %>$</br>
			                    <td>
			                    <tr>
<%   
				                    }
				                }
				            }
%>
				</table>
                    </article>
<%
            }
        }
        else if(selectedTrendingType.equals("sold")){
%>
             <b>Top 5 most sold products</b>
                </div>
<%
            if(soldProductList.isEmpty() == true){
%>
					<h3>There are no trending products currently.</h3>
<%
				}else{		
%>	
					<article class='expanded'>
					<table>
<%
				            for(Map.Entry<String, Integer> entry : soldProductList.entrySet())
				            {
				                for(Product product : productsDataList)
				                {
				                    if(product.id.equals(entry.getKey()))
				                    {
%>
				                          <tr>
			                             <td>
			                             <img src = 'images/<%= product.image %>' width = '200' height = '200'  />
			                             </td>
			                             <td>
			                            <b>ID: </b><%= entry.getKey() %></br>
			                            <b>Name: </b><%= product.name %></br>
			                            <span style='color: green;'><b>No. of Items Sold: <%= entry.getValue() %></b></span></br>
			                            <b>Manufacturer: </b><%= product.brand %></br>
			                            <b>Description: </b><%= product.description %></br>
			                            <b>Price: </b><%= product.price %>$</br>
			                            <b>Discount: </b><%= product.manfRebate %>$</br>
			                    <td>
			                    <tr> 
<%
				                    }
				                }
				    		}
%>
				</table>
                    </article>
<%                    
            }
        }
        else if(selectedTrendingType.equals("citiesFrom")){
%>
             <b>Top 5 most zipcodes where max products sold</b>
                </div>
<%
            if(zipProductList.isEmpty() == true){
%>
					<h3>There are no trending products currently.</h3>
<%
				}else{			
%>
					<article class='expanded'>
					<table>
<%
				            for(Map.Entry<String, Integer> entry : zipProductList.entrySet())
				            {
%>
	                            <tr>
			                    <td>
			                    <b>ZipCode: </b><%= entry.getKey() %></br>
			                    <b>Order Count: </b><%= entry.getValue() %></br>
			                    <td>
			                    <tr>   
<%
				            }
%>
				</table>
                    </article>
<%
            }
        }
 %>       
				    </section>
                    <aside class='sidebar'>
	                <ul>
                    <li>
                     <h4>Trending</h4>
                    <ul>
                        <li><a href='/BestDeal/Trending.jsp?selectedType=liked'>Most Liked Products</a></li>
                        <li><a href='/BestDeal/Trending.jsp?selectedType=sold'>Most Sold Products</a></li>
                        <li><a href='/BestDeal/Trending.jsp?selectedType=citiesFrom'>Most Orders From</a></li>
                    </ul>
                    </li>
                    <li>
                    <h4>Contact us</h4>
                    <ul>
                    <li class='text'>
                    <p style='margin: 0;'>2901 S King Dr, Chicago-60616</p>
                    </li>
                    </ul>
                    </li>
                    </ul>
                    </aside>
                    <div class='clear'></div>
                    </div>
                    <footer>
                    <div class='footer-bottom'>
                    <p>&copy; 2016 BestDeal. Prices and offers are subject to change. All rights reserved.</p>
                    </div>
                    </footer>
                    </div>
                    </body>
                    </html>
<%			
		} catch (Exception e) {
				e.printStackTrace();
		}
%>