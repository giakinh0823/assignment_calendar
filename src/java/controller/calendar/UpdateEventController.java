/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import com.google.gson.Gson;
import dal.calendar.AdditionalCalendarDBContext;
import dal.calendar.EventCalendarDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.calendar.AdditionalCalendar;
import model.calendar.EventCalendar;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class UpdateEventController extends HttpServlet {

    private final Validate validate = new Validate();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/calendar");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = validate.getFieldAjax(request, "id", true);
            String startDate = validate.getFieldAjax(request, "start", true);
            String endDate = validate.getFieldAjax(request, "end", false);
            String isAllDay = validate.getFieldAjax(request, "allDay", true);
            String isHasEnd = validate.getFieldAjax(request, "hasEnd", false);
            
            int field_id = validate.fieldInt(id, "Error set field id");
            Timestamp field_startDate = validate.fieldTimestamp(startDate, "Error set field start date");
            Timestamp field_endDate = validate.fieldTimestamp(endDate, "Error set field end date");
            boolean field_isAllDay = validate.fieldBoolean(isAllDay, "Error set field AllDay");
            boolean field_isHasEnd = validate.fieldBoolean(isHasEnd, "Error set field HasEnd");
             
            Timestamp updated_at = new Timestamp(System.currentTimeMillis());
            
            EventCalendarDBContext eventDB = new EventCalendarDBContext();
            EventCalendar event = eventDB.get(field_id);
            event.setUpdated_at(updated_at);
            
            AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
            AdditionalCalendar additional = additionalDB.get(event.getAdditionalId());
            additional.setStartDate(field_startDate);
            additional.setEndDate(field_endDate);
            additional.setIsAllDay(field_isAllDay);
            additional.setIsHasEnd(field_isHasEnd);
            additional.setUpdated_at(updated_at);
            
            additionalDB.update(additional);
            event.setAdditional(additional);
            eventDB.update(event);
            
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
