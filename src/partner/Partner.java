package partner;

public class Partner {
	
	int partnerID;
	String partnerusername;
	String partnerpassword;
	String partnertype;
    String partnername;
    String partneraddress;
    String partnerphonenumber;
    
	public Partner(	int partnerID, String partnerusername, String partnerpassword, String partnertype, String partnername, String partneraddress, String partnerphonenumber){
		this.partnerID = partnerID;
		this.partnerusername = partnerusername;
		this.partnerpassword = partnerpassword;
		this.partnertype = partnertype;
		this.partnername=partnername;
		this.partneraddress=partneraddress;
		this.partnerphonenumber=partnerphonenumber;
	}
	
	public int getpartnerID(){
		return partnerID;
	}
	
	public String getpartnerusername(){
		return partnerusername;
	}
	
	public String getpartnerpassword(){
		return partnerpassword;
	}
	
	public String getpartnertype(){
		return partnertype;
	}
	
	public String getpartnername(){
		return partnername;
	}
	
	public String getpartneraddress(){
		return partneraddress;
	}
	
	public String getpartnerphonenumber(){
		return partnerphonenumber;
	}

    
}
