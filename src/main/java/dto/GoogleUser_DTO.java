package dto;
import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.util.Date;

public class GoogleUser_DTO implements Serializable{
    
    private String email;

    private String name;

    public GoogleUser_DTO(String email, String name){
        this.email = email;
        this.name = name;
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    
}