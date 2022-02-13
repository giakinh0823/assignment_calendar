/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author giaki
 */
public class UserDBContext extends DBContext<User> {

    public User getUser(String username, String password) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[gender]\n"
                + "      ,[is_super]\n"
                + "      ,[is_active]\n"
                + "      ,[permission]\n"
                + "      ,[created_at]\n"
                + "      ,[updated_at]\n"
                + "      ,[birthday]\n"
                + "  FROM [user]\n"
                + " WHERE (username = ? or email = ?) and password = ? ";
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
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public User findOne(String field, String value) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[gender]\n"
                + "      ,[is_super]\n"
                + "      ,[is_active]\n"
                + "      ,[permission]\n"
                + "      ,[created_at]\n"
                + "      ,[updated_at]\n"
                + "      ,[birthday]\n"
                + "  FROM [user]\n";
        PreparedStatement statement = null;
        try {
            sql += " WHERE " + field + " = '" + value + "'";
            statement = connection.prepareStatement(sql);
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
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User get(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[gender]\n"
                + "      ,[is_super]\n"
                + "      ,[is_active]\n"
                + "      ,[permission]\n"
                + "      ,[created_at]\n"
                + "      ,[updated_at]\n"
                + "      ,[birthday]\n"
                + "  FROM [user]\n"
                + " WHERE id = ? ";
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
