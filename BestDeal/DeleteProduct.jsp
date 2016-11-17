<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%@ page
import= "beans.User, beans.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*,
javax.xml.transform.*, org.w3c.dom.*, javax.xml.parsers.*"%>

<%
        String productIDToDelete = request.getParameter("hiddenProductID");
        
        try {
        //XML WRITER
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse("/BestDeal/ProductCatalog.xml");
        
        NodeList nodesList = document.getElementsByTagName("Product");
        
        if (nodesList != null && nodesList.getLength() > 0) {
                for (int i = 0; i < nodesList.getLength(); i++) {
                    Node node = nodesList.item(i);
                    if(node.getNodeType() == Node.ELEMENT_NODE) {
                        Element element = (Element) node;
                        Node removeNode = element.getElementsByTagName("id").item(0);
                        String id = removeNode.getChildNodes().item(0).getNodeValue();
                        if (id.equals(productIDToDelete)) {
                        node.getParentNode().removeChild(node);
                    }
                }
            }
        }
            
        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        DOMSource source = new DOMSource(document);
        StreamResult result = new StreamResult("/BestDeal/ProductCatalog.xml");
        transformer.transform(source, result);
        }
        catch (Exception e) {
            e.printStackTrace();
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
             <b>Product has been deleted successfully</b>
             </div>
            </header>
            <a href='/BestDeal/AdminPage.jsp'><h2>Back to Admin Panel</h2></a>
            <footer>
            <div class='footer-bottom'>
            <p>&copy; 2016 BestDeal. Prices and offers are subject to change. All rights reserved.</p>
            </div>
            </footer>
            </div>
            </body>
            </html>
