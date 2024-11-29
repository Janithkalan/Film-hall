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
public class SeatReservationDetails_DTO implements Serializable {

    private int invoice;

    private String seat_id;

    private int seat_status;

    private int hall_id;

    private int time;

    private int date;

    private int movie_id;

    private int price;

    /**
     * @return the invoice
     */
    public int getInvoice() {
        return invoice;
    }

    /**
     * @param invoice the invoice to set
     */
    public void setInvoice(int invoice) {
        this.invoice = invoice;
    }

    /**
     * @return the seat_id
     */
    public String getSeat_id() {
        return seat_id;
    }

    /**
     * @param seat_id the seat_id to set
     */
    public void setSeat_id(String seat_id) {
        this.seat_id = seat_id;
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
     * @return the time
     */
    public int getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(int time) {
        this.time = time;
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
     * @return the movie_name
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
     * @return the price
     */
    public int getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(int price) {
        this.price = price;
    }

}
