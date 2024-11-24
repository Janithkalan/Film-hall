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
public class TimeTable_DTO implements Serializable{
    
    private String show_time;
    
    private String hall_name;
    
    private int movie_id;
    
    private int date; ;
    
    private String day;
    
    private int hall_id;

    /**
     * @return the show_time
     */
    public String getShow_time() {
        return show_time;
    }

    /**
     * @param show_time the show_time to set
     */
    public void setShow_time(String show_time) {
        this.show_time = show_time;
    }

    /**
     * @return the hall_name
     */
    public String getHall_name() {
        return hall_name;
    }

    /**
     * @param hall_name the hall_name to set
     */
    public void setHall_name(String hall_name) {
        this.hall_name = hall_name;
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
     * @return the date
     */
    public int getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(int date) {
        this.date = date;
    }

    /**
     * @return the day
     */
    public String getDay() {
        return day;
    }

    /**
     * @param day the day to set
     */
    public void setDay(String day) {
        this.day = day;
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

    

    
}
