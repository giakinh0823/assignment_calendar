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
import model.BaseModel;
import model.EventCalendar;
import model.User;

/**
 *
 * @author giaki
 */
public class EventCalendarDBContext extends DBContext<EventCalendar> {

    @Override
    public ArrayList<EventCalendar> list() {
        UserDBContext userDB = new UserDBContext();
        AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT [id]\n" +
                    "      ,[title]\n" +
                    "      ,[description]\n" +
                    "      ,[location]\n" +
                    "      ,[updated_at]\n" +
                    "      ,[created_at]\n" +
                    "      ,[userId]\n" +
                    "      ,[additionalId]\n" +
                    "  FROM [event]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                EventCalendar eventCalendar = new EventCalendar();
                eventCalendar.setId(result.getInt("id"));
                eventCalendar.setTitle(result.getString("title"));
                eventCalendar.setDescription(result.getString("description"));
                eventCalendar.setLocation(result.getString("location"));
                eventCalendar.setCreated_at(result.getTimestamp("created_at"));
                eventCalendar.setUpdated_at(result.getTimestamp("updated_at"));
                eventCalendar.setUserId(result.getInt("userId"));
                eventCalendar.setAdditionalId(result.getInt("additionalId"));
                
                User user = userDB.get(eventCalendar.getUserId());
                AdditionalCalendar additionalCalendar = additionalDB.get(eventCalendar.getAdditionalId());
                
                eventCalendar.setUser(user);
                eventCalendar.setAdditional(additionalCalendar);
                events.add(eventCalendar);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return events;
    }

    @Override
    public EventCalendar get(int id) {
        UserDBContext userDB = new UserDBContext();
        AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT [id]\n" +
                    "      ,[title]\n" +
                    "      ,[description]\n" +
                    "      ,[location]\n" +
                    "      ,[updated_at]\n" +
                    "      ,[created_at]\n" +
                    "      ,[userId]\n" +
                    "      ,[additionalId]\n" +
                    "  FROM [event]\n" + 
                    " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                EventCalendar eventCalendar = new EventCalendar();
                eventCalendar.setId(result.getInt("id"));
                eventCalendar.setTitle(result.getString("title"));
                eventCalendar.setDescription(result.getString("description"));
                eventCalendar.setLocation(result.getString("location"));
                eventCalendar.setCreated_at(result.getTimestamp("created_at"));
                eventCalendar.setUpdated_at(result.getTimestamp("updated_at"));
                eventCalendar.setUserId(result.getInt("userId"));
                eventCalendar.setAdditionalId(result.getInt("additionalId"));
                
                User user = userDB.get(eventCalendar.getUserId());
                AdditionalCalendar additionalCalendar = additionalDB.get(eventCalendar.getAdditionalId());
                
                eventCalendar.setUser(user);
                eventCalendar.setAdditional(additionalCalendar);
                return eventCalendar;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(EventCalendar model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(EventCalendar model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
