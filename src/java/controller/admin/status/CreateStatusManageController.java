/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.status;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import dal.calendar.StatusCalendarDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.auth.User;
import model.calendar.StatusCalendar;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class CreateStatusManageController extends BaseAuthAdminController {

@Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "STATUS", "CREATE");
        return numEdit >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "STATUS", "CREATE");
        return numEdit >= 1;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/admin/status/createStatus.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Validate validate = new Validate();
        try {
            String name = validate.getField(request, "name", true);
            StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
            StatusCalendar status = new StatusCalendar();
            status.setName(name);
            statusDB.insert(status);
            String json = new Gson().toJson(status);
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
