/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.calendar;

import java.sql.Timestamp;
import model.BaseModel;
import model.auth.User;

/**
 *
 * @author giaki
 */
public class Calendar extends BaseModel{
    private String name;
    private String color;
    private int userId;
    private User user;

    public Calendar() {
    }

    public Calendar(String name, String color, int userId, User user) {
        this.name = name;
        this.color = color;
        this.userId = userId;
        this.user = user;
    }

    public Calendar(String name, String color, int userId, User user, int id, Timestamp created_at, Timestamp updated_at) {
        super(id, created_at, updated_at);
        this.name = name;
        this.color = color;
        this.userId = userId;
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
}
