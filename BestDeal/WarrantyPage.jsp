<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <%@ page
import= "beans.Product, beans.SaxParser4BestDealXMLdataStore, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
    //List to hold product object
    List<Product> productsList = null;
    
     String logoutTag = null;
     String trackTag = null;
     String homeTag = null;
     String navHomeTag = null;
      
     SaxParser4BestDealXMLdataStore dataStore = new SaxParser4BestDealXMLdataStore("/usr/local/Cellar/tomcat/8.5.5/libexec/webapps/BestDeal/WEB-INF/ProductCatalog.xml");
      productsList = dataStore.getProductList();
         
      if(request.getSession(false)!=null){
        logoutTag = "<li class='end'><a href='/BestDeal/LogOut.jsp'>Sign Out</a></li>";
        trackTag = "<li class='end'><a href='trackOrder.html'>Track Order</a></li>";
        homeTag= "<h1><a href='/BestDeal/Home.jsp'>Best<span>Deal</span></a></h1>";
        navHomeTag="<li class='start selected'><a href='/BestDeal/Home.jsp'>Home</a></li>";
    }
    else{
        logoutTag = "<li class='end'><a href='/BestDeal/login.html'>Sign In</a></li>"; 
        trackTag  = "";
        homeTag = "<h1><a href='index.html'>Best<span>Deal</span></a></h1>";
        navHomeTag="<li class='start selected'><a href='index.html'>Home</a></li>";
    }
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
                <div id='body'>
                <section id='content'>
                <br/>
                <div class='panelHeader'>
                <b>Warranty</b>
                </div>
                <article class='expanded'>
                <table>
                
                <%
                //Print Product information
                for(Product product : productsList)
                {
                    if(product.type.equals("Warranty"))
                    {
                 %>       
                        <tr>
                        <td> 
                        <img src = 'images/<%= product.image %>' width = '200' height = '200'  />
                        </td>
                        <td>
                       <b>Product Name: </b><%= product.name %></br>
                         <b>Manufacturer: </b><%= product.brand %></br>
                        <b>Description: </b><%= product.description %></br>
                        <b>Price: </b><%= product.price %>$</br>
                        <b>Discount: </b><%= product.manfRebate %>$</br>
                        </td>
                        <td>
                        <form class = 'button' method = 'get' action = '/BestDeal/AddToCart.jsp'>
                        <input type = 'hidden' name = 'hiddenProductID' value = '<%= product.id %>'>
                        <input type = 'hidden' name = 'hiddenProductName' value = '<%= product.name %>'>
                        <input type = 'hidden' name = 'hiddenProductPrice' value = '<%= product.price %>'>
                        <input type = 'hidden' name = 'hiddenManfRebate' value = '<%= product.manfRebate %>'>
                        <input type='image' name='submit' src='https://www.paypalobjects.com/webstatic/en_US/i/btn/png/btn_addtocart_120x26.png' alt='Add to Cart'>
                        </form>
                        </br>
                        <form class = 'button' method = 'get' action = '/BestDeal/WriteReviews.jsp'>
                        <input type = 'hidden' name = 'hiddenProductImage' value = '<%= product.image %>'>
                         <input type = 'hidden' name = 'hiddenProductID' value = '<%= product.id %>'>
                        <input type = 'hidden' name = 'hiddenProductName' value = '<%= product.name %>'>
                        <input type = 'hidden' name = 'hiddenProductDesc' value = '<%= product.description %>'>
                        <input type = 'hidden' name = 'hiddenProductPrice' value = '<%= product.price %>'>
                        <input type = 'hidden' name = 'hiddenProductCateg' value = '<%= product.type %>'>
                        <input type = 'hidden' name = 'hiddenManfName' value = '<%= product.brand %>'>
                        <input type='image' name='submit' style='width:120px;height:26px' src='images/WriteReview.png' alt='Write Review'>
                        </form>
                        </br>
                        <form class = 'button' method = 'get' action = '/BestDeal/ViewReviews.jsp'>
                       <input type = 'hidden' name = 'hiddenProductName' value = '<%= product.name %>'>
                       <input type='image' name='submit' style='width:120px;height:26px' src='images/ReadReview.png' alt='Read Reviews'>
                       </form>
                        </br>
                        </br>
                        </td>
                        </tr>
        <%
                    }
                }
                
        %>
                    </table>
                    </article>
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
