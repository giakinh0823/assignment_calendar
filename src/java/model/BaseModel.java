/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author giaki
 */
public class BaseModel {
    private int id;
    private Timestamp created_at;
    private Timestamp updated_at;

    public BaseModel() {
    }

    public BaseModel(int id) {
        this.id = id;
    }

    
    public BaseModel(int id, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public BaseModel(Timestamp created_at, Timestamp updated_at) {
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}
