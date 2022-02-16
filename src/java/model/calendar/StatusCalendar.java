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
public class StatusCalendar extends BaseModel{
    private String name;

    public StatusCalendar() {
    }

    public StatusCalendar(String name, int id) {
        super(id);
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
