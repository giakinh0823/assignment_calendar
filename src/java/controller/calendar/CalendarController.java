/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import controller.auth.BaseAuthController;
import dal.calendar.AdditionalCalendarDBContext;
import dal.calendar.CalendarDBContext;
import dal.calendar.CategoryCalendarDBContext;
import dal.calendar.EventCalendarDBContext;
import dal.calendar.StatusCalendarDBContext;
import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.calendar.Calendar;
import model.calendar.CategoryCalendar;
import model.calendar.EventCalendar;
import model.calendar.StatusCalendar;
import model.auth.User;

/**
 *
 * @author giaki
 */
public class CalendarController extends BaseAuthController {
    
    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numReadCalendar = userDB.getNumberOfPermission(user.getId(), "CALENDAR", "READ");
        int numReadEvent = userDB.getNumberOfPermission(user.getId(), "EVENT", "READ");
        return numReadCalendar >= 1 && numReadEvent >= 1;
    }
    
    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CalendarDBContext calendarDB = new CalendarDBContext();
        CategoryCalendarDBContext categoryDB = new CategoryCalendarDBContext();
        StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
        EventCalendarDBContext eventDB = new EventCalendarDBContext();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ArrayList<Calendar> calendars = calendarDB.listByUser(user.getId());
        ArrayList<CategoryCalendar> listCategory = categoryDB.list();
        ArrayList<StatusCalendar> listStatus = statusDB.list();
        ArrayList<EventCalendar> events = eventDB.list();

        request.setAttribute("calendars", calendars);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listStatus", listStatus);
        request.setAttribute("events", events);

        request.getRequestDispatcher("/views/calendar/calendar.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
