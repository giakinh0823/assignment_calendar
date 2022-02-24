/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import com.google.gson.Gson;
import controller.auth.BaseAuthController;
import dal.calendar.CalendarDBContext;
import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.calendar.Calendar;
import model.auth.User;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class AddCalendarController extends BaseAuthController {

    private final Validate validate = new Validate();
    
    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numReadCalendar = userDB.getNumberOfPermission(user.getId(), "CALENDAR", "READ");
        return numReadCalendar >= 1;
    }
    
    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numCreateCalendar = userDB.getNumberOfPermission(user.getId(), "CALENDAR", "CREATE");
        return numCreateCalendar >= 1;
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
            String name = validate.getField(request, "nameCalendar", true);
            String color = validate.getField(request, "colorCalendar", true);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            Calendar calendar = new Calendar(name, color, user.getId(), user);
            Timestamp created_at = new Timestamp(System.currentTimeMillis());
            Timestamp updated_at = new Timestamp(System.currentTimeMillis());
            calendar.setCreated_at(created_at);
            calendar.setUpdated_at(updated_at);
            
            CalendarDBContext calendarDBContext = new CalendarDBContext();
            calendarDBContext.insert(calendar);
            response.sendRedirect(request.getHeader("referer"));
        } catch (Exception e) {
            String json = new Gson().toJson(new Error(e.getMessage()));
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
