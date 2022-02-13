/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.calendar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            String title = validate.getField(request, "title", true);
            String calendar = validate.getField(request, "calendar", true);
            String color = validate.getField(request, "color", true);
            String category = validate.getField(request, "category", true);
            String overlap = validate.getField(request, "overlap", true);
            String display = validate.getField(request, "display", false);
            String location = validate.getField(request, "location", false);
            String description = validate.getField(request, "description", false);
            String startDate = validate.getField(request, "start", true);
            String endDate = validate.getField(request, "end", false);
            String isOnlyDate = validate.getField(request, "isOnlyDate", true);
            
            int field_calendar = validate.fieldInt(calendar, "Error set field calendar");
            int field_category = validate.fieldInt(category, "Error set field category");
            boolean field_overlap = validate.fieldBoolean(overlap, "Error set field overlap");
            Timestamp field_startDate = validate.fieldTimestamp(startDate, "Error set field start date");
            Timestamp field_endDate = validate.fieldTimestamp(endDate, "Error set field end date");
            boolean field_isOnlyDate = validate.fieldBoolean(isOnlyDate, "Error set field isOnlyDate");
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
