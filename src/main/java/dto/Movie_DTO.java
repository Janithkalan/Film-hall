/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.Serializable;

public class Movie_DTO implements Serializable {

    private int id;

    private String name;

    private String genre;

    private String ratings;

    private String movie_description;

    private String trailer_link;
    
    private String movie_story;

    public Movie_DTO() {

    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
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

    /**
     * @return the genre
     */
    public String getGenre() {
        return genre;
    }

    /**
     * @param genre the genre to set
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     * @return the ratings
     */
    public String getRatings() {
        return ratings;
    }

    /**
     * @param ratings the ratings to set
     */
    public void setRatings(String ratings) {
        this.ratings = ratings;
    }

    /**
     * @return the movie_description
     */
    public String getMovie_description() {
        return movie_description;
    }

    /**
     * @param movie_description the movie_description to set
     */
    public void setMovie_description(String movie_description) {
        this.movie_description = movie_description;
    }

    /**
     * @return the trailer_link
     */
    public String getTrailer_link() {
        return trailer_link;
    }

    /**
     * @param trailer_link the trailer_link to set
     */
    public void setTrailer_link(String trailer_link) {
        this.trailer_link = trailer_link;
    }
    
     /**
     * @return the movie_story
     */
    public String getMovie_story() {
        return movie_story;
    }

    /**
     * @param movie_story the movie_story to set
     */
    public void setMovie_story(String movie_story) {
        this.movie_story = movie_story;
    }

}
