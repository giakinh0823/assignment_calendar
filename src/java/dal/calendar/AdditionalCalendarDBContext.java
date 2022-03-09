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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.calendar.AdditionalCalendar;
import model.calendar.Calendar;
import model.calendar.CategoryCalendar;
import model.calendar.StatusCalendar;

/**
 *
 * @author giaki
 */
public class AdditionalCalendarDBContext extends DBContext<AdditionalCalendar> {

    public AdditionalCalendar findOne(String field, String value) {
        String sql = "SELECT [additional_calendar].[id]\n"
                + "      ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at]\n"
                + "      ,[additional_calendar].[updated_at]\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "      ,[calendar].[userId]\n"
                + "	 ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	 ,[status_calendar].[name] as 'statusName'\n"
                + "	 ,[category_calendar].[name] as 'categoryName'\n"
                + "  FROM [additional_calendar]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]\n"
                + " WHERE [additional_calendar].[" + field + "] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, value);
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

                Calendar calendar = new Calendar();
                calendar.setId(result.getInt("calendarId"));
                calendar.setName(result.getString("calendarName"));
                calendar.setColor(result.getString("color"));
                calendar.setUserId(result.getInt("userId"));
                calendar.setCreated_at(result.getTimestamp("calendar_created_at"));
                calendar.setUpdated_at(result.getTimestamp("calendar_updated_at"));
                additional.setCalendar(calendar);

                CategoryCalendar category = new CategoryCalendar();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                additional.setCategory(category);

                StatusCalendar status = new StatusCalendar();
                status.setId(result.getInt("statusId"));
                status.setName(result.getString("statusName"));
                additional.setStatus(status);
                return additional;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<AdditionalCalendar> findMany(String field, String value) {
        ArrayList<AdditionalCalendar> listAdditional = new ArrayList<>();
        String sql = "SELECT [additional_calendar].[id]\n"
                + "      ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at]\n"
                + "      ,[additional_calendar].[updated_at]\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "      ,[calendar].[userId]\n"
                + "	 ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	  ,[status_calendar].[name] as 'statusName'\n"
                + "	  ,[category_calendar].[name] as 'categoryName'\n"
                + "  FROM [additional_calendar]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]\n"
                + " WHERE [additional_calendar].[" + field + "] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, value);
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

                Calendar calendar = new Calendar();
                calendar.setId(result.getInt("calendarId"));
                calendar.setName(result.getString("calendarName"));
                calendar.setColor(result.getString("color"));
                calendar.setUserId(result.getInt("userId"));
                calendar.setCreated_at(result.getTimestamp("calendar_created_at"));
                calendar.setUpdated_at(result.getTimestamp("calendar_updated_at"));
                additional.setCalendar(calendar);

                CategoryCalendar category = new CategoryCalendar();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                additional.setCategory(category);

                StatusCalendar status = new StatusCalendar();
                status.setId(result.getInt("statusId"));
                status.setName(result.getString("statusName"));
                additional.setStatus(status);
                listAdditional.add(additional);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAdditional;
    }

    @Override
    public ArrayList<AdditionalCalendar> list() {
        ArrayList<AdditionalCalendar> listAdditional = new ArrayList<>();
        String sql = "SELECT [additional_calendar].[id]\n"
                + "      ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at]\n"
                + "      ,[additional_calendar].[updated_at]\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "      ,[calendar].[userId]\n"
                + "	 ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	 ,[status_calendar].[name] as 'statusName'\n"
                + "	 ,[category_calendar].[name] as 'categoryName'\n"
                + "  FROM [additional_calendar]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]";
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

                Calendar calendar = new Calendar();
                calendar.setId(result.getInt("calendarId"));
                calendar.setName(result.getString("calendarName"));
                calendar.setColor(result.getString("color"));
                calendar.setUserId(result.getInt("userId"));
                calendar.setCreated_at(result.getTimestamp("calendar_created_at"));
                calendar.setUpdated_at(result.getTimestamp("calendar_updated_at"));
                additional.setCalendar(calendar);

                CategoryCalendar category = new CategoryCalendar();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                additional.setCategory(category);

                StatusCalendar status = new StatusCalendar();
                status.setId(result.getInt("statusId"));
                status.setName(result.getString("statusName"));
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
        String sql = "SELECT [additional_calendar].[id]\n"
                + "      ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at]\n"
                + "      ,[additional_calendar].[updated_at]\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "      ,[calendar].[userId]\n"
                + "	 ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	  ,[status_calendar].[name] as 'statusName'\n"
                + "	  ,[category_calendar].[name] as 'categoryName'\n"
                + "  FROM [additional_calendar]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]\n"
                + " WHERE [additional_calendar].[id] = ?";
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

                Calendar calendar = new Calendar();
                calendar.setId(result.getInt("calendarId"));
                calendar.setName(result.getString("calendarName"));
                calendar.setColor(result.getString("color"));
                calendar.setUserId(result.getInt("userId"));
                calendar.setCreated_at(result.getTimestamp("calendar_created_at"));
                calendar.setUpdated_at(result.getTimestamp("calendar_updated_at"));
                additional.setCalendar(calendar);

                CategoryCalendar category = new CategoryCalendar();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                additional.setCategory(category);

                StatusCalendar status = new StatusCalendar();
                status.setId(result.getInt("statusId"));
                status.setName(result.getString("statusName"));
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
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
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
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                return get(id);
            }
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
            statement.setTimestamp(7, model.getUpdated_at());
            statement.setInt(8, model.getCalendarId());
            statement.setInt(9, model.getStatusId());
            statement.setInt(10, model.getCategoryId());
            statement.setInt(11, model.getId());
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
        try {
            String sql = "DELETE FROM [additional_calendar]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
