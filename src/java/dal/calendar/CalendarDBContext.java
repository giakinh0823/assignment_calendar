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
import model.calendar.Calendar;
import model.auth.User;

/**
 *
 * @author giaki
 */
public class CalendarDBContext extends DBContext<Calendar> {

    public ArrayList<Calendar> listByUser(int userId) {
        ArrayList<Calendar> calendars = new ArrayList<>();
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT id, name, color, userId, created_at, updated_at FROM [calendar]"
                + " WHERE userId = ?";
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

                User user = userDB.get(calendar.getUserId());
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
        String sql = "SELECT id, name, color, userId, created_at, updated_at FROM [calendar]";
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

                User user = userDB.get(calendar.getUserId());
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
        String sql = "SELECT id, name, color, userId, created_at, updated_at FROM [calendar]\n"
                + " WHERE id = ?";
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

                User user = userDB.get(calendar.getUserId());
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
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT * FROM \n"
                + " (SELECT id, name, color, userId, created_at, updated_at, ROW_NUMBER() OVER (ORDER BY [calendar].[id] ASC) as row_index\n"
                + " FROM [calendar]) [calendar]\n"
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

                User user = userDB.get(calendar.getUserId());
                calendar.setUser(user);
                calendars.add(calendar);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return calendars;
    }

}
