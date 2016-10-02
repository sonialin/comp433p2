package product;

import database.Databaseoperation;
import order.Order;
import partner.Partner;

/**
 * This class is managing the activities related to Product
 */
public class ProductManagerFacade extends Databaseoperation{
	
	Product product = null;
	Order order;
	Partner partner;
	
	
	public ProductManagerFacade(Product product)
	{
		this.product = product;
	}

     /**
      * addProduct
      */
	public void addProduct(){
		product = new Product(0, null, null, 0, 0, 0);   //fetch from addproductlist.txt
		
		int pID = product.getProductID(); 
		String pname = product.getproductname(); 
		String pdecription = product.getproductdecription();
        float pprice = product.getproductprice(); 
        int pownerID = product.getproductownerID();
        int pquantity = product.getproductquantity();
        
        //INSERT INTO  Student VALUES (pID,pname,pdecription,pprice,pownerID,pquantity);
        
		String addquery = "INSERT INTO product VALUES (" + pID + "," + pname +","+ pdecription+ "," 
		               + pprice+","+pownerID+","+pquantity+")";
		
		super.accessDatabase(addquery);
	}
	
    /**
     * deleteProduct
     */
	public void deleteProduct(){
		String deletequery = "DELETE FROM product WHERE productID = ?;";  // productID will get from keyboard input
		super.accessDatabase(deletequery);
	}
	
    /**
     * searchProduct
     */	
	public void searchProduct(){
		String searchquery = "SELECT ProductName, ProductDecription, ProductPrice FROM product where ProductName like "
	                         + "'%?%'"+";";               //the search key words will get from keyboard input
		
		super.accessDatabase(searchquery);
	}
	
    /**
     * checckAvailability
     */	
	public void checckAvailability(){
		String checckavailabilityquery = "SELECT Productquantity FROM product where ProductName like "
                + "'%?%'"+";";
		super.accessDatabase(checckavailabilityquery);
	}
	
	/**
     * buyproduct, that means submitorder
     */
	public void buyProduct(){
		order.submitOrder();  
	}
	
	/**
     * getProductOwner
     */
	public void getProductOwner(){
		String getownerquery = "SELECT ProductOwner_ProductOwnerID FROM product where ProductID=?;";
		super.accessDatabase(getownerquery);
	}

}

