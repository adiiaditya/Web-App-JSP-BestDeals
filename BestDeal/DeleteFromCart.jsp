<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%@ page
import= "beans.User, beans.MySqlDataStoreUtilities, beans.ShoppingCart, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%
    List<String> productDetailsList = null;
    HashMap<String, List<String>> productsInCart = null;
     
   String productID = request.getParameter("hiddenDelProdID");
        
    ShoppingCart cart;
    synchronized(session) {
    cart = (ShoppingCart) session.getAttribute("ShoppingCart");
    if (cart == null) {
        cart = new ShoppingCart();
        session.setAttribute("ShoppingCart", cart);
    }
    cart.deleteFromCart(productID);
    session.setAttribute("ShoppingCart", cart);
    cart = (ShoppingCart) session.getAttribute("ShoppingCart");
    productsInCart = cart.getProductsInCart();
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
            <h1><a href='BestDeal/Home.jsp'>Best<span>Deal</span></a></h1>
             <h2>Expert Service. Unbelievable Deals.</h2>
            <div class='panelHeader'>
            <b>Shopping Cart</b>
            </div>
            </header>
            <table>
            <tr>
            <th>ProductID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th></th>
            </tr>
<%            
         for (HashMap.Entry<String, List<String>> entry : productsInCart.entrySet()) {
            String key = entry.getKey();
            List<String> values = entry.getValue();
%>
            <tr>
            <td><%= values.get(0) %></td>
            <td><%= values.get(1) %></td>
            <td><%= values.get(2) %></td>
            <td><form method = 'get' action = '/BestDeal/DeleteFromCart.jsp' ''><input type='hidden' name='hiddenDelProdID' value='<%= key %>'><input class = 'submit-button' type = 'submit' name = 'deleteButton' value = 'Delete'></form></td>
            </tr>
<%
            }
%>
             </table>
            <a href='/BestDeal/Home.jsp'>Continue Shopping</a>
            </br></br>
            <form class = 'submit-button' method = 'get' action = '/BestDeal/Checkout.jsp'>
            <input class = 'submit-button' type = 'submit' name = 'checkout' value = 'Checkout?'>
            </form>
              <footer>
             <div class='footer-bottom'>
             <p>&copy; 2016 BestDeal. Prices and offers are subject to change. All rights reserved.</p>
             </div>
             </footer>
             </div>
             </body>
             </html>
    
