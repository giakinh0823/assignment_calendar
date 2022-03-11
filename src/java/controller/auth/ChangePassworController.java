/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.auth;

import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.auth.User;
import utils.HashPass;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class ChangePassworController extends HttpServlet {

    private final Validate validate = new Validate();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/auth/change.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = validate.getField(request, "username", true);
            String old_password = validate.getField(request, "old_password", true);
            String new_password = validate.getField(request, "new_password", true);
            String confirm_password = validate.getField(request, "confirm_password", true);
            UserDBContext db = new UserDBContext();
            HashPass hashPass = new HashPass();
            User user = db.getUser(username, hashPass.hashPassword(old_password));
            if (user != null) {
                if (!new_password.equals(confirm_password)) {
                    request.setAttribute("error", "Password not match!");
                    request.getRequestDispatcher("/views/auth/change.jsp").forward(request, response);
                } else {
                    db.changePassword(user.getId(), hashPass.hashPassword(new_password));
                    if (request.getSession().getAttribute("user") != null) {
                        response.sendRedirect("/profile");
                    } else {
                        response.sendRedirect("/login");
                    }

                }
            } else {
                request.setAttribute("error", "Username or old password wrong!");
                request.getRequestDispatcher("/views/auth/change.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/views/auth/change.jsp").forward(request, response);
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
