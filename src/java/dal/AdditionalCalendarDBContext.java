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
import model.AdditionalCalendar;
import model.Calendar;
import model.CategoryCalendar;
import model.StatusCalendar;

/**
 *
 * @author giaki
 */
public class AdditionalCalendarDBContext extends DBContext<AdditionalCalendar> {

    @Override
    public ArrayList<AdditionalCalendar> list() {
        ArrayList<AdditionalCalendar> listAdditional = new ArrayList<>();
        CalendarDBContext calendarDB = new CalendarDBContext();
        CategoryCalendarDBContext categoryDB = new CategoryCalendarDBContext();
        StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
        
        String sql = "SELECT [id]\n"
                + "      ,[start_date]\n"
                + "      ,[end_date]\n"
                + "      ,[overlap]\n"
                + "      ,[display]\n"
                + "      ,[isAllDay]\n"
                + "      ,[isHasEnd]\n"
                + "      ,[created_at]\n"
                + "      ,[updated_at]\n"
                + "      ,[calendarId]\n"
                + "      ,[statusId]\n"
                + "      ,[categoryId]\n"
                + "  FROM [additional_calendar]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                AdditionalCalendar additional = new AdditionalCalendar();
                additional.setId(result.getInt("id"));
                additional.setStartDate(result.getTimestamp("start_date"));
                additional.setEndDate(result.getTimestamp("end_date"));
                additional.setOverlap(result.getBoolean("overlap"));
                additional.setDisplay(result.getString("display"));
                additional.setIsAllDay(result.getBoolean("isAllDay"));
                additional.setIsHasEnd(result.getBoolean("isHasEnd"));
                additional.setCreated_at(result.getTimestamp("created_at"));
                additional.setUpdated_at(result.getTimestamp("updated_at"));
                additional.setCalendarId(result.getInt("calendarId"));
                additional.setStatusId(result.getInt("statusId"));
                additional.setCategoryId(result.getInt("categoryId"));
                Calendar calendar = calendarDB.get(additional.getCalendarId());
                additional.setCalendar(calendar);
                CategoryCalendar category = categoryDB.get(additional.getCategoryId());
                additional.setCategory(category);
                StatusCalendar status = statusDB.get(additional.getStatusId());
                additional.setStatus(status);
                listAdditional.add(additional);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAdditional;
    }

    @Override
    public AdditionalCalendar get(int id) {
        CalendarDBContext calendarDB = new CalendarDBContext();
        CategoryCalendarDBContext categoryDB = new CategoryCalendarDBContext();
        StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
        String sql = "SELECT [id]\n"
                + "      ,[start_date]\n"
                + "      ,[end_date]\n"
                + "      ,[overlap]\n"
                + "      ,[display]\n"
                + "      ,[isAllDay]\n"
                + "      ,[isHasEnd]\n"
                + "      ,[created_at]\n"
                + "      ,[updated_at]\n"
                + "      ,[calendarId]\n"
                + "      ,[statusId]\n"
                + "      ,[categoryId]\n"
                + "  FROM [additional_calendar]\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                AdditionalCalendar additional = new AdditionalCalendar();
                additional.setId(result.getInt("id"));
                additional.setStartDate(result.getTimestamp("start_date"));
                additional.setEndDate(result.getTimestamp("end_date"));
                additional.setOverlap(result.getBoolean("overlap"));
                additional.setDisplay(result.getString("display"));
                additional.setIsAllDay(result.getBoolean("isAllDay"));
                additional.setIsHasEnd(result.getBoolean("isHasEnd"));
                additional.setCreated_at(result.getTimestamp("created_at"));
                additional.setUpdated_at(result.getTimestamp("updated_at"));
                additional.setCalendarId(result.getInt("calendarId"));
                additional.setStatusId(result.getInt("statusId"));
                additional.setCategoryId(result.getInt("categoryId"));
                Calendar calendar = calendarDB.get(additional.getCalendarId());
                additional.setCalendar(calendar);
                CategoryCalendar category = categoryDB.get(additional.getCategoryId());
                additional.setCategory(category);
                StatusCalendar status = statusDB.get(additional.getStatusId());
                additional.setStatus(status);
                return additional;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public AdditionalCalendar insert(AdditionalCalendar model) {
        PreparedStatement statement = null;
        try {
            String sql = "INSERT INTO [additional_calendar]\n"
                    + "           ([start_date]\n"
                    + "           ,[end_date]\n"
                    + "           ,[overlap]\n"
                    + "           ,[display]\n"
                    + "           ,[isAllDay]\n"
                    + "           ,[isHasEnd]\n"
                    + "           ,[created_at]\n"
                    + "           ,[updated_at]\n"
                    + "           ,[calendarId]\n"
                    + "           ,[statusId]\n"
                    + "           ,[categoryId])\n"
                    + "     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setTimestamp(1, model.getStartDate());
            statement.setTimestamp(2, model.getEndDate());
            statement.setBoolean(3, model.isOverlap());
            statement.setString(4, model.getDisplay());
            statement.setBoolean(5, model.isIsAllDay());
            statement.setBoolean(6, model.isIsHasEnd());
            statement.setTimestamp(7, model.getCreated_at());
            statement.setTimestamp(8, model.getUpdated_at());
            statement.setInt(9, model.getCalendarId());
            statement.setInt(10, model.getStatusId());
            statement.setInt(11, model.getCategoryId());
            statement.executeUpdate();
            ArrayList<AdditionalCalendar> additionals = list();
            AdditionalCalendar additional = additionals.get(additionals.size() - 1);
            return additional;
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(AdditionalCalendar model) {
        PreparedStatement statement = null;
        try {
            String sql = "UPDATE [additional_calendar]\n"
                    + "   SET [start_date] = ?\n"
                    + "      ,[end_date] = ?\n"
                    + "      ,[overlap] = ?\n"
                    + "      ,[display] = ?\n"
                    + "      ,[isAllDay] = ?\n"
                    + "      ,[isHasEnd] = ?\n"
                    + "      ,[created_at] = ?\n"
                    + "      ,[updated_at] = ?\n"
                    + "      ,[calendarId] = ?\n"
                    + "      ,[statusId] = ?\n"
                    + "      ,[categoryId] = ?\n"
                    + " WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setTimestamp(1, model.getStartDate());
            statement.setTimestamp(2, model.getEndDate());
            statement.setBoolean(3, model.isOverlap());
            statement.setString(4, model.getDisplay());
            statement.setBoolean(5, model.isIsAllDay());
            statement.setBoolean(6, model.isIsHasEnd());
            statement.setTimestamp(7, model.getCreated_at());
            statement.setTimestamp(8, model.getUpdated_at());
            statement.setInt(9, model.getCalendarId());
            statement.setInt(10, model.getStatusId());
            statement.setInt(11, model.getCategoryId());
            statement.setInt(12, model.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
