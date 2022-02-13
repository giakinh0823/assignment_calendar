/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import dal.AdditionalCalendarDBContext;
import dal.CalendarDBContext;
import dal.CategoryCalendarDBContext;
import dal.EventCalendarDBContext;
import dal.StatusCalendarDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Calendar;
import model.CategoryCalendar;
import model.EventCalendar;
import model.StatusCalendar;
import model.User;

/**
 *
 * @author giaki
 */
public class CalendarController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CalendarDBContext calendarDB = new CalendarDBContext();
        CategoryCalendarDBContext categoryDB = new CategoryCalendarDBContext();
        StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
        EventCalendarDBContext eventDB = new EventCalendarDBContext();
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        
        UserDBContext userDB = new UserDBContext();
        User user = userDB.findOne("username", username);
        
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
