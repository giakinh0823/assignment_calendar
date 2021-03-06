/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import com.google.gson.Gson;
import controller.auth.BaseAuthController;
import dal.auth.UserDBContext;
import dal.calendar.AdditionalCalendarDBContext;
import dal.calendar.EventCalendarDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.auth.User;
import model.calendar.AdditionalCalendar;
import model.calendar.EventCalendar;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class UpdateEventController extends BaseAuthController {

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
        int numEditEvent = userDB.getNumberOfPermission(user.getId(), "EVENT", "EDIT");
        return numEditEvent >= 1;
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
            
            if(field_startDate.getTime()>=field_endDate.getTime()){
                throw new Exception("start date cannot be greater than end date");
            }
            
            if(field_isAllDay){
                if(TimeUnit.MILLISECONDS.toDays(field_endDate.getTime() - field_startDate.getTime()) < 1){
                    throw new Exception("start date cannot be greater than end date one day");
                }
            }
             
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
            additional.setStatusId(1);
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
