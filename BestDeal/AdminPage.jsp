<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
         <html>
            <head>
            <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
            <title>BestDeal: Expert Service. Unbelievable Deals.</title>
            <link rel='stylesheet' href='styles.css' type='text/css' />
            </head>
            <body>
            <div id='container'>
            <header>
            <h1><a href='index.html'>Best<span>Deal</span></a></h1>
            <h2>Expert Service. Unbelievable Deals.</h2>
             <nav>
    	        <ul>
                    <li><a href='/BestDeal/DataAnalytics'>Data Analytics</a></li>
                    <li class='end'><a href='/BestDeal/login.html'>Sign Out</a></li>
                </ul>
                </nav>
                <br />
            <div class='panelHeader'>
            <b>Admin Panel</b>
            </div>
            </header>
            <p>Welcome <b>Admin</b>!</p>
            <a href='/BestDeal/AddProduct.html'>Add Products</a>
            <table>
            <tr>
            <th>ProductID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Type</th>
            <th>Brand</th>
            <th>Price</th>
            <th></th>
            </tr>

 <%@ page
import= "beans.Product, beans.SaxParser4BestDealXMLdataStore, java.io.*, javax.servlet.*, javax.servlet.http.*, java.util.*"%>

<%
    //List to hold product object
    List<Product> productsList = null;
       
    SaxParser4BestDealXMLdataStore dataStore = new SaxParser4BestDealXMLdataStore("/usr/local/Cellar/tomcat/8.5.5/libexec/webapps/BestDeal/WEB-INF/ProductCatalog.xml");
    productsList = dataStore.getProductList();
                            
    //Print Product information
        for(Product product : productsList)
        {
%>            
     <tr>
        <td contenteditable='true' ><%= product.id %></td>
        <td contenteditable='true'><%= product.name %></td>
        <td contenteditable='true'><%= product.description %></td>
        <td contenteditable='true'><%= product.type %></td>
        <td contenteditable='true'><%= product.brand %></td>
        <td contenteditable='true'><%= product.price %> "$"</td>
        <form class = 'button' method = 'get' action = '/BestDeal/DeleteProduct.jsp'>
        <input type = 'hidden' name = 'hiddenProductID' value = '<%= product.id %>>'>
        <td><input class = 'submit-button' type = 'submit' name = 'deleteButton' value = 'Delete'></form>  <input class = 'submit-button' type = 'submit' name = 'updateButton' value = 'Update'>
    </tr>
<%
        }
%>
     </table>
    <footer>
        <div class='footer-bottom'>
        <p>&copy; 2016 BestDeal. Prices and offers are subject to change. All rights reserved.</p>
        </div>
    </footer>
    </div>
    </body>
</html>