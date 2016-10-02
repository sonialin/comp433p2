package product;

public class Product {
	
	int productID;
	String productname;
	String productdecription;
	float productprice;
	int productownerID;
	int productquantity;
	
	public Product(	int productID, String productname, String productdecription,
			        float productprice, int productownerID, int productquantity){
		this.productID = productID;
		this.productname = productname;
		this.productdecription = productdecription;
		this.productprice = productprice;
		this.productownerID = productownerID;
		this.productquantity = productquantity;
		
	}
	
	public void setProductInfo(){
		
		}
	
	public int getProductID(){
		return productID;
	}
	
	public String getproductname(){
		return productname;
	}
	
	public String getproductdecription(){
		return productdecription;
	}
	
	public float getproductprice(){
		return productprice;
	}
	
	public int getproductownerID(){
		return productownerID;
	}
	
	public int getproductquantity(){
		return productquantity;
	}

}


