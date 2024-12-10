/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author Dilum
 */
public class Reservation_DTO implements Serializable {

    private String seat_id[];

    private String screen_time;

    private int hall_id;

    private int movie_id;

    private int date_id;

    private int seat_status;
    

    public Reservation_DTO() {
    
    }
    
    /**
     * @return the screen_time
     */
    public String getScreen_time() {
        return screen_time;
    }

    /**
     * @param screen_time the screen_time to set
     */
    public void setScreen_time(String screen_time) {
        this.screen_time = screen_time;
    }

    /**
     * @return the hall_id
     */
    public int getHall_id() {
        return hall_id;
    }

    /**
     * @param hall_id the hall_id to set
     */
    public void setHall_id(int hall_id) {
        this.hall_id = hall_id;
    }

    /**
     * @return the movie_id
     */
    public int getMovie_id() {
        return movie_id;
    }

    /**
     * @param movie_id the movie_id to set
     */
    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    /**
     * @return the date_id
     */
    public int getDate_id() {
        return date_id;
    }

    /**
     * @param date_id the date_id to set
     */
    public void setDate_id(int date_id) {
        this.date_id = date_id;
    }

    /**
     * @return the seat_status
     */
    public int getSeat_status() {
        return seat_status;
    }

    /**
     * @param seat_status the seat_status to set
     */
    public void setSeat_status(int seat_status) {
        this.seat_status = seat_status;
    }

    /**
     * @return the seat_id
     */
    public String[] getSeat_id() {
        return seat_id;
    }

    /**
     * @param seat_id the seat_id to set
     */
    public void setSeat_id(String[] seat_id) {
        this.seat_id = seat_id;
    }
}
