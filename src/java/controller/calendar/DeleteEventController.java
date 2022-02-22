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
public class DeleteEventController extends BaseAuthController {
    
    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numDeleteEvent = userDB.getNumberOfPermission(user.getId(), "EVENT", "DELETE");
        return numDeleteEvent >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numDeleteEvent = userDB.getNumberOfPermission(user.getId(), "EVENT", "DELETE");
        return numDeleteEvent >= 1;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validate validate = new Validate();
        try {
            String idString = validate.getFieldAjax(request, "id", true);
            int id = validate.fieldInt(idString, "Error get field id");
            
            EventCalendarDBContext eventDB = new EventCalendarDBContext();
            AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
            EventCalendar event = eventDB.get(id);
            additionalDB.delete(event.getAdditional().getId());
            eventDB.delete(event.getId());
        } catch (Exception ex) {
            String json = new Gson().toJson(new Error(ex.getMessage()));
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
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

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
