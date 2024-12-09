package dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cancellation_DTO implements Serializable {
    
    private int invoice;
    private String name;
    private String email;
    private String mobile;
    private int date;
    private String weekday;
    private List<String> seat_id;
    private String hall;
    private String show_time;

    // Constructor
    public Cancellation_DTO() {
        this.seat_id = new ArrayList<>();
    }

    // Getters and Setters
    public int getInvoice() {
        return invoice;
    }

    public void setInvoice(int invoice) {
        this.invoice = invoice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday;
    }

    public List<String> getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(List<String> seat_id) {
        this.seat_id = seat_id;
    }

    public String getHall() {
        return hall;
    }

    public void setHall(String hall) {
        this.hall = hall;
    }

    public String getShow_time() {
        return show_time;
    }

    public void setShow_time(String show_time) {
        this.show_time = show_time;
    }

    
}
