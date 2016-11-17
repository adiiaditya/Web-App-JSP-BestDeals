<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page
import= "beans.User, beans.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String error = null;            
    if(userid != null &&
        password != null) {
    if(userid.equals("admin"))
    {
        if(password.equals("admin"))
        {
            response.sendRedirect("/BestDeal/AdminPage.jsp");
        }
        else
        {
            error = "Admin Login Failure! Please enter the correct password";
        }
    }
    else if(userid.equals("salesman"))
    {
        if(password.equals("salesman"))
        {
            response.sendRedirect("/BestDeal/SalesmanPage.jsp");
        }
        else
        {
            error = "Salesman Login Failure! Please enter the correct password";
        }
    }
    else{
        if(MySqlDataStoreUtilities.checkUser(userid,password))
        {
            session.setAttribute("user",userid);  
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
            <h1><a href='BestDeal/Home.jsp'>Best<span>Deal</span></a></h1>
             <h2>Expert Service. Unbelievable Deals.</h2>
            </header>
            <nav>
    	        <ul>
    	        <li class='start selected'><a href='index.html'>Home</a></li>
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
                    <li class='end'><a href='trackOrder.html'>Track Order</a></li>
                    <li class='end'><a href='/BestDeal/LogOut.jsp'>Sign Out</a></li>
                    </ul>
                </nav>
                <img class='header-image' src='images/image.jpg' alt='Buildings' />
                <div id='body'>
                <section id='content'>
                <article class='expanded'>
                <h2>Hello <b><%= userid %></b></h2>
                </article>
                <p>Best Deal is the one stop solution to all the electronics for your house, office and public spaces. <br /><br />
                Our motto: Expert Service. Unbelievable Deals.</p>
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
            session.invalidate();
            error = "Login Failure! You must supply correct username and password";
        }
        } 
    }
%>