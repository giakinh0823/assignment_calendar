/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.user;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.auth.User;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class DeleteUserManageController extends BaseAuthAdminController {

    private final Validate validate = new Validate();

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numDelete = userDB.getNumberOfPermission(user.getId(), "USER", "DELETE");
        return numDelete >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numDelete = userDB.getNumberOfPermission(user.getId(), "USER", "DELETE");
        return numDelete >= 1;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idString = validate.getField(request, "id", true);
            int id = validate.fieldInt(idString, "Error get id field");
            UserDBContext userDB = new UserDBContext();
            userDB.delete(id);
            response.sendRedirect(request.getHeader("referer"));
        } catch (Exception ex) {
            request.getRequestDispatcher("/views/error/accessDenied.jsp").forward(request, response);
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
