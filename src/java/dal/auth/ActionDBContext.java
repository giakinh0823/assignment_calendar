/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal.auth;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.auth.Action;

/**
 *
 * @author giaki
 */
public class ActionDBContext extends DBContext<Action> {

    @Override
    public ArrayList<Action> list() {
        ArrayList<Action> actions = new ArrayList<>();
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[code]\n"
                + "  FROM [clife].[dbo].[action]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Action action = new Action();
                action.setId(result.getInt("id"));
                action.setTitle(result.getString("title"));
                action.setCode(result.getString("code"));
                actions.add(action);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return actions;
    }

    @Override
    public Action get(int id) {
        ArrayList<Action> actions = new ArrayList<>();
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[code]\n"
                + "  FROM [action]\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Action action = new Action();
                action.setId(result.getInt("id"));
                action.setTitle(result.getString("title"));
                action.setCode(result.getString("code"));
                return action;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Action insert(Action model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Action model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
