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
import model.calendar.AdditionalCalendar;
import model.BaseModel;
import model.calendar.EventCalendar;
import model.auth.User;

/**
 *
 * @author giaki
 */
public class EventCalendarDBContext extends DBContext<EventCalendar> {
    
    
    public EventCalendar findOne(String field, String value) {
        UserDBContext userDB = new UserDBContext();
        AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[location]\n"
                + "      ,[updated_at]\n"
                + "      ,[created_at]\n"
                + "      ,[userId]\n"
                + "      ,[additionalId]\n"
                + "  FROM [event]\n"
                + " WHERE "+field+" = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, value);
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
    public ArrayList<EventCalendar> list() {
        UserDBContext userDB = new UserDBContext();
        AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[location]\n"
                + "      ,[updated_at]\n"
                + "      ,[created_at]\n"
                + "      ,[userId]\n"
                + "      ,[additionalId]\n"
                + "  FROM [event]";
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
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[location]\n"
                + "      ,[updated_at]\n"
                + "      ,[created_at]\n"
                + "      ,[userId]\n"
                + "      ,[additionalId]\n"
                + "  FROM [event]\n"
                + " WHERE id = ?";
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
    public EventCalendar insert(EventCalendar model) {
        PreparedStatement statement = null;
        try {
            String sql = "INSERT INTO [event]\n"
                    + "           ([title]\n"
                    + "           ,[description]\n"
                    + "           ,[location]\n"
                    + "           ,[updated_at]\n"
                    + "           ,[created_at]\n"
                    + "           ,[userId]\n"
                    + "           ,[additionalId])\n"
                    + "     VALUES(?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, model.getTitle());
            statement.setString(2, model.getDescription());
            statement.setString(3, model.getLocation());
            statement.setTimestamp(4, model.getCreated_at());
            statement.setTimestamp(5, model.getUpdated_at());
            statement.setInt(6, model.getUserId());
            statement.setInt(7, model.getAdditionalId());
            statement.executeUpdate();
            ArrayList<EventCalendar> events = list();
            EventCalendar new_event= events.get(events.size()-1);
            return new_event;
        } catch (SQLException ex) {
            Logger.getLogger(EventCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EventCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EventCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(EventCalendar model) {
        PreparedStatement statement = null;
        try {
            String sql = "UPDATE [event]\n"
                    + "   SET [title] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[location] = ?\n"
                    + "      ,[updated_at] = ?\n"
                    + "      ,[userId] = ?\n"
                    + "      ,[additionalId] = ?\n"
                    + " WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, model.getTitle());
            statement.setString(2, model.getDescription());
            statement.setString(3, model.getLocation());
            statement.setTimestamp(4, model.getUpdated_at());
            statement.setInt(5, model.getUserId());
            statement.setInt(6, model.getAdditionalId());
            statement.setInt(7, model.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EventCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EventCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EventCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public void deleteByAdditional(int id) {
        try {
            String sql = "DELETE FROM [event]\n"
                    + "WHERE [additionalId] = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EventCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [event]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EventCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getSize() {
        String sql = "SELECT COUNT([event].[id]) as 'size'  FROM [event]";
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
    
    public int getSizeSearch(String value) {
        String sql = "SELECT COUNT([event].[id]) as 'size' FROM [event]\n"
                + " INNER JOIN [user] on [user].id = [event].[userId]\n"
                + " WHERE [event].[title] LIKE ? or [event].[location] LIKE ? or \n"
                + " [user].[username] LIKE ? or [user].[email] LIKE ?\n";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%"+value+"%");
            statement.setString(2, "%"+value+"%");
            statement.setString(3, "%"+value+"%");
            statement.setString(4, "%"+value+"%");
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
    
    public ArrayList<EventCalendar> findEvents(String value,int pageIndex, int pageSize) {
        UserDBContext userDB = new UserDBContext();
        AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT * FROM \n"
                + "(SELECT [event].[id]\n" 
                + "      ,[event].[title]\n" 
                + "      ,[event].[description]\n" 
                + "      ,[event].[location]\n" 
                + "      ,[event].[updated_at]\n" 
                + "      ,[event].[created_at]\n" 
                + "      ,[event].[userId]\n" 
                + "      ,[event].[additionalId]\n" 
                + "	 ,[user].[username]\n" 
                + "	 ,[user].[email]\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [event].[id] ASC) as row_index\n"
                + "  FROM [event]  INNER JOIN [user] on [user].id = [event].[userId]\n"
                + " WHERE [event].[title] LIKE ? or [event].[location] LIKE ? or \n"
                + " [user].[username] LIKE ? or [user].[email] LIKE ?) [event]\n"
                + " WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%"+value+"%");
            statement.setString(2, "%"+value+"%");
            statement.setString(3, "%"+value+"%");
            statement.setString(4, "%"+value+"%");
            
            statement.setInt(5, pageIndex);
            statement.setInt(6, pageSize);
            statement.setInt(7, pageIndex);
            statement.setInt(8, pageSize);
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

    public ArrayList<EventCalendar> getEvents(int pageIndex, int pageSize) {
        UserDBContext userDB = new UserDBContext();
        AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT * FROM \n"
                + "(SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[location]\n"
                + "      ,[updated_at]\n"
                + "      ,[created_at]\n"
                + "      ,[userId]\n"
                + "      ,[additionalId]\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [event].[id] ASC) as row_index\n"
                + "  FROM [event]) [event]\n"
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

}
