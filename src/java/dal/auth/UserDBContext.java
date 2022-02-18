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
public class UserDBContext extends DBContext<User> {

    public User getUser(String username, String password) {
        String sql = "SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at], [user_per].[permissionId], [permission].[name] as 'permissionName'\n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON user_per.id = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n"
                + " WHERE ([user].[username] = ? or [user].[email] = ?) and [user].[password] = ? ";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, username);
            statement.setString(3, password);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public User findOne(String field, String value) {
        String sql = "SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at], [user_per].[permissionId], [permission].[name] as 'permissionName'\n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON user_per.id = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n";
        PreparedStatement statement = null;
        try {
            sql += " WHERE [user].["+field+"] = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, field);
            statement.setString(2, value);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public int getNumberOfPermission(int id, String feature, String code) {
        String sql = "SELECT COUNT(*) as Total \n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON [user_per].[userId] = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n"
                + "INNER JOIN [permission_action] \n"
                + "ON [permission_action].[permissionId] = [user_per].[permissionId]\n"
                + "INNER JOIN [action] ON [action].[id] = [permission_action].[actionId]\n"
                + "WHERE [user].[id] = ? "
                + "AND [user_per].[licensed] = 1 "
                + "AND [permission_action].[licensed] = 1 "
                + "AND [action].[feature] = ? "
                + "AND [action].[code] = ? ";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, feature);
            statement.setString(3, code);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
               return result.getInt("Total");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User get(int id) {
        String sql = "SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at], [user_per].[permissionId], [permission].[name] as 'permissionName'\n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON user_per.id = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n"
                + " WHERE [user].[id] = ? ";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public User insert(User user) {
        PreparedStatement statement = null;
        UserPermissionDBContext userPermissionDB = new UserPermissionDBContext();
        try {
            String sql = "INSERT INTO [user]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[first_name]\n"
                    + "           ,[last_name]\n"
                    + "           ,[birthday]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[gender]\n"
                    + "           ,[is_super]\n"
                    + "           ,[is_active]\n"
                    + "           ,[permission]\n"
                    + "           ,[created_at]\n"
                    + "           ,[updated_at])\n"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFirst_name());
            statement.setString(4, user.getLast_name());
            statement.setDate(5, user.getBirthday());
            statement.setString(6, user.getEmail());
            statement.setString(7, user.getPhone());
            statement.setBoolean(8, user.getGender());
            statement.setBoolean(9, user.isIs_super());
            statement.setBoolean(10, user.isIs_active());
            statement.setString(11, user.getPermission());
            statement.setTimestamp(12, user.getCreated_at());
            statement.setTimestamp(13, user.getUpdated_at());
            statement.executeUpdate();
            User new_user = findOne("username", user.getUsername());

            UserPermission userPermission = new UserPermission();
            userPermission.setUserId(user.getId());
            userPermission.setPermissionId(user.getUser_permission().getId());
            userPermissionDB.insert(userPermission);
            return new_user;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(User model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
