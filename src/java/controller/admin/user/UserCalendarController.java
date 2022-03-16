/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.user;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import dal.calendar.CalendarDBContext;
import dal.calendar.CategoryCalendarDBContext;
import dal.calendar.EventCalendarDBContext;
import dal.calendar.StatusCalendarDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.auth.User;
import model.calendar.Calendar;
import model.calendar.CategoryCalendar;
import model.calendar.EventCalendar;
import model.calendar.StatusCalendar;
import utils.Validate;

/**
 *
 * @author giaki
 */
class Data {

    ArrayList<Calendar> calendars;
    ArrayList<EventCalendar> events;

    public ArrayList<Calendar> getCalendars() {
        return calendars;
    }

    public void setCalendars(ArrayList<Calendar> calendars) {
        this.calendars = calendars;
    }

    public ArrayList<EventCalendar> getEvents() {
        return events;
    }

    public void setEvents(ArrayList<EventCalendar> events) {
        this.events = events;
    }
}

public class UserCalendarController extends BaseAuthAdminController {

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numRead = userDB.getNumberOfPermission(user.getId(), "EVENT", "READ");
        return numRead >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numRead = userDB.getNumberOfPermission(user.getId(), "EVENT", "READ");
        return numRead >= 1;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Validate validate = new Validate();
            String idString = validate.getFieldAjax(request, "id", true);
            int id = validate.fieldInt(idString, "Error get field id");
            CalendarDBContext calendarDB = new CalendarDBContext();
            CategoryCalendarDBContext categoryDB = new CategoryCalendarDBContext();
            StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
            EventCalendarDBContext eventDB = new EventCalendarDBContext();
            ArrayList<Calendar> calendars = calendarDB.listByUser(id);
            ArrayList<CategoryCalendar> listCategory = categoryDB.list();
            ArrayList<StatusCalendar> listStatus = statusDB.list();
            ArrayList<EventCalendar> events = eventDB.findByUser(id);
            request.setAttribute("calendars", calendars);
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listStatus", listStatus);
            request.setAttribute("events", events);
            request.getRequestDispatcher("/views/admin/user/calendar/calendar.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserCalendarController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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