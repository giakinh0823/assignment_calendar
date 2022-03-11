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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.auth.Permission;
import model.auth.User;
import model.auth.UserPermission;

/**
 *
 * @author giaki
 */
public class UserPermissionDBContext extends DBContext<UserPermission> {

    @Override
    public ArrayList<UserPermission> list() {
        ArrayList<UserPermission> user_permissions = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + ",[licensed]\n"
                + ",[userId]\n"
                + ",[permissionId]\n"
                + "  FROM [user_permission]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                UserPermission userPermission = new UserPermission();
                userPermission.setId(result.getInt("id"));
                userPermission.setLicensed(result.getBoolean("licensed"));
                userPermission.setUserId(result.getInt("userId"));
                userPermission.setPermissionId(result.getInt("permissionId"));
                user_permissions.add(userPermission);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user_permissions;
    }

    @Override
    public UserPermission get(int id) {
        String sql = "SELECT [id]\n"
                + ",[licensed]\n"
                + ",[userId]\n"
                + ",[permissionId]\n"
                + "  FROM [user_permission]\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                UserPermission userPermission = new UserPermission();
                userPermission.setId(result.getInt("id"));
                userPermission.setLicensed(result.getBoolean("licensed"));
                userPermission.setUserId(result.getInt("userId"));
                userPermission.setPermissionId(result.getInt("permissionId"));
                return userPermission;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public UserPermission insert(UserPermission model) {
        PreparedStatement statement = null;
        PermissionDBContext permissionDB = new PermissionDBContext();
        try {
            String sql = "INSERT INTO [user_permission]\n"
                    + "           ([licensed]\n"
                    + "           ,[userId]\n"
                    + "           ,[permissionId])\n"
                    + "     VALUES(?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setBoolean(1, model.isLicensed());
            statement.setInt(2, model.getUserId());
            statement.setInt(3, model.getPermissionId());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                return get(id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(UserPermission model) {
        PreparedStatement statement = null;
        try {
            String sql = "UPDATE [user_permission]\n"
                    + "         SET  [permissionId] = ?\n"
                    + " WHERE userId = ? ";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, model.getPermissionId());
            statement.setInt(2, model.getUserId());
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [user_permission]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteByUser(int userId) {
        try {
            String sql = "DELETE FROM [user_permission]\n"
                    + "WHERE [userId] = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
