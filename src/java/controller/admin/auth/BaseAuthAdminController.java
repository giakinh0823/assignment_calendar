/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.auth;

import controller.auth.*;
import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.auth.User;

/**
 *
 * @author SAP-LAP-FPT
 */

public abstract class BaseAuthAdminController extends HttpServlet {
    
    protected abstract boolean isPermissionGet(HttpServletRequest request);
    protected abstract boolean isPermissionPost(HttpServletRequest request);

    private boolean isAuth(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("admin");
        if (user == null || user.isIs_super() == false ) {
            return false;
        } else {
            return request.getMethod().equals("GET") ? isPermissionGet(request) : isPermissionPost(request);
        }
    }
    
    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuth(request)) {
            processGet(request, response);
        } else {
            request.getRequestDispatcher("/views/error/accessDenied.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuth(request)) {
            processPost(request, response);
        } else {
            request.getRequestDispatcher("/views/error/accessDenied.jsp").forward(request, response);
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
