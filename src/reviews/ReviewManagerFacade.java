package reviews;

import database.Databaseoperation;

public class ReviewManagerFacade extends Databaseoperation{

	/**
	 * This class manages reviews for puoducts from cutomers
	 */
	public ReviewManagerFacade(){
		super();
	}
	
	public void writeReview(){
		
		String reviewcontent;
		int rate;
		
		String witereviewquery = "//insert into productreview VALUES(max(productreview)+1, reviewcontent, rate, date, productID, customerusername )";
				
		super.accessDatabase(witereviewquery);		
				

	}
	
	public void displayReview(){
		
		String dispalyreviewquery = "Select * from ProductReview where Poductname = ?";
		super.accessDatabase(dispalyreviewquery);
		
	}
	
	

}
