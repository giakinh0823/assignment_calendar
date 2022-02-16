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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(StatusCalendar model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
