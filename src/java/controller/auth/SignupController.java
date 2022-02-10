/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.auth;

import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import utils.HashPass;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class SignupController extends HttpServlet {

    private final Validate validate = new Validate();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/auth/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = validate.getField(request, "username", true);
            String email = validate.getField(request, "email", true);
            String password = validate.getField(request, "password", true);
            String confirm_password = validate.getField(request, "confirm_password", true);
            String first_name = validate.getField(request, "first_name", true);
            String last_name = validate.getField(request, "last_name", true);
            String phone = validate.getField(request, "phone", true);
            String gender = validate.getField(request, "gender", true);
            String birthday = validate.getField(request, "birthday", true);

            // process field
            if (!password.equals(confirm_password)) {
                request.setAttribute("error", "Confirm password not match! Please try again!");
                request.getRequestDispatcher("/views/auth/signup.jsp").forward(request, response);
            } else {
                HashPass hashPass = new HashPass();
                UserDBContext db = new UserDBContext();
                try {
                    String field_username = validate.fieldString(username, "^[a-zA-Z0-9._-]{3,}$", "Username not work! Please enter new username");
                    if(db.findOne("username", field_username) != null){
                        request.setAttribute("error", "Username has exist! Please try new username!");
                        request.getRequestDispatcher("/views/auth/signup.jsp").forward(request, response);
                        return;
                    }
                    
                    String field_email = validate.fieldString(email, "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])", "Email wrong! please enter new email");
                    if(db.findOne("email", field_email) != null){
                        request.setAttribute("error", "Email has exist! Please try new email!");
                        request.getRequestDispatcher("/views/auth/signup.jsp").forward(request, response);
                        return;
                    }
                    
                    String field_phone = validate.fieldString(phone, "(\\+84|0)([3|5|7|8|9])+([0-9]{8})", "Phone is wrong please enter new phone!");
                    Boolean field_gender = gender.equals("male") ? true : false;
                    Date field_birthday = validate.fieldDate(birthday, "Birthday is wrong! Please try again");
                    System.out.println(field_birthday);
                    String field_password = hashPass.hashPassword(password);
                    User user = new User(field_username, field_email, field_password, field_phone, first_name, last_name, field_gender, field_birthday);
                    Timestamp created_at = new Timestamp(System.currentTimeMillis());
                    Timestamp updated_at = new Timestamp(System.currentTimeMillis());
                    Boolean is_super = false;
                    Boolean is_active = true;
                    String permission = "user";
                    user.setCreated_at(created_at);
                    user.setUpdated_at(updated_at);
                    user.setIs_active(is_active);
                    user.setIs_super(is_super);
                    user.setPermission(permission);
                    db.insert(user);
                    response.sendRedirect("/");
                } catch (Exception e) {
                    request.setAttribute("error", e.getMessage());
                    request.getRequestDispatcher("/views/auth/signup.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/views/auth/signup.jsp").forward(request, response);
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
