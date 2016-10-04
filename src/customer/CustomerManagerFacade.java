package customer;

import database.Databaseoperation;
import order.Order;

public class CustomerManagerFacade extends Databaseoperation{
	
	Order order;
	
	public CustomerManagerFacade(){
		super();
	}
	
	public void addCustomer(){
		//get sigh up information from web service and then insert record into database
		//will complete in Project3
	}	
	public void deleteCustomer(){
		if(verifyCustomer())
		{
		String deletequery = "DELETE FROM product WHERE Customerusername = ?;";  // productID will get from keyboard input
		super.accessDatabase(deletequery);
		}
		else
			System.out.println("Sorry, you are not able to delete this Customer");
	}
	
	/**
	 * Verify if cutomer's username matches password when login
	 * @return
	 */
	public Boolean verifyCustomer(){
		return null;
		
	}
	
	public void addCustomerProfile(){
		
		//update customer information in databases
		
	}
	
	/**
	 * Get Order Details customers submitted from database
	 */
	public void getOrderDetail(){
		
		int orID = order.getorderID();
		String getorderquery = "SELECT o.OrderID, o.Customer_Username,o.OrderPrice, o.OrderStatus, "
								+"o.OrderDate, o.Shipping Address, cl.CartLineItemQuantity, cl.CartLineItemPrice,"
								+"c.CartPrice, c.Tax " 
                                +"FROM Order as o, Cartlineitem as cl, Cart as c"
								+"WHERE c.CartID = cl.Cart_CartID AND o.OrderID = c.Order_OrderID AND o.orderID = "+ orID;
		super.accessDatabase(getorderquery);
}
}
