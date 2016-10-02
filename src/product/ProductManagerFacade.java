package product;

import database.Databaseoperation;
import order.Order;
import partner.Partner;

public class ProductManagerFacade {
	
	Product product = null;
	Order order;
	Partner partner;
	Databaseoperation dataoprt;
	
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
		
		dataoprt.accessDatabase(addquery);
	}
	
	public void deleteProduct(){
		String deletequery = "DELETE FROM product WHERE productID = ?;";  // productID will get from keyboard input
		dataoprt.accessDatabase(deletequery);
	}
	
	public void searchProduct(){
		String searchquery = "SELECT ProductName, ProductDecription, ProductPrice FROM product where ProductName like "
	                         + "'%?%'"+";";               //the search key words will get from keyboard input
		
		dataoprt.accessDatabase(searchquery);
	}
	
	public void checckAvailability(){
		String checckavailabilityquery = "SELECT Productquantity FROM product where ProductName like "
                + "'%?%'"+";";
		dataoprt.accessDatabase(checckavailabilityquery);
	}
	
	public void buyProduct(){
		order.submitOrder();  
	}
	
	public void getProductOwner(){
		String getownerquery = "SELECT ProductOwner_ProductOwnerID FROM product where ProductID=?;";
		dataoprt.accessDatabase(getownerquery);
	}

}

