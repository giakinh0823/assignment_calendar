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
import java.sql.Date;
import java.sql.Timestamp;
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
public class EditUserManageController extends BaseAuthAdminController {

    private final Validate validate = new Validate();

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numRead = userDB.getNumberOfPermission(user.getId(), "USER", "READ");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "USER", "EDIT");
        return numRead >= 1 && numEdit >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "USER", "EDIT");
        return numEdit >= 1;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        if (idString == null) {
            response.sendRedirect("/admin/users");
        }
        try {
            int id = Integer.parseInt(idString);
            UserDBContext userDB = new UserDBContext();
            User user = userDB.get(id);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/admin/user/editUser.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("/views/error/accessDenied.jsp").forward(request, response);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idString = validate.getFieldAjax(request, "id", true);
            String username = validate.getFieldAjax(request, "username", true);
            String email = validate.getFieldAjax(request, "email", true);
            String first_name = validate.getFieldAjax(request, "first_name", true);
            String last_name = validate.getFieldAjax(request, "last_name", true);
            String phone = validate.getFieldAjax(request, "phone", true);
            String gender = validate.getFieldAjax(request, "gender", true);
            String birthday = validate.getFieldAjax(request, "birthday", true);
            String permission = validate.getFieldAjax(request, "permission", true);
            String isSuper = validate.getFieldAjax(request, "isSuper", true);

            UserDBContext db = new UserDBContext();
            try {
                int field_id = validate.fieldInt(idString, "Error find id user");
                User user = db.get(field_id);

                String field_username = validate.fieldString(username, "^[a-zA-Z0-9._-]{3,}$", "Username not work! Please enter new username");
                if (!user.getUsername().equalsIgnoreCase(field_username) && db.findOne("username", field_username) != null) {
                    String json = new Gson().toJson(new Error("Username has exist! Please try new username!"));
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    return;
                }

                String field_email = validate.fieldString(email, "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])", "Email wrong! please enter new email");
                if (!user.getEmail().equalsIgnoreCase(field_email) && db.findOne("email", field_email) != null) {
                    String json = new Gson().toJson(new Error("Email has exist! Please try new email!"));
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    return;
                }
                String field_phone = validate.fieldString(phone, "(\\+84|0)([3|5|7|8|9])+([0-9]{8})", "Phone is wrong please enter new phone!");
                Boolean field_gender = gender.equals("male") ? true : false;
                Boolean field_isSuper = validate.fieldBoolean(isSuper, "isSuper error set field!");
                Date field_birthday = validate.fieldDate(birthday, "Birthday is wrong! Please try again");
                user.setUsername(field_username);
                user.setEmail(field_email);
                user.setPhone(field_phone);
                user.setFirst_name(first_name);
                user.setLast_name(last_name);
                user.setGender(field_gender);
                user.setBirthday(field_birthday);
                user.setIs_super(field_isSuper);
                user.setPermission(permission);
                Timestamp updated_at = new Timestamp(System.currentTimeMillis());
                user.setUpdated_at(updated_at);
                db.updateByAmin(user);
                String json = new Gson().toJson(user);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (Exception e) {
                String json = new Gson().toJson(new Error(e.getMessage()));
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
        } catch (Exception e) {
            String json = new Gson().toJson(new Error(e.getMessage()));
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
