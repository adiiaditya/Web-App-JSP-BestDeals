<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page
import= "beans.Order, beans.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
	//List to hold order object
	List<Order> ordersList = new ArrayList<Order>();
    try {
      String orderID = request.getParameter("trackOrderID");
      ordersList = MySqlDataStoreUtilities.trackOrder(orderID);
         
      String orderPlacer = ordersList.get(0).uname;
         
     if(request.getSession(false).getAttribute("user").equals(orderPlacer)) {         
        java.sql.Date orderDate = ordersList.get(0).orderDate;
        java.sql.Date expectedDeliveryDate = ordersList.get(0).delDate;
        String uName = ordersList.get(0).uname;
        String firstName = ordersList.get(0).fname;
        String lastName = ordersList.get(0).lname;
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
                <form method='get' action='/BestDeal/CancelOrder.jsp'>
                    <tr>
                    <td>OrderID: </td>
                    <td><%= orderID %></td>
                	</tr>
                	<tr>
                    <td> Usename: </td>
                    <td><%= uName %></td>
                	</tr>
                	<tr>
                    <td>Order Date: </td>
                    <td><%= orderDate %></td>
                	</tr>
                	<tr>
                    <td>Expected Delivery Date: </td>
                    <td><%= expectedDeliveryDate %></td>
                	</tr>
                	<tr>
                	<input type='hidden' name='orderID' value='<%= orderID %>'>
                	<input type='hidden' name='orderPlacer' value='<%= orderPlacer %>'>
                	<input type='hidden' name='orderDeliveryDate' value='<%= expectedDeliveryDate %>'>
                	<center><input class = 'submit-button' type = 'submit' name = 'cancelButton' value = 'Cancel Order'></center>
                    </tr>
                </form>
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
             <div class='panelHeader'>
             <b>Order Status</b>
             </div>
             </header>
             <table>
                <tr>
                    <td>You have no such order!</td>
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
<%
        }
        }
        catch(Exception ex)
        {
        }
%>