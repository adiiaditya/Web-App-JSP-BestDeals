<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%@ page
import= "beans.User, beans.MongoDBDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>


<%	
	String logoutTag = null;
    String trackTag = null;
    String homeTag = null;
    String navHomeTag = null;
    
    if(request.getSession(false) != null)
    {
       logoutTag = "<li class='end'><a href='/BestDeal/LogOut.jsp'>Sign Out</a></li>";
       trackTag = "<li class='end'><a href='trackOrder.html'>Track Order</a></li>";
       homeTag= "<h1><a href='/BestDeal/Home.jsp'>Best<span>Deal</span></a></h1>";
       navHomeTag="<li class='start selected'><a href='/BestDeal/Home.jsp'>Home</a></li>";
     //  userName = session.getAttribute("user").toString();
     }
     else
     {
        logoutTag = "<li class='end'><a href='/BestDeal/login.html'>Sign In</a></li>"; 
        trackTag  = "";
        homeTag = "<h1><a href='index.html'>Best<span>Deal</span></a></h1>";
        navHomeTag="<li class='start selected'><a href='index.html'>Home</a></li>";
      }

				
	try{
			//Get the values from the form
			String productName = request.getParameter("hiddenProdName");
			String userName = request.getParameter("userName");
			String reviewRating = request.getParameter("reviewRating");
			String userAge = request.getParameter("userAge");
			String userGender = request.getParameter("userGender");	
			String userOccupation = request.getParameter("userOccupation");	
			String reviewDate = request.getParameter("reviewDate");
			String reviewText = request.getParameter("reviewText");
			String productPrice = request.getParameter("hiddenProdPrice");
			String productType = request.getParameter("hiddenProdCateg");
			String retailerName = "BestDeal";
			String prodManfRebate = " ";
			String retailerZip = request.getParameter("hiddenZip");
			String retailerCity = request.getParameter("hiddenCity");
			String retailerState = request.getParameter("hiddenState");
			String prodManfName = request.getParameter("hiddenManfName");
			String productOnSale = request.getParameter("hiddenproductOnSale");
			
			MongoDBDataStoreUtilities.insertReview(productName,  userName,  productType,  productPrice,  retailerName,  retailerZip,  retailerCity,  retailerState,  productOnSale,  prodManfName,  prodManfRebate,  userAge,  userGender,  userOccupation,  reviewRating, reviewDate,  reviewText);

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
        <b>Review Submission Status</b>
        </div>
		<h2> Review submitted for: <%= productName %></h2>
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