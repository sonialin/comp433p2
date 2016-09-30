package product;

public class Product {
	
	int productID;
	String productname;
	String productdecription;
	float productprice;
	
	public Product(	int productID, String productname, String productdecription,float productprice){
		this.productID = productID;
		this.productname = productname;
		this.productdecription = productdecription;
		this.productprice = productprice;
		
	}
	
	public void getProductInfo(){
		//TO DO
		//mySQL operation 
		//query "select * from product"
	}
	

}


