
package Model;

public class Validations {

    public static boolean isEmailValid(String email) {
        return email.matches("^[a-zA-Z0-9_!#$%&’+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$");
    }

    public static boolean isMobileValid(String mobile) {
        return mobile.matches("^\\d{10}$");
    }

    public static boolean isDouble(String text){
        return text.matches("^\\d+(\\.\\d{2})?$");
    }

    public static boolean isInteger(String text){
        return text.matches("^\\d+$");
    }
    
    public static boolean isValidNIC(String text){
        return text.matches("^(?:19|20)?\\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$");
    }
}

