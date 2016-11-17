<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%@ page
import= "beans.User, beans.Order, beans.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
    //List to hold order object
    List<Order> ordersList = MySqlDataStoreUtilities.listAllOrders();
     List<User> usersList = MySqlDataStoreUtilities.listAllUsers();
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
             <b>Salesman Panel</b>
             </div>
             </header>
            <form class = 'button' method = 'get' action = 'login.html'>
            <p>Welcome <b>Salesman</b>! <input style='float: right;' class = 'submit-button' type = 'submit' name = 'signout' value = 'Sign Out'></p>
            <br/>
            </form>
            <section>
             <h3>List Of Orders:</h3>
             <a href=''>Create New Order</a>
            <table>
            <tr>
            <th>OrderID</th>
            <th>UserName</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Address</th>
            <th>Phone Number</th>
            <th>Order Date</th>
            <th>Delivery Date</th>
            <th>Total</th>
            <th></th>
            </tr>
<%           
            //Print Order information
            for(Order order : ordersList)
            {
%>
            <tr>
            <td><%= order.orderid %></td>
            <td><%= order.uname %></td>
            <td><%= order.fname %></td>
            <td><%= order.lname %></td>
            <td><%= order.address %> <%= order.city %> <%= order.state %> <%= order.zip %></td>
            <td><%= order.pnumber %></td>
            <td><%= order.orderDate %></td>
            <td><%= order.delDate %></td>
            <td><%= order.orderTotal %>$</td>
            <td><form method='post' action='/BestDeal/CancelOrder.jsp'>
            <input type='hidden' name ='orderID' value='<%= order.orderid %>'>
            <input type='hidden' name ='orderDeliveryDate' value='<%= order.delDate %>'>
            <input class = 'submit-button' type = 'submit' name = 'cancelOrderButton' value = 'Cancel'></form></td>
            </tr>
<%
            }
%>       

             </table>
            <br />
            <fieldset>
            <legend>Update Order</legend>
            <form method='post' action='/BestDeal/UpdateOrder.jsp'>
            <span>Enter the orderID to be Updated</span>
            <table>
            <tr>
            <td> Order Id: </td>
            <td> <input required type='text' id='orderID' name='orderID' /> </td>
            </tr>
            <tr>
            <td> First name: </td>
            <td> <input required type='text' name='firstName' /> </td>
            </tr>
            <tr>
            <td> Last name: </td>
            <td> <input required type='text' name='lastName'/> </td>
            </tr>
            <tr>
            <td> Street Address: </td>
            <td> <input required type='text' name='address'/></td>
            </tr>
            <tr>
            <td> City: </td>
            <td> <input required type='text' name='city' /></td>
            </tr>
            <tr>
            <td> State: </td>
            <td> <input required type='text' name='state' /></td>
            </tr>
            <tr>
            <td> Zipcode: </td>
            <td> <input required type='text' name='zip' /></td>
            </tr>        
            <tr>
            <td> Phone: </td>
            <td> <input required type='text' name='phoneNumber' /></td>
            </tr>
            </table>
            <center><input class = 'submit-button' type = 'submit' name = 'updateOrderButton' value = 'Update Order' /></center>
            </form>
            </fieldset>
            </section>
            <footer>
            <div class='footer-bottom'>
            <p>&copy; 2016 BestDeal. Prices and offers are subject to change. All rights reserved.</p>
            </div>
            </footer>
            </div>
            </body>
            </html>