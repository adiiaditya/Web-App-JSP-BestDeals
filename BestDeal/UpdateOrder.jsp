<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page
import= "beans.Order, beans.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
     String orderIDToUpdate = request.getParameter("orderID");
     String fName = request.getParameter("firstName");
     String lName = request.getParameter("lastName");
     String address = request.getParameter("address");
     String city = request.getParameter("city");
     String state = request.getParameter("state");
     String zip = request.getParameter("zip");
     String pNumber = request.getParameter("phoneNumber");
     
     MySqlDataStoreUtilities.updateOrder(Integer.parseInt(orderIDToUpdate), fName, lName, address, city, state, zip, pNumber);  
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
     <div class='panelHeader'>
     <b>Order Status</b>
     </div>
     </header>
     <table>
     <tr>
     <td>The Order# <%= orderIDToUpdate %> has been updated!</td>
     </tr>
     </table>
     <a href='/BestDeal/Home.jsp'>Return to Home Page</a>
	 <footer>
     <div class='footer-bottom'>
     <p>&copy; 2016 BestDeal. Prices and offers are subject to change. All rights reserved.</p>
     </div>
     </footer>
     </div>
     </body>
     </html>
