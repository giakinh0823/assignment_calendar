/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.user;

import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.auth.User;
import model.common.Pagination;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class UserManageController extends BaseAuthAdminController {

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numRead = userDB.getNumberOfPermission(user.getId(), "USER", "READ");
        return numRead >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "USER", "EDIT");
        int numDelete = userDB.getNumberOfPermission(user.getId(), "USER", "DELETE");
        return numEdit >= 1 && numDelete >= 1;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Validate validate = new Validate();
            int pageSize = 24;
            String page = validate.getField(request, "page", false);
            if (page == null || page.trim().length() == 0) {
                page = "1";
            }
            int pageIndex = 0;
            try {
                pageIndex = validate.fieldInt(page, "Something error!");
                if (pageIndex <= 0) {
                    pageIndex = 1;
                }
            } catch (Exception e) {
                pageIndex = 1;
            }
            UserDBContext userDB = new UserDBContext();
            Pagination pagination = new Pagination(pageIndex, pageSize, userDB.getSize());
            ArrayList<User> users = userDB.getUsers(pageIndex, pageSize);
            request.setAttribute("users", users);
            request.setAttribute("pagination", pagination);
            request.getRequestDispatcher("/views/admin/user/manageUser.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("/views/error/accessDenied.jsp").forward(request, response);
        }
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
