/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author giaki
 */
public class EventCalendar extends BaseModel {
    private String title;
    private String description;
    private String location;
    private int userId;
    private int additionalId;
    private AdditionalCalendar additional;
    private User user;

    public EventCalendar() {
    }

    public EventCalendar(String title, String description, String location, int userId, int additionalId, AdditionalCalendar additional, User user) {
        this.title = title;
        this.description = description;
        this.location = location;
        this.userId = userId;
        this.additionalId = additionalId;
        this.additional = additional;
        this.user = user;
    }

    public EventCalendar(String title, String description, String location, int userId, int additionalId, AdditionalCalendar additional, User user, int id) {
        super(id);
        this.title = title;
        this.description = description;
        this.location = location;
        this.userId = userId;
        this.additionalId = additionalId;
        this.additional = additional;
        this.user = user;
    }

    public EventCalendar(String title, String description, String location, int userId, int additionalId, AdditionalCalendar additional, User user, Timestamp created_at, Timestamp updated_at) {
        super(created_at, updated_at);
        this.title = title;
        this.description = description;
        this.location = location;
        this.userId = userId;
        this.additionalId = additionalId;
        this.additional = additional;
        this.user = user;
    }

    
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAdditionalId() {
        return additionalId;
    }

    public void setAdditionalId(int additionalId) {
        this.additionalId = additionalId;
    }

    public AdditionalCalendar getAdditional() {
        return additional;
    }

    public void setAdditional(AdditionalCalendar additional) {
        this.additional = additional;
    }
    
    
}
