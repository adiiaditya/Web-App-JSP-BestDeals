<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page
import= "beans.User, beans.MySqlDataStoreUtilities, beans.ShoppingCart, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
			//Get the values from the form
			String prodIDs = request.getParameter("hiddenProductIDs");
			String userName = request.getParameter("hiddenUserName");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String phoneNumber = request.getParameter("phoneNumber");
			String prodTotal = request.getParameter("hiddenOrderTotal");
			String creditCard = request.getParameter("creditcard");
			
       	    if(request.getSession(false) != null) {
       	    	
       	    	ShoppingCart cart = new ShoppingCart();
       	    	 session.setAttribute("ShoppingCart", cart);
       	    }

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   		//get current date time with Date()
	   		java.util.Date date = new java.util.Date();
	   		String orderDate = dateFormat.format(date.getTime());

	   		Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			cal.add(Calendar.DATE, 14);  // add 14 days
	   		String expDeliveryDate = dateFormat.format(cal.getTime());

	   		Random r = new Random();
			int low = 10000;
			int high = 99999;
			int orderID = r.nextInt(high-low) + low;										
			
			java.sql.Date sqlOrderDate =  java.sql.Date.valueOf(orderDate);
            java.sql.Date sqlDeliveryDate =  java.sql.Date.valueOf(expDeliveryDate);
			
			MySqlDataStoreUtilities.insertOrder(prodIDs, orderID, userName, firstName, lastName, address, city, state, zip, phoneNumber, prodTotal, creditCard, sqlOrderDate, sqlDeliveryDate);
			
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
             <b>Order Summary</b>
             </div>
             </header>
              <table>
               <tr>
                   	<td>OrderID: </td>
                    <td><%= orderID %></td>
                	</tr>
                	<tr>
                    <td>FirstName: </td>
                    <td><%= firstName %></td>
                	</tr>
                	<tr>
                    <td>LastName: </td>
                    <td><%= lastName %></td>
                	</tr>
                	<tr>
                    <td>Complete Address: </td>
                    <td><%= address %>  <%= city %>  <%= state %>  <%= zip %></td>
                	</tr>
                	<tr>
                    <td>Phone Number: </td>
                    <td><%= phoneNumber %></td>
                	</tr>
                	<tr>
                    <td>Order Date: </td>
                    <td><%= orderDate %></td>
                	</tr>
                	<tr>
                    <td>Expected Delivery Date: </td>
                    <td><%= expDeliveryDate %></td>
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