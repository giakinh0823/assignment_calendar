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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.calendar.AdditionalCalendar;
import model.BaseModel;
import model.auth.Permission;
import model.calendar.EventCalendar;
import model.auth.User;
import model.calendar.Calendar;
import model.calendar.CategoryCalendar;
import model.calendar.StatusCalendar;

/**
 *
 * @author giaki
 */
public class EventCalendarDBContext extends DBContext<EventCalendar> {

    public EventCalendar findOne(String field, String value) {
        UserDBContext userDB = new UserDBContext();
        String sql = "SELECT [event].[id]\n"
                + "      ,[event].[title]\n"
                + "      ,[event].[description]\n"
                + "      ,[event].[location]\n"
                + "      ,[event].[updated_at]\n"
                + "      ,[event].[created_at]\n"
                + "      ,[event].[userId]\n"
                + "      ,[event].[additionalId]\n"
                + "	  ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "	  ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at] as 'additional_created_at'\n"
                + "      ,[additional_calendar].[updated_at] as 'additional_updated_at'\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "	  ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	  ,[status_calendar].[name] as 'statusName'\n"
                + "	  ,[category_calendar].[name] as 'categoryName'\n"
                + "  FROM [event]\n"
                + "  INNER JOIN [user] ON [user].[id] = [event].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]\n"
                + "  INNER JOIN [additional_calendar] ON [additional_calendar].[id] = [event].[additionalId]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]\n"
                + " WHERE " + field + " = ?";
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

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                AdditionalCalendar additional = new AdditionalCalendar();
                additional.setId(result.getInt("additionalId"));
                additional.setStartDate(result.getTimestamp("start_date"));
                additional.setEndDate(result.getTimestamp("end_date"));
                additional.setOverlap(result.getBoolean("overlap"));
                additional.setDisplay(result.getString("display"));
                additional.setIsAllDay(result.getBoolean("isAllDay"));
                additional.setIsHasEnd(result.getBoolean("isHasEnd"));
                additional.setCreated_at(result.getTimestamp("additional_created_at"));
                additional.setUpdated_at(result.getTimestamp("additional_updated_at"));
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

                eventCalendar.setUser(user);
                eventCalendar.setAdditional(additional);
                return eventCalendar;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<EventCalendar> findByUser(int userid) {
        UserDBContext userDB = new UserDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT [event].[id]\n"
                + "      ,[event].[title]\n"
                + "      ,[event].[description]\n"
                + "      ,[event].[location]\n"
                + "      ,[event].[updated_at]\n"
                + "      ,[event].[created_at]\n"
                + "      ,[event].[userId]\n"
                + "      ,[event].[additionalId]\n"
                + "	  ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "	  ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at] as 'additional_created_at'\n"
                + "      ,[additional_calendar].[updated_at] as 'additional_updated_at'\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "	  ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	  ,[status_calendar].[name] as 'statusName'\n"
                + "	  ,[category_calendar].[name] as 'categoryName'\n"
                + "  FROM [event]\n"
                + "  INNER JOIN [user] ON [user].[id] = [event].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]\n"
                + "  INNER JOIN [additional_calendar] ON [additional_calendar].[id] = [event].[additionalId]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]"
                + " WHERE [user].[id] = ? ";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, userid);
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

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                AdditionalCalendar additional = new AdditionalCalendar();
                additional.setId(result.getInt("additionalId"));
                additional.setStartDate(result.getTimestamp("start_date"));
                additional.setEndDate(result.getTimestamp("end_date"));
                additional.setOverlap(result.getBoolean("overlap"));
                additional.setDisplay(result.getString("display"));
                additional.setIsAllDay(result.getBoolean("isAllDay"));
                additional.setIsHasEnd(result.getBoolean("isHasEnd"));
                additional.setCreated_at(result.getTimestamp("additional_created_at"));
                additional.setUpdated_at(result.getTimestamp("additional_updated_at"));
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

                eventCalendar.setUser(user);
                eventCalendar.setAdditional(additional);
                events.add(eventCalendar);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return events;
    }

    @Override
    public ArrayList<EventCalendar> list() {
        UserDBContext userDB = new UserDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT [event].[id]\n"
                + "      ,[event].[title]\n"
                + "      ,[event].[description]\n"
                + "      ,[event].[location]\n"
                + "      ,[event].[updated_at]\n"
                + "      ,[event].[created_at]\n"
                + "      ,[event].[userId]\n"
                + "      ,[event].[additionalId]\n"
                + "	  ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "	  ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at] as 'additional_created_at'\n"
                + "      ,[additional_calendar].[updated_at] as 'additional_updated_at'\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "	  ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	  ,[status_calendar].[name] as 'statusName'\n"
                + "	  ,[category_calendar].[name] as 'categoryName'\n"
                + "  FROM [event]\n"
                + "  INNER JOIN [user] ON [user].[id] = [event].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]\n"
                + "  INNER JOIN [additional_calendar] ON [additional_calendar].[id] = [event].[additionalId]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]";
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

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                AdditionalCalendar additional = new AdditionalCalendar();
                additional.setId(result.getInt("additionalId"));
                additional.setStartDate(result.getTimestamp("start_date"));
                additional.setEndDate(result.getTimestamp("end_date"));
                additional.setOverlap(result.getBoolean("overlap"));
                additional.setDisplay(result.getString("display"));
                additional.setIsAllDay(result.getBoolean("isAllDay"));
                additional.setIsHasEnd(result.getBoolean("isHasEnd"));
                additional.setCreated_at(result.getTimestamp("additional_created_at"));
                additional.setUpdated_at(result.getTimestamp("additional_updated_at"));
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

                eventCalendar.setUser(user);
                eventCalendar.setAdditional(additional);
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
       String sql = "SELECT [event].[id]\n"
                + "      ,[event].[title]\n"
                + "      ,[event].[description]\n"
                + "      ,[event].[location]\n"
                + "      ,[event].[updated_at]\n"
                + "      ,[event].[created_at]\n"
                + "      ,[event].[userId]\n"
                + "      ,[event].[additionalId]\n"
                + "	 ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "	  ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at] as 'additional_created_at'\n"
                + "      ,[additional_calendar].[updated_at] as 'additional_updated_at'\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "	  ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	  ,[status_calendar].[name] as 'statusName'\n"
                + "	  ,[category_calendar].[name] as 'categoryName'\n"
                + "  FROM [event]\n"
                + "  INNER JOIN [user] ON [user].[id] = [event].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]\n"
                + "  INNER JOIN [additional_calendar] ON [additional_calendar].[id] = [event].[additionalId]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]\n"
               + " WHERE [event].[id] = ? ";
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

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                AdditionalCalendar additional = new AdditionalCalendar();
                additional.setId(result.getInt("additionalId"));
                additional.setStartDate(result.getTimestamp("start_date"));
                additional.setEndDate(result.getTimestamp("end_date"));
                additional.setOverlap(result.getBoolean("overlap"));
                additional.setDisplay(result.getString("display"));
                additional.setIsAllDay(result.getBoolean("isAllDay"));
                additional.setIsHasEnd(result.getBoolean("isHasEnd"));
                additional.setCreated_at(result.getTimestamp("additional_created_at"));
                additional.setUpdated_at(result.getTimestamp("additional_updated_at"));
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

                eventCalendar.setUser(user);
                eventCalendar.setAdditional(additional);
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
            statement = connection.prepareStatement(sql,statement.RETURN_GENERATED_KEYS);
            statement.setString(1, model.getTitle());
            statement.setString(2, model.getDescription());
            statement.setString(3, model.getLocation());
            statement.setTimestamp(4, model.getCreated_at());
            statement.setTimestamp(5, model.getUpdated_at());
            statement.setInt(6, model.getUserId());
            statement.setInt(7, model.getAdditionalId());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                return get(id);
            }
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
    
    public void deleteByUser(int id) {
        try {
            String sql = "DELETE FROM [event]\n"
                    + "WHERE [userId] = ? ";
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
            statement.setString(1, "%" + value + "%");
            statement.setString(2, "%" + value + "%");
            statement.setString(3, "%" + value + "%");
            statement.setString(4, "%" + value + "%");
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

    public ArrayList<EventCalendar> findEvents(String value, int pageIndex, int pageSize) {
        UserDBContext userDB = new UserDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT [event].[id]\n"
                + "      ,[event].[title]\n"
                + "      ,[event].[description]\n"
                + "      ,[event].[location]\n"
                + "      ,[event].[updated_at]\n"
                + "      ,[event].[created_at]\n"
                + "      ,[event].[userId]\n"
                + "      ,[event].[additionalId]\n"
                + "	  ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "	  ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at] as 'additional_created_at'\n"
                + "      ,[additional_calendar].[updated_at] as 'additional_updated_at'\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "	 ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	 ,[status_calendar].[name] as 'statusName'\n"
                + "	 ,[category_calendar].[name] as 'categoryName'\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [event].[id] DESC) as row_index\n"
                + "  FROM [event]\n"
                + "  INNER JOIN [user] ON [user].[id] = [event].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]\n"
                + "  INNER JOIN [additional_calendar] ON [additional_calendar].[id] = [event].[additionalId]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]\n"
                + " WHERE LOWER([event].[title]) LIKE LOWER(?) or LOWER([event].[location]) LIKE LOWER(?) or \n"
                + " LOWER([user].[username]) LIKE LOWER(?) or LOWER([user].[email]) LIKE LOWER(?)) [event]\n"
                + "  WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?";

        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + value + "%");
            statement.setString(2, "%" + value + "%");
            statement.setString(3, "%" + value + "%");
            statement.setString(4, "%" + value + "%");

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

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                AdditionalCalendar additional = new AdditionalCalendar();
                additional.setId(result.getInt("additionalId"));
                additional.setStartDate(result.getTimestamp("start_date"));
                additional.setEndDate(result.getTimestamp("end_date"));
                additional.setOverlap(result.getBoolean("overlap"));
                additional.setDisplay(result.getString("display"));
                additional.setIsAllDay(result.getBoolean("isAllDay"));
                additional.setIsHasEnd(result.getBoolean("isHasEnd"));
                additional.setCreated_at(result.getTimestamp("additional_created_at"));
                additional.setUpdated_at(result.getTimestamp("additional_updated_at"));
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

                eventCalendar.setUser(user);
                eventCalendar.setAdditional(additional);
                events.add(eventCalendar);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return events;
    }

    public ArrayList<EventCalendar> getEvents(int pageIndex, int pageSize) {
        UserDBContext userDB = new UserDBContext();
        ArrayList<EventCalendar> events = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT [event].[id]\n"
                + "      ,[event].[title]\n"
                + "      ,[event].[description]\n"
                + "      ,[event].[location]\n"
                + "      ,[event].[updated_at]\n"
                + "      ,[event].[created_at]\n"
                + "      ,[event].[userId]\n"
                + "      ,[event].[additionalId]\n"
                + "	  ,[user].[username]\n"
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
                + "      ,[user].[created_at] as 'user_created_at'\n"
                + "      ,[user].[updated_at] as 'user_updated_at'\n"
                + "      ,[user].[avatar]\n"
                + "	  ,[permission].[id] as 'permissionId'\n"
                + "	  ,[permission].[name] as 'permissionName'\n"
                + "	  ,[additional_calendar].[start_date]\n"
                + "      ,[additional_calendar].[end_date]\n"
                + "      ,[additional_calendar].[overlap]\n"
                + "      ,[additional_calendar].[display]\n"
                + "      ,[additional_calendar].[created_at] as 'additional_created_at'\n"
                + "      ,[additional_calendar].[updated_at] as 'additional_updated_at'\n"
                + "      ,[additional_calendar].[isAllDay]\n"
                + "      ,[additional_calendar].[isHasEnd]\n"
                + "      ,[additional_calendar].[calendarId]\n"
                + "      ,[additional_calendar].[statusId]\n"
                + "      ,[additional_calendar].[categoryId]\n"
                + "	 ,[calendar].[name] as 'calendarName' \n"
                + "      ,[calendar].[color]\n"
                + "      ,[calendar].[created_at] as 'calendar_created_at'\n"
                + "      ,[calendar].[updated_at] as 'calendar_updated_at'\n"
                + "	 ,[status_calendar].[name] as 'statusName'\n"
                + "	 ,[category_calendar].[name] as 'categoryName'\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [event].[id] DESC) as row_index\n"
                + "  FROM [event]\n"
                + "  INNER JOIN [user] ON [user].[id] = [event].[userId]\n"
                + "  INNER JOIN [user_permission] ON [user_permission].[userId] = [user].[id]\n"
                + "  INNER JOIN [permission]  ON [permission].[id] = [user_permission].[permissionId]\n"
                + "  INNER JOIN [additional_calendar] ON [additional_calendar].[id] = [event].[additionalId]\n"
                + "  INNER JOIN [calendar] ON [calendar].[id] = [additional_calendar].[calendarId]\n"
                + "  INNER JOIN [status_calendar] ON [status_calendar].[id] = [additional_calendar].[statusId]\n"
                + "  INNER JOIN [category_calendar] ON [category_calendar].[id] = [additional_calendar].[categoryId]) [event]\n"
                + "  WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?";
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

                User user = new User();
                user.setId(result.getInt("userId"));
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
                user.setCreated_at(result.getTimestamp("user_created_at"));
                user.setUpdated_at(result.getTimestamp("user_updated_at"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                AdditionalCalendar additional = new AdditionalCalendar();
                additional.setId(result.getInt("additionalId"));
                additional.setStartDate(result.getTimestamp("start_date"));
                additional.setEndDate(result.getTimestamp("end_date"));
                additional.setOverlap(result.getBoolean("overlap"));
                additional.setDisplay(result.getString("display"));
                additional.setIsAllDay(result.getBoolean("isAllDay"));
                additional.setIsHasEnd(result.getBoolean("isHasEnd"));
                additional.setCreated_at(result.getTimestamp("additional_created_at"));
                additional.setUpdated_at(result.getTimestamp("additional_updated_at"));
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

                eventCalendar.setUser(user);
                eventCalendar.setAdditional(additional);
                events.add(eventCalendar);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdditionalCalendarDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return events;
    }

}
