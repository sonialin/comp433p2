package customer;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import customer.Customer;
import customer.CustomerManagerFacade;
import customer.CustomerDAO;
import customer.CustomerRepresentation;

public class CustomerActivity {

	private static CustomerManagerFacade cmf = new CustomerManagerFacade();
	
	public Set<CustomerRepresentation> getCustomers() {
		
		Set<Customer> customers = new HashSet<Customer>();
		Set<CustomerRepresentation> customerRepresentations = new HashSet<CustomerRepresentation>();
		
		customers = cmf.getAllCustomers();
		
		Iterator<Customer> it = customers.iterator();
		while(it.hasNext()) {
          Customer cus = (Customer)it.next();
          CustomerRepresentation customerRepresentation = new CustomerRepresentation();
          customerRepresentation.setCustomerUsername(cus.getCustomerUsername());
          customerRepresentation.setCustomerFirstname(cus.getCustomerFirstname());
          customerRepresentation.setCustomerLastname(cus.getCustomerLastname());
          
          //now add this representation in the list
          customerRepresentations.add(customerRepresentation);
        }
		return customerRepresentations;
	}
	
	public CustomerRepresentation getCustomer(String username) {
		
		Customer cus = cmf.getCustomer(username);
		
		CustomerRepresentation cusRep = new CustomerRepresentation();
		cusRep.setCustomerFirstname(cus.getCustomerFirstname());
		cusRep.setCustomerLastname(cus.getCustomerLastname());
		cusRep.setCustomerUsername(cus.getCustomerUsername());
		
		return cusRep;
	}
	
	public CustomerRepresentation createCustomer(String firstName, String lastName, String username) {
		
		Customer cus = cmf.addCustomer(firstName, lastName, username);
		
		CustomerRepresentation cusRep = new CustomerRepresentation();
		cusRep.setCustomerFirstname(cus.getCustomerFirstname());
		cusRep.setCustomerLastname(cus.getCustomerLastname());
		cusRep.setCustomerUsername(cus.getCustomerUsername());
		
		return cusRep;
	}
	
	public String deleteCustomer(String username) {
		
		cmf.deleteCustomer(username);
		
		return "OK";
	}
	
}
