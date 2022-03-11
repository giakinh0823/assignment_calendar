/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.dashboard;

import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import dal.calendar.CalendarDBContext;
import dal.calendar.CategoryCalendarDBContext;
import dal.calendar.EventCalendarDBContext;
import dal.calendar.StatusCalendarDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

/**
 *
 * @author giaki
 */
public class DashboardController extends BaseAuthAdminController {
    
    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        return true;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        return true;
    }

   
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CalendarDBContext calendarDB = new CalendarDBContext();
        CategoryCalendarDBContext categoryDB = new CategoryCalendarDBContext();
        EventCalendarDBContext eventDB = new EventCalendarDBContext();
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");

        ArrayList<Calendar> calendars = calendarDB.list();
        ArrayList<CategoryCalendar> listCategory = categoryDB.list();
        ArrayList<EventCalendar> events = eventDB.list();
        ArrayList<User> users = userDB.list();
        
        request.setAttribute("userSize", userDB.getSize());
        request.setAttribute("calendarSize", calendarDB.getSize());
        request.setAttribute("eventSize", eventDB.getSize());

        request.setAttribute("calendars", calendars);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("events", events);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/views/admin/dashboard/dashboard.jsp").forward(request, response);
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
