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
public class AdditionalCalendar extends BaseModel {
    private Timestamp startDate;
    private Timestamp endDate;
    private boolean overlap;
    private String display;
    private boolean isOnlyDate;
    private int statusId;
    private int categoryId;
    private int calendarId;

    public AdditionalCalendar() {
    }

    public AdditionalCalendar(Timestamp startDate, Timestamp endDate, boolean overlap, String display, boolean isOnlyDate, int statusId, int categoryId, int calendarId) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.overlap = overlap;
        this.display = display;
        this.isOnlyDate = isOnlyDate;
        this.statusId = statusId;
        this.categoryId = categoryId;
        this.calendarId = calendarId;
    }

    public AdditionalCalendar(Timestamp startDate, Timestamp endDate, boolean overlap, String display, boolean isOnlyDate, int statusId, int categoryId, int calendarId, int id) {
        super(id);
        this.startDate = startDate;
        this.endDate = endDate;
        this.overlap = overlap;
        this.display = display;
        this.isOnlyDate = isOnlyDate;
        this.statusId = statusId;
        this.categoryId = categoryId;
        this.calendarId = calendarId;
    }

    public AdditionalCalendar(Timestamp startDate, Timestamp endDate, boolean overlap, String display, boolean isOnlyDate, int statusId, int categoryId, int calendarId, int id, Timestamp created_at, Timestamp updated_at) {
        super(id, created_at, updated_at);
        this.startDate = startDate;
        this.endDate = endDate;
        this.overlap = overlap;
        this.display = display;
        this.isOnlyDate = isOnlyDate;
        this.statusId = statusId;
        this.categoryId = categoryId;
        this.calendarId = calendarId;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public boolean isOverlap() {
        return overlap;
    }

    public void setOverlap(boolean overlap) {
        this.overlap = overlap;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public boolean isIsOnlyDate() {
        return isOnlyDate;
    }

    public void setIsOnlyDate(boolean isOnlyDate) {
        this.isOnlyDate = isOnlyDate;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getCalendarId() {
        return calendarId;
    }

    public void setCalendarId(int calendarId) {
        this.calendarId = calendarId;
    }
    
    
}
