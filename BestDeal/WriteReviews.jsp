<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%@ page
import= "java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<% 
    String logoutTag = null;
    String trackTag = null;
    String homeTag = null;
    String navHomeTag = null;
    String userName = null;
   
    if(request.getSession(false) != null)
    {
          logoutTag = "<li class='end'><a href='/BestDeal/LogOut.jsp'>Sign Out</a></li>";
          trackTag = "<li class='end'><a href='trackOrder.html'>Track Order</a></li>";
          homeTag= "<h1><a href='/BestDeal/Home.jsp'>Best<span>Deal</span></a></h1>";
          navHomeTag="<li class='start selected'><a href='/BestDeal/Home.jsp'>Home</a></li>";
          userName = session.getAttribute("user").toString();
             
        String prodImage = request.getParameter("hiddenProductImage");
        String prodID = request.getParameter("hiddenProductID");
        String prodName = request.getParameter("hiddenProductName");
        String prodDesc = request.getParameter("hiddenProdDesc");
        String prodPrice = request.getParameter("hiddenProductPrice");
        String prodCateg = request.getParameter("hiddenProductCateg");
        String prodManfName = request.getParameter("hiddenManfName");
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
        <b>Write Review</b>
        </div>
        <form method='get' action='/BestDeal/SubmitReview.jsp'>
        <input type = 'hidden' name = 'hiddenProdID' value = '<%= prodID %>'>
        <input type = 'hidden' name = 'hiddenProdName' value = '<%= prodName %>'>
        <input type = 'hidden' name = 'hiddenProdDesc' value = '<%= prodDesc %>'>
        <input type = 'hidden' name = 'hiddenProdPrice' value = '<%= prodPrice %>'>
        <input type = 'hidden' name = 'hiddenProdCateg' value = '<%= prodCateg %>'>
        <input type = 'hidden' name = 'hiddenZip' value = '60616'>
        <input type = 'hidden' name = 'hiddenCity' value = 'Chicago'>
        <input type = 'hidden' name = 'hiddenState' value = 'IL'>
        <input type = 'hidden' name = 'hiddenManfName' value = '<%= prodManfName %>'>
        <input type = 'hidden' name = 'hiddenproductOnSale' value = 'yes'>
        <fieldset>
        <legend>Product information:</legend>
        <center><img src = 'images/<%= prodImage %>' width = '200' height = '200' ></center>
        <table>
        <tr>
        <td> Product Name: </td>
        <td><%= prodName %></td>
        </tr>
        <tr>
            <td> Product Category: </td>
            <td><%= prodCateg %></td>
        </tr>
        <tr>
            <td> Product Price: </td>
            <td>$<%= prodPrice %></td>
        </tr>
        <tr>
            <td> Retailer Name: </td>
            <td>BestDeal</td>
        </tr>
        <tr>
            <td> Zip: </td>
            <td>60616</td>
        </tr>
        <tr>
            <td> City: </td>
            <td>Chicago</td>
        </tr>
        <tr>
            <td> State: </td>
            <td>Illinois</td>
        </tr>
        <tr>
            <td> Product On Sale: </td>
            <td></td>
        </tr>
        <tr>
            <td> Manufacturer Name: </td>
            <td><%= prodManfName %></td>
        </tr>
         <tr>
            <td> Manufacturer Rebate: </td>
            <td></td>
        </tr>
        </table>
        </fieldset>
        <br />
        <fieldset>
            <legend>Reviews:</legend>
            <table>
                <tr>
                    <td> Username*: </td>
                    <td> <input readonly type='read' name='userName'value='<%= userName %>'></td>
                </tr>
                <tr>
                    <td> Age*: </td>
                    <td> <input required type='text' name='userAge'> </td>
                </tr>
                <tr>
                    <td> Gender*: </td>
                    <td> <select name='userGender'>
                          <option value='Male'>Male</option>
                          <option value='Female'>Female</option>
                          </select>
                    </td>
                </tr>
                <tr>
                    <td> Occupation*: </td>
                    <td> <input required type='text' name='userAge'> </td>
                </tr>
                <tr>
                    <td> Review Rating*: </td>
                    <td>
                        <select name='reviewRating'>
                        <option value='1' selected>1</option>
                        <option value='2'>2</option>
                        <option value='3'>3</option>
                        <option value='4'>4</option>
                        <option value='5'>5</option>  
                    </td>
                </tr>
                <tr>
                    <td> Review Date*: </td>
                    <td> <input required type='date' name='reviewDate'> </td>
                </tr>
                <tr>
                    <td> Review Text*: </td>
                    <td><textarea required name='reviewText' rows='4' cols='50'> </textarea></td>
                </tr>
            </table>
            <br><br>
            <center><input type='submit' value='Submit Review'></center>
        </fieldset>
        </form>
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
        }
        else
        {
            logoutTag = "<li class='end'><a href='/BestDeal/login.html'>Sign In</a></li>"; 
            trackTag  = "";
            homeTag = "<h1><a href='index.html'>Best<span>Deal</span></a></h1>";
            navHomeTag="<li class='start selected'><a href='index.html'>Home</a></li>";
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
        <b>Write Review</b>
        </div>
         <h2>Kindly login to write review!</h2>
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
        }
%>
