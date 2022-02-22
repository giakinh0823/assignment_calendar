/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.auth;

import java.sql.Date;
import java.sql.Timestamp;
import model.BaseModel;

/**
 *
 * @author giaki
 */
public class User extends BaseModel{
    private String username;
    private String email;
    private String password;
    private String phone;
    private String first_name;
    private String last_name;
    private Boolean gender;
    private Date birthday;
    private boolean is_super;
    private boolean is_active;
    private String permission;
    private Permission user_permission;
    private String avatar;

    public User() {
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    public Permission getUser_permission() {
        return user_permission;
    }

    public void setUser_permission(Permission user_permission) {
        this.user_permission = user_permission;
    }

    
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public boolean isIs_super() {
        return is_super;
    }

    public void setIs_super(boolean is_super) {
        this.is_super = is_super;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    
}
