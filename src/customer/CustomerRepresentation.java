package customer;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name = "Customer")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "")
public class CustomerRepresentation {
	
	private String customerusername;
	private String customerfirstname;
	private String customerlastname;

	public CustomerRepresentation() {}

	public String getCustomerFirstname() {
		return customerfirstname;
	}

	public void setCustomerFirstname(String firstName) {
		this.customerfirstname = firstName;
	}

	public String getCustomerUsername() {
		return customerusername;
	}

	public void setCustomerUsername(String username) {
		this.customerusername = username;
	}

	public String getCustomerLastname() {
		return customerlastname;
	}

	public void setCustomerLastname(String lastName) {
		this.customerlastname = lastName;
	}

}
