/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import dal.CalendarDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Calendar;
import model.User;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class AddCalendarController extends HttpServlet {

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
            String name = validate.getField(request, "nameCalendar", true);
            String color = validate.getField(request, "colorCalendar", true);
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("user");
            
            UserDBContext userDB = new UserDBContext();
            User user = userDB.findOne("username", username);
            Calendar calendar = new Calendar(name, color, user.getId(), user);
            Timestamp created_at = new Timestamp(System.currentTimeMillis());
            Timestamp updated_at = new Timestamp(System.currentTimeMillis());
            calendar.setCreated_at(created_at);
            calendar.setUpdated_at(updated_at);
            
            CalendarDBContext calendarDBContext = new CalendarDBContext();
            calendarDBContext.insert(calendar);
            response.sendRedirect("/calendar");
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/views/calendar/calendar.jsp").forward(request, response);
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
