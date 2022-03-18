/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import com.google.gson.Gson;
import controller.auth.BaseAuthController;
import dal.calendar.AdditionalCalendarDBContext;
import dal.calendar.EventCalendarDBContext;
import dal.auth.UserDBContext;
import dal.calendar.CalendarDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.calendar.AdditionalCalendar;
import model.calendar.EventCalendar;
import model.auth.User;
import model.calendar.Calendar;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class EventController extends BaseAuthController {

    private final Validate validate = new Validate();
    
    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numReadEvent = userDB.getNumberOfPermission(user.getId(), "EVENT", "READ");
        return numReadEvent >= 1;
    }
    
    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numCreateEvent = userDB.getNumberOfPermission(user.getId(), "EVENT", "CREATE");
        return numCreateEvent >= 1;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/calendar");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // get params
            String title = validate.getFieldAjax(request, "title", true);
            String calendar = validate.getFieldAjax(request, "calendar", true);
            String color = validate.getFieldAjax(request, "color", true);
            String category = validate.getFieldAjax(request, "category", true);
            String overlap = validate.getFieldAjax(request, "overlap", true);
            String display = validate.getFieldAjax(request, "display", false);
            String location = validate.getFieldAjax(request, "location", false);
            String description = validate.getFieldAjax(request, "description", false);
            String startDate = validate.getFieldAjax(request, "start", true);
            String endDate = validate.getFieldAjax(request, "end", false);
            String isAllDay = validate.getFieldAjax(request, "allDay", true);
            String isHasEnd = validate.getFieldAjax(request, "hasEnd", false);
            
            // process field
            int field_calendar = validate.fieldInt(calendar, "Error set field calendar");
            int field_category = validate.fieldInt(category, "Error set field category");
            boolean field_overlap = validate.fieldBoolean(overlap, "Error set field overlap");
            Timestamp field_startDate = validate.fieldTimestamp(startDate, "Error set field start date");
            Timestamp field_endDate = validate.fieldTimestamp(endDate, "Error set field end date");
            boolean field_isAllDay = validate.fieldBoolean(isAllDay, "Error set field AllDay");
            boolean field_isHasEnd = validate.fieldBoolean(isHasEnd, "Error set field HasEnd");
            
            if(field_startDate.getTime()>=field_endDate.getTime()){
                throw new Exception("start date cannot be greater than end date");
            }

            Timestamp created_at = new Timestamp(System.currentTimeMillis());
            Timestamp updated_at = new Timestamp(System.currentTimeMillis());

            // Get user
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            // get Calendar
            CalendarDBContext calendarDB = new CalendarDBContext();
            Calendar calendar_object = calendarDB.get(field_calendar);

            // insert additional
            AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
            AdditionalCalendar additional = new AdditionalCalendar();
            additional.setStartDate(field_startDate);
            additional.setEndDate(field_endDate);
            additional.setOverlap(field_overlap);
            additional.setDisplay(display);
            additional.setIsAllDay(field_isAllDay);
            additional.setIsHasEnd(field_isHasEnd);
            additional.setStatusId(1);
            additional.setCalendarId(field_calendar);
            additional.setCategoryId(field_category);
            additional.setCreated_at(created_at);
            additional.setUpdated_at(updated_at);
            additional.setCalendar(calendar_object);
            additional = additionalDB.insert(additional);

            //inser event
            EventCalendar event = new EventCalendar();
            event.setTitle(title);
            event.setDescription(description);
            event.setLocation(location);
            event.setUserId(user.getId());
            event.setAdditionalId(additional.getId());
            event.setCreated_at(created_at);
            event.setUpdated_at(updated_at);
            EventCalendarDBContext eventDB = new EventCalendarDBContext();
            event = eventDB.insert(event);

            String json = new Gson().toJson(event);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        } catch (Exception ex) {
            String json = new Gson().toJson(new Error(ex.getMessage()));
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
