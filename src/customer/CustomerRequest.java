package customer;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "")
public class CustomerRequest {
	
	private String customerfirstname;
	private String customerlastname;
	
	public CustomerRequest() {}
	
	public String getCustomerFirstname() {
		return customerfirstname;
	}
	
	public void setCustomerFirstname(String firstName) {
		this.customerfirstname = firstName;
	}
	
	public String getCustomerLastname() {
		return customerlastname;
	}
	
	public void CustomerLastname(String lastName) {
		this.customerlastname = lastName;
	}

}
