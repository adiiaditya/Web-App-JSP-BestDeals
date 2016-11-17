<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<%@ page
import= "beans.User, beans.MySqlDataStoreUtilities, java.io.*, javax.servlet.*, javax.servlet.http.*, java.text.*, java.lang.Math.*, java.util.*,
javax.xml.transform.*, org.w3c.dom.*, javax.xml.parsers.*"%>

<%    
    Product product = null;
    List<Product> productsList = null;
    
    String newProductID = request.getParameter("productID");
    String newProductName = request.getParameter("productName");
    String newProductDesc = request.getParameter("productDesc");
    String newProductType= request.getParameter("productType");
    String newProductBrand = request.getParameter("productBrand");
    String newProductPrice = request.getParameter("productPrice");
    String newManfRebate = request.getParameter("manfRebate");
        
    product = new Product();
    product.setId(newProductID);
    product.setName(newProductName);
    product.setDescription(newProductDesc);
    product.setType(newProductType);
    product.setBrand(newProductBrand);
    product.setPrice(Double.parseDouble(newProductPrice));
    product.setManfRebate(Double.parseDouble(newManfRebate));
    product.setRetailer("BestDeal");
    product.setImage("");
        

        try {
        //XML WRITER
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse("/usr/local/Cellar/tomcat/8.5.5/libexec/webapps/BestDeal/WEB-INF/ProductCatalog.xml");
        Element root = document.getDocumentElement();
        
        productsList = new ArrayList<Product>();
        productsList.add(product);

        for (Product product : productsList) {
            // product elements
            Element newProduct = document.createElement("Product");
            
            Element eId = document.createElement("id");
            eId.appendChild(document.createTextNode(newProductID));
            newProduct.appendChild(eId);
            
            Element eName = document.createElement("name");
            eName.appendChild(document.createTextNode(newProductName));
            newProduct.appendChild(eName);

            Element eType = document.createElement("type");
            eType.appendChild(document.createTextNode(newProductType));
            newProduct.appendChild(eType);

            Element eRetailer = document.createElement("retailer");
            eRetailer.appendChild(document.createTextNode("BestDeal"));
            newProduct.appendChild(eRetailer);
            
            Element eBrand = document.createElement("brand");
            eBrand.appendChild(document.createTextNode(newProductBrand));
            newProduct.appendChild(eBrand);
            
            Element ePrice = document.createElement("price");
            ePrice.appendChild(document.createTextNode(newProductPrice));
            newProduct.appendChild(ePrice);
            
            Element eManfRebate = document.createElement("manfrebate");
            eManfRebate.appendChild(document.createTextNode(newManfRebate));
            newProduct.appendChild(eManfRebate);
            
            Element eDesc = document.createElement("description");
            eDesc.appendChild(document.createTextNode(newProductDesc));
            newProduct.appendChild(eDesc);
            
            Element eImage = document.createElement("image");
            eImage.appendChild(document.createTextNode(""));
            newProduct.appendChild(eImage);

            root.appendChild(newProduct);
        }

        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        DOMSource source = new DOMSource(document);
        StreamResult result = new StreamResult("/usr/local/Cellar/tomcat/8.5.5/libexec/webapps/BestDeal/WEB-INF/ProductCatalog.xml");
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
             <b>Product has been added successfully</b>
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