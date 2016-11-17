package beans;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.*;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SaxParser4BestDealXMLdataStore extends DefaultHandler {
    
    //List to hold product object
    private static Product product = null;
    private List<Product> productsList = null;

    String productXmlFileName;
    String elementValueRead;
        
    public SaxParser4BestDealXMLdataStore(String productXmlFileName) {
        this.productXmlFileName = productXmlFileName;
        parseDocument();
    } 

    private void parseDocument() {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        try {
            SAXParser parser = factory.newSAXParser();
            parser.parse(productXmlFileName, this);
            } catch (ParserConfigurationException e) {
            System.out.println("ParserConfig error");
        } catch (SAXException e) {
            System.out.println("SAXException : xml not well formed");
        } catch (IOException e) {
            System.out.println("IO error");
        }
    } 

////////////////////////////////////////////////////////////

/*************

There are a number of methods to override in SAX handler  when parsing your XML document :

    Group 1. startDocument() and endDocument() :  Methods that are called at the start and end of an XML document. 
    Group 2. startElement() and endElement() :  Methods that are called  at the start and end of a document element.  
    Group 3. characters() : Method that is called with the text content in between the start and end tags of an XML document element.


There are few other methods that you could use for notification for different purposes, check the API at the following URL:

https://docs.oracle.com/javase/7/docs/api/org/xml/sax/helpers/DefaultHandler.html

***************/

////////////////////////////////////////////////////////////

    @Override
    public void startElement(String str1, String str2, String elementName, Attributes attributes) throws SAXException {

        if (elementName.equalsIgnoreCase("Product")) {
            //create a new Product and put it in Map
            product = new Product();
            product.setId(attributes.getValue("id"));
            product.setRetailer(attributes.getValue("retailer"));
            product.setType(attributes.getValue("type"));
            //initialize list
            if(productsList == null)
                productsList = new ArrayList<>();
        }
    }

    @Override
    public void endElement(String str1, String str2, String element) throws SAXException {
 
        if (element.equals("Product")) {
            //add Product object to list
            productsList.add(product);
	    return;
        }
        if (element.equalsIgnoreCase("id")) {
            product.setId(elementValueRead);
	    return;
        }
        if (element.equalsIgnoreCase("retailer")) {
            product.setRetailer(elementValueRead);
	    return;
        }
        if (element.equalsIgnoreCase("type")) {
            product.setType(elementValueRead);
	    return;
        }
        if (element.equalsIgnoreCase("image")) {
            product.setImage(elementValueRead);
	    return;
        }
        if (element.equalsIgnoreCase("name")) {
            product.setName(elementValueRead);
	    return;
        }
        if (element.equalsIgnoreCase("brand")) {
            product.setBrand(elementValueRead);
	    return;
        }
        if(element.equalsIgnoreCase("price")){
            product.setPrice(Double.parseDouble(elementValueRead));
	    return;
        }
        if(element.equalsIgnoreCase("manfRebate")){
            product.setManfRebate(Double.parseDouble(elementValueRead));
	    return;
        }
        if (element.equalsIgnoreCase("description")) {
            product.setDescription(elementValueRead);
	    return;
        }
    }

    @Override
    public void characters(char[] content, int begin, int end) throws SAXException {
        elementValueRead = new String(content, begin, end);
    }


    /////////////////////////////////////////
    // 	     Kick-Start SAX in main       //
    ////////////////////////////////////////

    public static void main(String[] args) { 
         //   new SaxParser4BestDealXMLdataStore("/usr/local/Cellar/tomcat/8.5.5/libexec/webapps/BestDeal/csj/WEB-INF/ProductCatalog.xml");
    }
    
  //getter method for product list
    public List<Product> getProductList() {
        return productsList;
    }
}