/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.event;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import dal.calendar.AdditionalCalendarDBContext;
import dal.calendar.CalendarDBContext;
import dal.calendar.CategoryCalendarDBContext;
import dal.calendar.EventCalendarDBContext;
import dal.calendar.StatusCalendarDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.auth.User;
import model.calendar.AdditionalCalendar;
import model.calendar.Calendar;
import model.calendar.CategoryCalendar;
import model.calendar.EventCalendar;
import model.calendar.StatusCalendar;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class EditEventManageController extends BaseAuthAdminController {
    
    private final Validate validate = new Validate();

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "EVENT", "EDIT");
        return numEdit >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "EVENT", "EDIT");
        return numEdit >= 1;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validate validate = new Validate();
        try {
            String idString = validate.getField(request, "id", true);
            int id = validate.fieldInt(idString, "Error get field id");
            CalendarDBContext calendarDB = new CalendarDBContext();
            CategoryCalendarDBContext categoryDB = new CategoryCalendarDBContext();
            StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
            EventCalendarDBContext eventDB = new EventCalendarDBContext();
            ArrayList<CategoryCalendar> listCategory = categoryDB.list();
            ArrayList<StatusCalendar> listStatus = statusDB.list();
            
            EventCalendar event = eventDB.get(id);
            ArrayList<Calendar> calendars = calendarDB.listByUser(event.getUser().getId());

            request.setAttribute("calendars", calendars);
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listStatus", listStatus);
            request.setAttribute("event", event);
            request.getRequestDispatcher("/views/admin/event/editEvent.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditEventManageController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // get params
            String eventId = validate.getFieldAjax(request, "id", true);
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
            String idAdditional = validate.getFieldAjax(request, "additional", true);
            
            // process field
            int field_id = validate.fieldInt(eventId, "Error set field event");
            int field_id_additional = validate.fieldInt(idAdditional, "Error set field additional");
            int field_calendar = validate.fieldInt(calendar, "Error set field calendar");
            int field_category = validate.fieldInt(category, "Error set field category");
            boolean field_overlap = validate.fieldBoolean(overlap, "Error set field overlap");
            Timestamp field_startDate = validate.fieldTimestamp(startDate, "Error set field start date");
            Timestamp field_endDate = validate.fieldTimestamp(endDate, "Error set field end date");
            boolean field_isAllDay = validate.fieldBoolean(isAllDay, "Error set field AllDay");
            boolean field_isHasEnd = validate.fieldBoolean(isHasEnd, "Error set field HasEnd");

            Timestamp updated_at = new Timestamp(System.currentTimeMillis());

            // Get user
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            // insert additional
            AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
            AdditionalCalendar additional = additionalDB.get(field_id_additional);
            additional.setStartDate(field_startDate);
            additional.setEndDate(field_endDate);
            additional.setOverlap(field_overlap);
            additional.setDisplay(display);
            additional.setIsAllDay(field_isAllDay);
            additional.setIsHasEnd(field_isHasEnd);
            additional.setStatusId(1);
            additional.setCalendarId(field_calendar);
            additional.setCategoryId(field_category);
            additional.setUpdated_at(updated_at);
            additionalDB.update(additional);

            //inser event
            EventCalendar event = new EventCalendar();
            event.setAdditional(additional);
            event.setId(field_id);
            event.setTitle(title);
            event.setDescription(description);
            event.setLocation(location);
            event.setUserId(user.getId());
            event.setAdditionalId(additional.getId());
            event.setUpdated_at(updated_at);
            EventCalendarDBContext eventDB = new EventCalendarDBContext();
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
