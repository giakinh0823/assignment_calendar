/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.auth;

import utils.EmailUtility;
import dal.auth.UserDBContext;
import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.auth.User;
import utils.HashPass;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class ForgotPasswordController extends HttpServlet {

    private final Validate validate = new Validate();
    private String host;
    private String port;
    private String email;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        email = context.getInitParameter("email");
        pass = context.getInitParameter("pass");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/auth/forgot.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String emailString = validate.getField(request, "email", true);
            UserDBContext db = new UserDBContext();
            String field_email = validate.fieldString(emailString, "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])", "Email wrong! please enter new email");
            User user = db.findOne("email", field_email);
            if (user == null) {
                request.setAttribute("error", "Email not exist! Please remember your email!");
                request.getRequestDispatcher("/views/auth/forgot.jsp").forward(request, response);
                return;
            } else {
                String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghiklmnopqrstuvwxyz1234567890!@#$%^&*()_+";
                StringBuilder salt = new StringBuilder();
                Random rnd = new Random();
                while (salt.length() < 18) { // length of the random string.
                    int index = (int) (rnd.nextFloat() * SALTCHARS.length());
                    salt.append(SALTCHARS.charAt(index));
                }
                String saltStr = salt.toString();
                HashPass hashPass = new HashPass();
                String new_password = hashPass.hashPassword(saltStr);
                db.changePassword(user.getId(),new_password);
                String scheme = request.getScheme() + "://";
                String serverName = request.getServerName();
                String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
                String contextPath = request.getContextPath();
                scheme += serverName + serverPort + contextPath;
                EmailUtility.sendEmail(host, port, email, pass, field_email, "Change your password",
                        "<p style=\"font-weight: bold\">Your password: " + saltStr + "<p/>\n"
                        + "<a href=\""+scheme+"/password/change\">Change password here</a>");
                request.setAttribute("senEmail", true);
                request.getRequestDispatcher("/views/auth/confirm.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/views/auth/forgot.jsp").forward(request, response);
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
