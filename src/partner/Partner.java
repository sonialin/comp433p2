package partner;

public class Partner {
	
	int partnerID;
	String partnerusername;
	String partnerpassword;
	String partnertype;
    String partnername;
    String partnerphonenumber;
    
	public Partner(	int partnerID, String partnerpassword, String partnertype, String partnername, String partneraddress, String partnerphonenumber){
		this.partnerID = partnerID;
		this.partnerusername = partnerusername;
		this.partnerpassword = partnerpassword;
		this.partnertype = partnertype;
		this.partnername=partnername;
		this.partnerphonenumber=partnerphonenumber;
	}
	
	public void getPartnerInfo(){
		//TO DO
	}
	
	public void setPartnerInfo(){
		//TO DO
	}
    
}
