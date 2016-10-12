package customer;


import java.util.Set;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.CacheControl;

import customer.CustomerRepresentation;
import customer.CustomerRequest;
import customer.CustomerActivity;

@Path("/customerservice/")
public class CustomerResource implements CustomerService {

	@GET
	@Produces({"application/xml" , "application/json"})
	@Path("/customer")
	//@Cacheable(cc="public, maxAge=3600") example for caching
	public Set<CustomerRepresentation> getCustomers() {
		System.out.println("GET METHOD Request for all customers .............");
		CustomerActivity cusActivity = new CustomerActivity();
		return cusActivity.getCustomers();	
	}
	
	@GET
	@Produces({"application/xml" , "application/json"})
	@Path("/customer/{customerusername}")
	public CustomerRepresentation getCustomer(@PathParam("customerusername") String username) {
		System.out.println("GET METHOD Request from Client with customerRequest String ............." + id);
		CustomerActivity cusActivity = new CustomerActivity();
		return cusActivity.getCustomer(username);
	}
	
	@POST
	@Produces({"application/xml" , "application/json"})
	@Path("/customer")
	public CustomerRepresentation createCustomer(CustomerRequest customerRequest) {
		System.out.println("POST METHOD Request from Client with ............." + customerRequest.getCustomerFirstame() + "  " + customerRequest.getCustomerLastname());
		CustomerActivity cusActivity = new CustomerActivity();
		return cusActivity.createCustomer(customerRequest.getCustomerFirstname(), customerRequest.getCustomerLastname());
	}
	
	@DELETE
	@Produces({"application/xml" , "application/json"})
	@Path("/customer/{customerUsername}")
	public Response deleteCustomer(@PathParam("customerUsername") String username) {
		System.out.println("Delete METHOD Request from Client with customerRequest String ............." + id);
		CustomerActivity cusActivity = new CustomerActivity();
		String res = cusActivity.deleteCustomer(username);
		if (res.equals("OK")) {
			return Response.status(Status.OK).build();
		}
		return null;
	}
	
}