package order;

public class Order {
	int orderID;
	String orderdate;
	String shipingaddress;
	float totalprice;
	float tax;
	double amount;
	
	public Order(	int orderID, String orderdate, String shipingaddress, float totalprice, float tax, double amount){
		this.orderID = orderID;
		this.orderdate = orderdate;
		this.shipingaddress = shipingaddress;
		this.totalprice = totalprice;
		this.tax=tax;
		this.amount=amount;
	}
	
	public void getOrderInfo(){
		//TO DO
	}
	
	public void setOrderInfo(){
		//TO DO
	}

}
