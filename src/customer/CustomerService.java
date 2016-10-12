package customer;


import java.util.Set;

import javax.jws.WebService;

import customer.CustomerRepresentation;
import customer.CustomerRequest;

@WebService
public interface CustomerService {
	   
	public Set<CustomerRepresentation> getCustomers();
	public CustomerRepresentation getCustomer(String username);
	public CustomerRepresentation createCustomer(CustomerRequest customerRequest);

}
