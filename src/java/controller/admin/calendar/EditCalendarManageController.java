/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.calendar;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import dal.calendar.CalendarDBContext;
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
import model.calendar.Calendar;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class EditCalendarManageController extends BaseAuthAdminController {

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numRead = userDB.getNumberOfPermission(user.getId(), "CALENDAR", "READ");
        return numRead >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numRead = userDB.getNumberOfPermission(user.getId(), "CALENDAR", "EDIT");
        return numRead >= 1;
    }
   
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validate validate = new Validate();
        try {
            String idString = validate.getField(request, "id", true);
            int id = validate.fieldInt(idString, "Error get field id");
            CalendarDBContext calendarDB = new CalendarDBContext();
            Calendar calendar = calendarDB.get(id);
            request.setAttribute("calendar", calendar);
            request.getRequestDispatcher("/views/admin/calendar/editCalendar.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditCalendarManageController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validate validate = new Validate();
        try {
            String idString = validate.getFieldAjax(request, "id", true);
            String name = validate.getFieldAjax(request, "name", true);
            String color = validate.getFieldAjax(request, "color", true);
            int id = validate.fieldInt(idString, "Error get field id");
            CalendarDBContext calendarDB = new CalendarDBContext();
            Calendar calendar = calendarDB.get(id);
            calendar.setName(name);
            calendar.setColor(color);
            calendarDB.update(calendar);
            String json = new Gson().toJson(calendar);
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
