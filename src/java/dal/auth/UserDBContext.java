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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.auth.Permission;
import model.auth.User;
import model.auth.UserPermission;

/**
 *
 * @author giaki
 */
public class UserDBContext extends DBContext<User> {

    public User getUser(String username, String password) {
        String sql = "SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[avatar]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at], [user_per].[permissionId], [permission].[name] as 'permissionName'\n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON [user_per].[userId] = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n"
                + " WHERE ([user].[username] = ? or [user].[email] = ?) and [user].[password] = ? ";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, username);
            statement.setString(3, password);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                user.setAvatar(result.getString("avatar"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public User findOne(String field, String value) {
        String sql = "SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[avatar]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at], [user_per].[permissionId], [permission].[name] as 'permissionName'\n"
                + "FROM [user] FULL OUTER JOIN [user_permission] as [user_per]\n"
                + "ON [user_per].[userId] = [user].[id]\n"
                + "FULL OUTER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n";
        PreparedStatement statement = null;
        try {
            sql += " WHERE [user].["+field+"] = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, value);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                user.setAvatar(result.getString("avatar"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public int getNumberOfPermission(int id, String feature, String code) {
        String sql = "SELECT COUNT(*) as Total \n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON [user_per].[userId] = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n"
                + "INNER JOIN [permission_action] \n"
                + "ON [permission_action].[permissionId] = [user_per].[permissionId]\n"
                + "INNER JOIN [action] ON [action].[id] = [permission_action].[actionId]\n"
                + "WHERE [user].[id] = ? "
                + "AND [user_per].[licensed] = 1 "
                + "AND [permission_action].[licensed] = 1 "
                + "AND [action].[feature] = ? "
                + "AND [action].[code] = ? ";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, feature);
            statement.setString(3, code);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
               return result.getInt("Total");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }
    
    
    public ArrayList<User> findUsers(String value, int pageIndex, int pageSize) {
        ArrayList<User> users = new ArrayList<User>();
        String sql = "SELECT * FROM \n"
                + "(SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[avatar]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at]\n"
                + "      ,[user_per].[permissionId]\n"
                + "      ,[permission].[name] as 'permissionName'\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [user].[id] ASC) as row_index\n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON [user_per].[userId] = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n"
                + " WHERE [user].[username] LIKE ? or [user].[email] LIKE ? or [user].[phone] LIKE ?) [user]\n"
                + "WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%"+value+"%");
            statement.setString(2, "%"+value+"%");
            statement.setString(3, "%"+value+"%");
         
            statement.setInt(4, pageIndex);
            statement.setInt(5, pageSize);
            statement.setInt(6, pageIndex);
            statement.setInt(7, pageSize);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                user.setAvatar(result.getString("avatar"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }
    
    
    public ArrayList<User> getUsers(int pageIndex, int pageSize) {
        ArrayList<User> users = new ArrayList<User>();
        String sql = "SELECT * FROM \n"
                + "(SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[avatar]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at]\n"
                + "      ,[user_per].[permissionId]\n"
                + "      ,[permission].[name] as 'permissionName'\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [user].[id] ASC) as row_index\n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON [user_per].[userId] = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]) [user]\n"
                + "WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, pageIndex);
            statement.setInt(2, pageSize);
            statement.setInt(3, pageIndex);
            statement.setInt(4, pageSize);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                user.setAvatar(result.getString("avatar"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }
    
    public int getSizeSearch(String value){
        String sql = "SELECT COUNT([user].[id]) as 'size'  FROM [user]\n"
                + " WHERE [user].[username] LIKE ? or [user].[email] LIKE ? or [user].[phone] LIKE ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%"+value+"%");
            statement.setString(2, "%"+value+"%");
            statement.setString(3, "%"+value+"%");
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
    
    public int getSize(){
        String sql = "SELECT COUNT([user].[id]) as 'size'  FROM [user]";
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

    @Override
    public ArrayList<User> list() {
        ArrayList<User> users = new ArrayList<User>();
        String sql = "SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[avatar]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at], [user_per].[permissionId], [permission].[name] as 'permissionName'\n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON [user_per].[userId] = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                user.setAvatar(result.getString("avatar"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }

    @Override
    public User get(int id) {
        String sql = "SELECT [user].[id]\n"
                + "      ,[user].[username]\n"
                + "      ,[user].[password]\n"
                + "      ,[user].[first_name]\n"
                + "      ,[user].[last_name]\n"
                + "      ,[user].[birthday]\n"
                + "      ,[user].[email]\n"
                + "      ,[user].[phone]\n"
                + "      ,[user].[gender]\n"
                + "      ,[user].[is_super]\n"
                + "      ,[user].[is_active]\n"
                + "      ,[user].[permission]\n"
                + "      ,[user].[avatar]\n"
                + "      ,[user].[created_at]\n"
                + "      ,[user].[updated_at], [user_per].[permissionId], [permission].[name] as 'permissionName'\n"
                + "FROM [user] INNER JOIN [user_permission] as [user_per]\n"
                + "ON [user_per].[userId] = [user].[id]\n"
                + "INNER JOIN [permission]\n"
                + "ON [permission].[id] = [user_per].[permissionId]\n"
                + " WHERE [user].[id] = ? ";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                User user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("last_name"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("is_active"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setCreated_at(result.getTimestamp("created_at"));
                user.setUpdated_at(result.getTimestamp("updated_at"));
                user.setAvatar(result.getString("avatar"));
                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public User insert(User user) {
        PreparedStatement statement = null;
        UserPermissionDBContext userPermissionDB = new UserPermissionDBContext();
        try {
            String sql = "INSERT INTO [user]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[first_name]\n"
                    + "           ,[last_name]\n"
                    + "           ,[birthday]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[gender]\n"
                    + "           ,[is_super]\n"
                    + "           ,[is_active]\n"
                    + "           ,[permission]\n"
                    + "           ,[created_at]\n"
                    + "           ,[updated_at])\n"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFirst_name());
            statement.setString(4, user.getLast_name());
            statement.setDate(5, user.getBirthday());
            statement.setString(6, user.getEmail());
            statement.setString(7, user.getPhone());
            statement.setBoolean(8, user.getGender());
            statement.setBoolean(9, user.isIs_super());
            statement.setBoolean(10, user.isIs_active());
            statement.setString(11, user.getPermission());
            statement.setTimestamp(12, user.getCreated_at());
            statement.setTimestamp(13, user.getUpdated_at());
            statement.executeUpdate();
            User new_user = findOne("username", user.getUsername());
            UserPermission userPermission = new UserPermission();
            userPermission.setUserId(new_user.getId());
            userPermission.setPermissionId(user.getUser_permission().getId());
            userPermissionDB.insert(userPermission);
            
            return new_user;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public void updateByAmin(User user) {
        PreparedStatement statement = null;
        UserPermissionDBContext userPermissionDB = new UserPermissionDBContext();
        try {
            String sql = "UPDATE [user]\n" +
                        " SET [username] = ?\n" +
                        "    ,[first_name] = ?\n" +
                        "    ,[last_name] = ?\n" +
                        "    ,[birthday] = ?\n" +
                        "    ,[email] = ?\n" +
                        "    ,[phone] = ?\n" +
                        "    ,[gender] = ?\n" +
                        "    ,[is_super] = ?\n" +
                        "    ,[is_active] = ?\n" +
                        "    ,[permission] = ?\n" +
                        "    ,[updated_at] = ?\n" +
                        " WHERE id = ? ";
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getFirst_name());
            statement.setString(3, user.getLast_name());
            statement.setDate(4, user.getBirthday());
            statement.setString(5, user.getEmail());
            statement.setString(6, user.getPhone());
            statement.setBoolean(7, user.getGender());
            statement.setBoolean(8, user.isIs_super());
            statement.setBoolean(9, user.isIs_active());
            statement.setString(10, user.getPermission());
            statement.setTimestamp(11, user.getUpdated_at());
            statement.setInt(12, user.getId());
            statement.executeUpdate();
            
            UserPermission userPermission = new UserPermission();
            userPermission.setUserId(user.getId());
            userPermission.setPermissionId(user.getUser_permission().getId());
            userPermissionDB.update(userPermission);
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    @Override
    public void update(User user) {
        PreparedStatement statement = null;
        UserPermissionDBContext userPermissionDB = new UserPermissionDBContext();
        try {
            String sql = "UPDATE [user]\n" +
                        " SET [first_name] = ?\n"
                    + "      ,[last_name] = ?\n"
                    + "      ,[birthday] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[gender] = ?\n"
                    + "      ,[updated_at] = ?\n"
                    + " WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getFirst_name());
            statement.setString(2, user.getLast_name());
            statement.setDate(3, user.getBirthday());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getPhone());
            statement.setBoolean(6, user.getGender());
            statement.setTimestamp(7, user.getUpdated_at());
            statement.setInt(8, user.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public void updateAvatar(User user) {
        PreparedStatement statement = null;
        UserPermissionDBContext userPermissionDB = new UserPermissionDBContext();
        try {
            String sql = "UPDATE [user]\n" +
                        " SET [avatar] = ?\n"
                    + "      ,[updated_at] = ?\n"
                    + " WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getAvatar());
            statement.setTimestamp(2, user.getUpdated_at());
            statement.setInt(3, user.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    public void delete(int id) {
        UserPermissionDBContext userPermissionDB = new UserPermissionDBContext();
        try {
            userPermissionDB.deleteByUser(id);
            String sql = "DELETE FROM [user]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
