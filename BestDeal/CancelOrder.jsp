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
            <div class='panelHeader'>
            <b>Order Status</b>
            </div>
            </header>
            <table>
            <tr>

<%@ page
import= "beans.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, java.text.*, javax.servlet.http.*, java.util.*"%>

<%
        java.util.Date d = null;
        java.util.Date orderDate = null;
        String orderIDToDelete = request.getParameter("orderID");
        String orderDeliveryDate = request.getParameter("orderDeliveryDate");
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        String todayDate = dateFormat.format(date.getTime());
         
        try {
         d = dateFormat.parse(todayDate);
         orderDate = dateFormat.parse(orderDeliveryDate);
        }
        catch(Exception e){}
        
        Calendar cal = Calendar.getInstance();
		 cal.setTime(orderDate);
		 cal.add(Calendar.DATE,-5);
         
          if(cal.getTime()!=d)
            {
                MySqlDataStoreUtilities.cancelOrder(orderIDToDelete);  
%>
        <td>Your Order# <%= orderIDToDelete %> has been cancelled!</td>
       
<%
      	  }
      	  else
      	  {
%>
      	      <td>Your Order# <%= orderIDToDelete %> cannot be cancelled as it is nearing delivery!</td>
<%
      	  }
%>      	  
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