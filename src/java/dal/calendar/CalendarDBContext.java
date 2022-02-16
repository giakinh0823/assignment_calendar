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
        String sql = "INSERT INTO [dbo].[calendar]\n"
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
            Calendar new_calendar = calendars.get(calendars.size()-1);
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
    public void update(Calendar model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
