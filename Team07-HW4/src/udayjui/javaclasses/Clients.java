package udayjui.javaclasses;

public class Clients {

	Users user;
	Organization organization;
	
	public Clients() {
		super();
	}

	public Clients(Users name, Organization company) {
		setUser(name);
		setOrganization(company);
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

}
