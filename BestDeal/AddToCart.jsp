<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%@ page
import= "beans.User, beans.MySqlDataStoreUtilities, beans.ShoppingCart, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*"%>

<%    
    //List to hold product object
    List<String> productDetailsList = null;
    HashMap<String, List<String>> productsInCart = null;
    
    String productID = request.getParameter("hiddenProductID");
    String productName = request.getParameter("hiddenProductName");
    String productPrice = request.getParameter("hiddenProductPrice");
    String manfRebate = request.getParameter("hiddenManfRebate");
        
    productDetailsList = new ArrayList<String>();
    productDetailsList.add(productID);
    productDetailsList.add(productName);
    productDetailsList.add(productPrice);
    productDetailsList.add(manfRebate);
        
    if(request.getSession(false) != null) {
    ShoppingCart cart;
    synchronized(session) {
    cart = (ShoppingCart)session.getAttribute("ShoppingCart");
    // New visitors get a fresh shopping cart.
    // Previous visitors keep using their existing cart.
    if (cart == null) {
        cart = new ShoppingCart();
        session.setAttribute("ShoppingCart", cart);
    }
    cart.addToCart(productID, productDetailsList);
    session.setAttribute("ShoppingCart", cart);
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
         for(HashMap.Entry<String, List<String>> entry : productsInCart.entrySet())
         {
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
            <input type = 'hidden' name = 'hiddenProductID' value='<%= productID %>'>
            <input type = 'hidden' name = 'hiddenProductName' value='<%= productName %>'>
            <input type = 'hidden' name = 'hiddenProductPrice' value='<%= productPrice %>'>
            <input type = 'hidden' name = 'hiddenManfRebate' value='<%= manfRebate %>'>
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
            <b>WARNING</b>
            </div>
            </header>
            <h2>Kindly login to add items to the cart!</h2>
            <a href='/BestDeal/login.html'>Login</a>
            </br></br>
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