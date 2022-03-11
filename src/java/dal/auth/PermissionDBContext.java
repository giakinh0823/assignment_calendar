/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal.auth;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.calendar.Calendar;
import model.auth.Permission;

/**
 *
 * @author giaki
 */
public class PermissionDBContext extends DBContext<Permission> {
    
    public Permission findOne(String name) {
        ArrayList<Permission> permissions = new ArrayList<>();
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [permission]\n"
                + " WHERE LOWER(name) = LOWER(?)";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Permission permission = new Permission();
                permission.setId(result.getInt("id"));
                permission.setName(result.getString("name"));
                return permission;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Permission> list() {
        ArrayList<Permission> permissions = new ArrayList<>();
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [permission]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Permission permission = new Permission();
                permission.setId(result.getInt("id"));
                permission.setName(result.getString("name"));
                permissions.add(permission);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return permissions;
    }

    @Override
    public Permission get(int id) {
        ArrayList<Permission> permissions = new ArrayList<>();
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [permission]\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Permission permission = new Permission();
                permission.setId(result.getInt("id"));
                permission.setName(result.getString("name"));
                return permission;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Permission insert(Permission model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Permission model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
