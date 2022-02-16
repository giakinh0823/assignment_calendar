/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.calendar;

import model.BaseModel;

/**
 *
 * @author giaki
 */
public class CategoryCalendar extends BaseModel {
    private String name;

    public CategoryCalendar() {
    }

    public CategoryCalendar(int id, String name) {
        super(id);
        this.name = name;
    }
    
    public CategoryCalendar(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
