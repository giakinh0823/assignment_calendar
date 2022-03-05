/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal.calendar;

import dal.DBContext;
import dal.auth.UserDBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.auth.Permission;
import model.calendar.Calendar;
import model.auth.User;

/**
 *
 * @author giaki
 */
public class CalendarDBContext extends DBContext<Calendar> {

    public ArrayList<Calendar> listByUser(int userId) {
        ArrayList<Calendar> calendars = new ArrayList<>();
        String sql = "SELECT [calendar].[id]\n"
                + "      ,[calendar].[name]\n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[userId]\n"
                + "      ,[calendar].[created_at]\n"
                + "      ,[calendar].[updated_at]\n"
                + "	 ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "  FROM [calendar]\n"
                + "  INNER JOIN [user] ON [user].[id] = [calendar].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]\n"
                + " WHERE [calendar].[userId] = ? ";

        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Calendar calendar = new Calendar();
                calendar.setId(result.getInt("id"));
                calendar.setName(result.getString("name"));
                calendar.setColor(result.getString("color"));
                calendar.setUserId(result.getInt("userId"));
                calendar.setCreated_at(result.getTimestamp("created_at"));
                calendar.setUpdated_at(result.getTimestamp("updated_at"));

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                calendar.setUser(user);
                calendars.add(calendar);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return calendars;
    }

    @Override
    public ArrayList<Calendar> list() {
        ArrayList<Calendar> calendars = new ArrayList<>();
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT [calendar].[id]\n"
                + "      ,[calendar].[name]\n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[userId]\n"
                + "      ,[calendar].[created_at]\n"
                + "      ,[calendar].[updated_at]\n"
                + "	  ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "  FROM [calendar]\n"
                + "  INNER JOIN [user] ON [user].[id] = [calendar].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Calendar calendar = new Calendar();
                calendar.setId(result.getInt("id"));
                calendar.setName(result.getString("name"));
                calendar.setColor(result.getString("color"));
                calendar.setUserId(result.getInt("userId"));
                calendar.setCreated_at(result.getTimestamp("created_at"));
                calendar.setUpdated_at(result.getTimestamp("updated_at"));

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                calendar.setUser(user);
                calendars.add(calendar);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return calendars;
    }

    @Override
    public Calendar get(int id) {
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT [calendar].[id]\n"
                + "      ,[calendar].[name]\n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[userId]\n"
                + "      ,[calendar].[created_at]\n"
                + "      ,[calendar].[updated_at]\n"
                + "	  ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "  FROM [calendar]\n"
                + "  INNER JOIN [user] ON [user].[id] = [calendar].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]\n"
                + " WHERE [calendar].[id] = ? ";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Calendar calendar = new Calendar();
                calendar.setId(result.getInt("id"));
                calendar.setName(result.getString("name"));
                calendar.setColor(result.getString("color"));
                calendar.setUserId(result.getInt("userId"));
                calendar.setCreated_at(result.getTimestamp("created_at"));
                calendar.setUpdated_at(result.getTimestamp("updated_at"));

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                calendar.setUser(user);
                return calendar;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Calendar insert(Calendar calendar) {
        PreparedStatement statement = null;
        String sql = "INSERT INTO [calendar]\n"
                + "           ([name]\n"
                + "           ,[color]\n"
                + "           ,[userId]\n"
                + "           ,[created_at]\n"
                + "           ,[updated_at])\n"
                + " VALUES(?, ?, ?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, calendar.getName());
            statement.setString(2, calendar.getColor());
            statement.setInt(3, calendar.getUserId());
            statement.setTimestamp(4, calendar.getCreated_at());
            statement.setTimestamp(5, calendar.getUpdated_at());
            statement.executeUpdate();
            ArrayList<Calendar> calendars = list();
            Calendar new_calendar = calendars.get(calendars.size() - 1);
            return new_calendar;
        } catch (SQLException ex) {
            Logger.getLogger(CalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(Calendar calendar) {
        PreparedStatement statement = null;
        String sql = "UPDATE [calendar]\n"
                + "   SET [name] = ?\n"
                + "      ,[color] = ?\n"
                + "      ,[userId] = ?\n"
                + "      ,[updated_at] = ?\n"
                + " WHERE id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, calendar.getName());
            statement.setString(2, calendar.getColor());
            statement.setInt(3, calendar.getUserId());
            statement.setTimestamp(4, calendar.getUpdated_at());
            statement.setInt(5, calendar.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [calendar]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getSize() {
        String sql = "SELECT COUNT([calendar].[id]) as 'size'  FROM [calendar]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int size = result.getInt("size");
                return size;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public ArrayList<Calendar> getCalendars(int pageIndex, int pageSize) {
        ArrayList<Calendar> calendars = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT [calendar].[id]\n"
                + "      ,[calendar].[name]\n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[userId]\n"
                + "      ,[calendar].[created_at]\n"
                + "      ,[calendar].[updated_at]\n"
                + "	  ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	 ,[permission].[id] as 'permissionId'\n"
                + "	 ,[permission].[name] as 'permissionName'\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [calendar].[id] DESC) as row_index\n"
                + "  FROM [calendar]\n"
                + "  INNER JOIN [user] ON [user].[id] = [calendar].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]) [calendar]\n"
                + " WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, pageIndex);
            statement.setInt(2, pageSize);
            statement.setInt(3, pageIndex);
            statement.setInt(4, pageSize);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Calendar calendar = new Calendar();
                calendar.setId(result.getInt("id"));
                calendar.setName(result.getString("name"));
                calendar.setColor(result.getString("color"));
                calendar.setUserId(result.getInt("userId"));
                calendar.setCreated_at(result.getTimestamp("created_at"));
                calendar.setUpdated_at(result.getTimestamp("updated_at"));

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                calendar.setUser(user);
                calendars.add(calendar);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return calendars;
    }

}
