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
	
	public int getorderID(){
		return orderID;
	}
	
	public String getorderdate(){
		return orderdate;
	}
	
	public String getshipingaddress(){
		return shipingaddress;
	}
	
	public float gettotalprice(){
		return totalprice;
	}
	
	public float gettax(){
		return tax;
	}
	
	public double getamount(){
		return amount;
	}


}
