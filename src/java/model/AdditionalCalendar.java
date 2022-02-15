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
    private boolean isAllDay;
    private boolean isHasEnd;
    private int statusId;
    private int categoryId;
    private int calendarId;
    private Calendar calendar;
    private StatusCalendar status;
    private CategoryCalendar category;

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

    public boolean isIsAllDay() {
        return isAllDay;
    }

    public void setIsAllDay(boolean isAllDay) {
        this.isAllDay = isAllDay;
    }

    public boolean isIsHasEnd() {
        return isHasEnd;
    }

    public void setIsHasEnd(boolean isHasEnd) {
        this.isHasEnd = isHasEnd;
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

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    public StatusCalendar getStatus() {
        return status;
    }

    public void setStatus(StatusCalendar status) {
        this.status = status;
    }

    public CategoryCalendar getCategory() {
        return category;
    }

    public void setCategory(CategoryCalendar category) {
        this.category = category;
    }

    

}
