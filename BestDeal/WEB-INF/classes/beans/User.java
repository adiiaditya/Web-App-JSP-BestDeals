package beans;
import java.util.ArrayList;
import java.util.List;

public class User {
    public String fullname;
    public String username;
    public String password;
    
    public User(){
    }

	public void setFullName(String fullname) {
		this.fullname = fullname;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}