/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package background;

import com.google.gson.Gson;
import dal.calendar.AdditionalCalendarDBContext;
import dal.calendar.EventCalendarDBContext;
import dal.calendar.StatusCalendarDBContext;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.mail.MessagingException;
import model.calendar.EventCalendar;
import model.calendar.StatusCalendar;
import utils.EmailUtility;
import websocket.NotificationCalendar;

/**
 *
 * @author giaki
 */
@Singleton
public class BackgroundJobManager {

    private String host = "smtp.gmail.com";
    private String port = "587";
    private String email = "giakinhfullstack@gmail.com";
    private String pass = "giakinh0823";

    @Schedule(hour = "*", minute = "*", second = "*/20", persistent = false)
    public void someFiveSecondelyJob() {
        Timestamp stamp = new Timestamp(System.currentTimeMillis());
        Date now = new Date(stamp.getTime());
        EventCalendarDBContext eventDB = new EventCalendarDBContext();
        ArrayList<EventCalendar> events = eventDB.list();
        for (EventCalendar event : events) {
            try {
                if (event.getUser() != null && event.getUser().getUsername() != null) {
                    String json = new Gson().toJson(event);
                    NotificationCalendar notiCalendar = new NotificationCalendar();
                    notiCalendar.onMessage(json);
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            Date start_time = new Date(event.getAdditional().getStartDate().getTime());
            Date end_time = new Date(event.getAdditional().getEndDate().getTime());
            if (event.getAdditional().getStatus().getName().equalsIgnoreCase("pending")
                    && start_time.toString().equalsIgnoreCase(now.toString())) {

                // update additional
                System.out.println(event.getTitle() + " " + event.getDescription());
                AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
                StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
                StatusCalendar status = statusDB.findOne("name", "in progress");
                event.getAdditional().setStatusId(status.getId());
                event.getAdditional().setStatus(status);
                additionalDB.update(event.getAdditional());

                //send email 
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                if (event.getUser().getEmail() != null) {
                    try {
                        EmailUtility.sendEmail(host, port, email, pass, event.getUser().getEmail(), event.getAdditional().getCategory().getName() + " - " + event.getTitle(),
                                "<p>Event start time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(start_time) + "</span><p/>\n"
                                + "<p>Event end time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(end_time) + "</span><p/>\n"
                                + "<p>Event location: <span style=\"font-weight: bold\">" + event.getLocation() + "</span><p/>\n"
                                + "<p>Event description: " + event.getDescription() + "<p/>\n");
                    } catch (MessagingException ex) {
                        Logger.getLogger(BackgroundJobManager.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }

                // send notify websocket
            }

            if (event.getAdditional().getStatus().getName().equalsIgnoreCase("in progress")
                    && end_time.toString().equalsIgnoreCase(now.toString())) {

                // update additional
                System.out.println(event.getTitle() + " " + event.getDescription());
                AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
                StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
                StatusCalendar status = statusDB.findOne("name", "done");
                event.getAdditional().setStatusId(status.getId());
                event.getAdditional().setStatus(status);
                additionalDB.update(event.getAdditional());

                //send email 
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                if (event.getUser().getEmail() != null) {
                    try {
                        EmailUtility.sendEmail(host, port, email, pass, event.getUser().getEmail(), event.getAdditional().getCategory().getName() + " finish - " + event.getTitle(),
                                "<p>Event start time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(start_time) + "</span><p/>\n"
                                + "<p>Event end time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(end_time) + "</span><p/>\n"
                                + "<p>Event location: <span style=\"font-weight: bold\">" + event.getLocation() + "</span><p/>\n"
                                + "<p>Event description: " + event.getDescription() + "<p/>\n");
                    } catch (MessagingException ex) {
                        Logger.getLogger(BackgroundJobManager.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        }
    }

//     @Schedule(hour="0", minute="0", second="0", persistent=false)
//    public void someDailyJob() {
//        // Do your job here which should run every start of day.
//    }
//
//    @Schedule(hour="*/1", minute="0", second="0", persistent=false)
//    public void someHourlyJob() {
//        // Do your job here which should run every hour of day.
//    }
//
//    @Schedule(hour="*", minute="*/15", second="0", persistent=false)
//    public void someQuarterlyJob() {
//        // Do your job here which should run every 15 minute of hour.
//    }
}
