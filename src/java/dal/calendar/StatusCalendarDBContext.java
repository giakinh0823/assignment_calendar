/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal.calendar;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BaseModel;
import model.calendar.StatusCalendar;

/**
 *
 * @author giaki
 */
public class StatusCalendarDBContext extends DBContext<StatusCalendar> {
    
    public StatusCalendar findOne(String field, String value) {
        ArrayList<StatusCalendar> statuss = new ArrayList<>();
        String sql = "SELECT id, name FROM [status_calendar]\n"
                + " WHERE LOWER("+field+") = LOWER(?)";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, value);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                StatusCalendar status = new StatusCalendar();
                status.setId(result.getInt("id"));
                status.setName(result.getString("name"));
                return status;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList list() {
        ArrayList<StatusCalendar> statuss = new ArrayList<>();
        String sql = "SELECT id, name FROM [status_calendar]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                StatusCalendar status = new StatusCalendar();
                status.setId(result.getInt("id"));
                status.setName(result.getString("name"));
                statuss.add(status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return statuss;
    }

    @Override
    public StatusCalendar get(int id) {
        String sql = "SELECT id, name FROM [status_calendar]\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                StatusCalendar status = new StatusCalendar();
                status.setId(result.getInt("id"));
                status.setName(result.getString("name"));
                return status;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public StatusCalendar insert(StatusCalendar model) {
        String sql = "INSERT INTO [status_calendar]\n"
                + " ([name])\n"
                + " VALUES(?)";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setString(1, model.getName());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                return get(id);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(StatusCalendar model) {
        String sql = "UPDATE [status_calendar]\n"
                + " SET name = ?\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, model.getName());
            statement.setInt(2, model.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [status_calendar]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StatusCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
