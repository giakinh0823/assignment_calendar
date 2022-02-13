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

/**
 *
 * @author giaki
 */
public class AdditionalCalendarDBContext extends DBContext<AdditionalCalendar> {
    
    @Override
    public ArrayList<AdditionalCalendar> list() {
        ArrayList<AdditionalCalendar> listAdditional = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[start_date]\n"
                + "      ,[end_date]\n"
                + "      ,[overlap]\n"
                + "      ,[display]\n"
                + "      ,[isOnlyDate]\n"
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
                additional.setIsOnlyDate(result.getBoolean("isOnlyDate"));
                additional.setCreated_at(result.getTimestamp("created_at"));
                additional.setUpdated_at(result.getTimestamp("updated_at"));
                additional.setCalendarId(result.getInt("calendarId"));
                additional.setStatusId(result.getInt("statusId"));
                additional.setCategoryId(result.getInt("categoryId"));
                listAdditional.add(additional);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAdditional;
    }
    
    @Override
    public AdditionalCalendar get(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[start_date]\n"
                + "      ,[end_date]\n"
                + "      ,[overlap]\n"
                + "      ,[display]\n"
                + "      ,[isOnlyDate]\n"
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
                additional.setIsOnlyDate(result.getBoolean("isOnlyDate"));
                additional.setCreated_at(result.getTimestamp("created_at"));
                additional.setUpdated_at(result.getTimestamp("updated_at"));
                additional.setCalendarId(result.getInt("calendarId"));
                additional.setStatusId(result.getInt("statusId"));
                additional.setCategoryId(result.getInt("categoryId"));
                return additional;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    @Override
    public void insert(AdditionalCalendar model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public void update(AdditionalCalendar model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
