package partner;

import database.Databaseoperation;
import product.Product;

public class PartnerManagerFacade extends Databaseoperation{
	
	Partner partner;
	Product product = null;
	
	public PartnerManagerFacade(){
		super();
	}
	
	public PartnerManagerFacade(Partner partner)
	{
		this.partner = partner;
	}
	
	public void addPartner(){
		partner = new Partner(0, null, null, null, null, null, null);
		
		int pID= partner.getpartnerID();
		String pusername = partner.getpartnerusername();
		String ppassword = partner.getpartnerpassword();
		String ptype= partner.getpartnertype();
		String pname= partner.getpartnername();
		String paddress = partner.getpartneraddress();
		String pphonenumber = partner.getpartnerphonenumber();
		
		String addquery = "INSERT INTO partner VALUES (" + pID + "," + pusername + "," + ppassword +","+ ptype+ "," 
	               + pname+","+paddress+","+pphonenumber+")";
	
	super.accessDatabase(addquery);
		
	}

	public void deletePartner(){
		String deletequery = "DELETE FROM partner WHERE partnerID = ?;"; 
		super.accessDatabase(deletequery);
	}
	
	public void verifyPartner(){
		String verifyquery = "SELECT PartnerName FROM partner where partnerID = ?;"; 
		super.accessDatabase(verifyquery);
	}
	
	public void notifyPartnersofsale(){
		//TO DO
	}
	
	public void addPartnerProducts(){
         // productowner.addproduct();
	}
	
	public void settleAccount(){
		//TO DO
	}
	
	public void generateReport(){
		//TO DO
	}
}
