/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import com.google.gson.Gson;
import dal.AdditionalCalendarDBContext;
import dal.EventCalendarDBContext;
import dal.UserDBContext;
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
import model.AdditionalCalendar;
import model.EventCalendar;
import model.User;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class EventController extends HttpServlet {

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
            String isOnlyDate = validate.getFieldAjax(request, "isOnlyDate", true);

            // process field
            int field_calendar = validate.fieldInt(calendar, "Error set field calendar");
            int field_category = validate.fieldInt(category, "Error set field category");
            boolean field_overlap = validate.fieldBoolean(overlap, "Error set field overlap");
            Timestamp field_startDate = validate.fieldTimestamp(startDate, "Error set field start date");
            Timestamp field_endDate = validate.fieldTimestamp(endDate, "Error set field end date");
            boolean field_isOnlyDate = validate.fieldBoolean(isOnlyDate, "Error set field isOnlyDate");

            Timestamp created_at = new Timestamp(System.currentTimeMillis());
            Timestamp updated_at = new Timestamp(System.currentTimeMillis());

            // Get user
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("user");

            UserDBContext userDB = new UserDBContext();
            User user = userDB.findOne("username", username);

            // insert additional
            AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
            AdditionalCalendar additional = new AdditionalCalendar(field_startDate, field_endDate, field_overlap, display, field_isOnlyDate, 1, field_category, field_calendar, created_at, updated_at);
            additional = additionalDB.insert(additional);

            //inser event
            EventCalendar event = new EventCalendar(title, description, location, user.getId(), additional.getId(), additional, user, created_at, updated_at);
            EventCalendarDBContext eventDB = new EventCalendarDBContext();
            event = eventDB.insert(event);

            String json = new Gson().toJson(event);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        } catch (Exception ex) {
            Logger.getLogger(EventController.class.getName()).log(Level.SEVERE, null, ex);
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
