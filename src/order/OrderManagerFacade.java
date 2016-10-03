package order;

import product.Product;
import database.Databaseoperation;

public class OrderManagerFacade extends Databaseoperation{
	
	Order order;
	Product product = null;
	
	public OrderManagerFacade(){
		super();
	}
	
	public OrderManagerFacade (Order order)
	{
		this.order = order;
	}
	
	public void createOrder(){
		order = new Order(0, null, null, 0, 0, 0);
		
		int oID = order.getorderID(); 
		String odate = order.getorderdate(); 
		String oshipingaddres = order.getshipingaddress();
        float ototalprice = order.gettotalprice(); 
        float otax = order.gettax(); 
        double oamount = order.getamount();
        
		String addquery = "INSERT INTO order VALUES (" + oID + "," + odate +","+ oshipingaddres+ "," 
	               + ototalprice+","+otax+","+oamount+")";
	
	super.accessDatabase(addquery);
	}
	
	public void payOrder(){
		//TO DO
	}
	
	public void fullfillOrder(){
		//TO DO
	}
	
	public void shipOrder(){
		//TO DO
	}
	
	public void cancelOrder(){
		String deletequery = "DELETE FROM order WHERE orderID = ?;"; 
		super.accessDatabase(deletequery);
	}

	public void refund(){
		//TO DO
	}
	
	public void getOrderStatus(){
		String searchquery = "SELECT OrderStatus FROM order where orderID = ?;"; 

        super.accessDatabase(searchquery);
	}
	
	public void getProductDetail(){
		String searchquery = "SELECT ProductName, ProductDecription, ProductPrice ProductOwner FROM product where ProductID = ?;";               

        super.accessDatabase(searchquery);
	}
	
	public void getCustomerDetail(){
		String searchquery = "SELECT Username, Firstname, LastName, Address, PhoneNumber, Email FROM customer where Username = ?;";               

        super.accessDatabase(searchquery);
	}
}
