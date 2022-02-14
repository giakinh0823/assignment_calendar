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
import model.CategoryCalendar;

/**
 *
 * @author giaki
 */
public class CategoryCalendarDBContext extends DBContext<CategoryCalendar>{

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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(CategoryCalendar model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
