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
import model.calendar.AdditionalCalendar;
import model.calendar.CategoryCalendar;

/**
 *
 * @author giaki
 */
public class CategoryCalendarDBContext extends DBContext<CategoryCalendar> {

    @Override
    public ArrayList<CategoryCalendar> list() {
        ArrayList<CategoryCalendar> categorys = new ArrayList<>();
        String sql = "SELECT id, name FROM [category_calendar]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                CategoryCalendar category = new CategoryCalendar();
                category.setId(result.getInt("id"));
                category.setName(result.getString("name"));
                categorys.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }

    @Override
    public CategoryCalendar get(int id) {
        String sql = "SELECT id, name FROM [category_calendar]\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                CategoryCalendar category = new CategoryCalendar();
                category.setId(result.getInt("id"));
                category.setName(result.getString("name"));
                return category;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public CategoryCalendar insert(CategoryCalendar model) {
        String sql = "INSERT INTO [category_calendar]\n"
                + " ([name])\n"
                + " VALUES(?)";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, model.getName());
            statement.executeUpdate();
            ArrayList<CategoryCalendar> categorys = list();
            return categorys.get(categorys.size()-1);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(CategoryCalendar model) {
        String sql = "UPDATE [category_calendar]\n"
                + " SET name = ?\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, model.getName());
            statement.setInt(2, model.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
            EventCalendarDBContext eventDB = new EventCalendarDBContext();
            ArrayList<AdditionalCalendar> additionals = additionalDB.findMany("categoryId", id+"");
            for (AdditionalCalendar additional : additionals) {
                eventDB.deleteByAdditional(additional.getId());
                additionalDB.delete(additional.getId());
            }
            String sql = "DELETE FROM [category_calendar]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
