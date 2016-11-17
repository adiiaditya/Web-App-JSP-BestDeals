<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page
import= "beans.User, beans.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
    String name = request.getParameter("name");
    String userID = request.getParameter("username");
    String password = request.getParameter("password");
        
    boolean uniqueUser = MySqlDataStoreUtilities.validateUniqueUser(userID);
        
    if(uniqueUser == true)
    {
        MySqlDataStoreUtilities.insertUser(name, userID, password);
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
            <h2> Hello <%= name %>! </h2>
            <br>
            <a href='login.html'><h2>Sign In<h2></a>
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
            <h2>Username already exists! Kindly try logging in or register with a different username.</h2>
            <br>
            <a href='login.html'><h2>Sign In<h2></a>
            <a href='registration.html'><h2>Register<h2></a>
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
