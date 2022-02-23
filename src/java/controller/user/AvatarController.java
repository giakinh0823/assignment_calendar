/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import com.google.gson.Gson;
import controller.auth.BaseAuthController;
import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.auth.User;
import utils.FileManage;
import utils.Validate;

/**
 *
 * @author giaki
 */
@MultipartConfig
public class AvatarController extends BaseAuthController {

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numRead = userDB.getNumberOfPermission(user.getId(), "PROFILE", "READ");
        return numRead >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "PROFILE", "EDIT");
        return numEdit >= 1;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDBContext userDB = new UserDBContext();
            Validate validate = new Validate();
            Part part = validate.getFieldAjaxFile(request, "avatar", true);
            FileManage fileManage = new FileManage();
            String folder = request.getServletContext().getRealPath("/assets/images/user");
            String filename = null;
            User user = (User) request.getSession().getAttribute("user");
            if (part.getSize() != 0) {
                if (user.getAvatar() != null && !user.getAvatar().isEmpty()) {
                    fileManage.delete(user.getAvatar(), folder);
                }
                filename = fileManage.upLoad(part, folder);
            }
            if (filename != null) {
                user.setAvatar(filename);
            }
            Timestamp updated_at = new Timestamp(System.currentTimeMillis());
            user.setUpdated_at(updated_at);
            userDB.updateAvatar(user);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("/profile");
        } catch (Exception e) {
            String json = new Gson().toJson(new Error(e.getMessage()));
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
