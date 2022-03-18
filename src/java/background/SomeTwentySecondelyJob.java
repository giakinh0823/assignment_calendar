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
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.calendar.EventCalendar;
import model.calendar.StatusCalendar;
import utils.EmailUtility;
import websocket.NotificationCalendar;

/**
 *
 * @author giaki
 */
// 20 second
public class SomeTwentySecondelyJob implements Runnable {

    @Override
    public void run() {
        System.out.println("Run task");
        String host = "smtp.gmail.com";
        String port = "587";
        String email = "calendargiakinh@gmail.com";
        String pass = "giakinh0823";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Timestamp stamp = new Timestamp(System.currentTimeMillis());
        Date now = new Date(stamp.getTime());
        EventCalendarDBContext eventDB = new EventCalendarDBContext();
        ArrayList<EventCalendar> events = eventDB.list();
        for (EventCalendar event : events) {
            Date start_time = new Date(event.getAdditional().getStartDate().getTime());
            Date end_time = new Date(event.getAdditional().getEndDate().getTime());

            if ((event.getAdditional().isIsAllDay() || TimeUnit.MILLISECONDS.toDays(end_time.getTime() - start_time.getTime()) > 1)
                    && start_time.getTime() < now.getTime()
                    && end_time.getTime() > now.getTime()
                    && (now.getHours() == 6 || now.getHours() == 7)
                    && !event.getAdditional().getStatus().getName().equalsIgnoreCase("in progress")) {

                System.out.println(event.getTitle() + " " + event.getDescription());
                AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
                StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
                StatusCalendar status = statusDB.findOne("name", "in progress");
                event.getAdditional().setStatusId(status.getId());
                event.getAdditional().setStatus(status);
                additionalDB.update(event.getAdditional());

                //send email 
                Runnable task = new Runnable() {
                    public void run() {
                        if (event.getUser().getEmail() != null) {
                            System.out.println("Send Email!!");
                            try {
                                EmailUtility.sendEmail(host, port, email, pass, event.getUser().getEmail(), event.getAdditional().getCategory().getName() + " - " + event.getTitle(),
                                        "<p>" + event.getAdditional().getCategory().getName() + " start time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(start_time) + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " end time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(end_time) + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " location: <span style=\"font-weight: bold\">" + event.getLocation() + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " description: " + event.getDescription() + "<p/>\n");
                            } catch (MessagingException ex) {
                                Logger.getLogger(SomeTwentySecondelyJob.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                };

                Thread sendEmail = new Thread(task);
                sendEmail.start();

                // send notify websocket
                try {
                    if (event.getUser() != null && event.getUser().getUsername() != null) {
                        String json = new Gson().toJson(event);
                        NotificationCalendar notiCalendar = new NotificationCalendar();
                        notiCalendar.onMessage(json);
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }

            if ((event.getAdditional().isIsAllDay() || TimeUnit.MILLISECONDS.toDays(end_time.getTime() - start_time.getTime()) > 1)
                    && start_time.getTime() < now.getTime()
                    && end_time.getTime() > now.getTime()
                    && now.getHours() == 23
                    && (event.getAdditional().getStatus().getName().equalsIgnoreCase("in progress") || event.getAdditional().getStatus().getName().equalsIgnoreCase("pending"))) {

                System.out.println(event.getTitle() + " " + event.getDescription());
                AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
                StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
                StatusCalendar status = statusDB.findOne("name", "done");
                event.getAdditional().setStatusId(status.getId());
                event.getAdditional().setStatus(status);
                additionalDB.update(event.getAdditional());

                //send email 
                Runnable task = new Runnable() {
                    public void run() {
                        if (event.getUser().getEmail() != null) {
                            System.out.println("Send Email!!");
                            try {
                                EmailUtility.sendEmail(host, port, email, pass, event.getUser().getEmail(), event.getAdditional().getCategory().getName() + " - " + event.getTitle(),
                                        "<p>" + event.getAdditional().getCategory().getName() + " start time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(start_time) + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " end time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(end_time) + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " location: <span style=\"font-weight: bold\">" + event.getLocation() + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " description: " + event.getDescription() + "<p/>\n");
                            } catch (MessagingException ex) {
                                Logger.getLogger(SomeTwentySecondelyJob.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                };

                Thread sendEmail = new Thread(task);
                sendEmail.start();

                // send notify websocket
                try {
                    if (event.getUser() != null && event.getUser().getUsername() != null) {
                        String json = new Gson().toJson(event);
                        NotificationCalendar notiCalendar = new NotificationCalendar();
                        notiCalendar.onMessage(json);
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }

            if (!event.getAdditional().isIsAllDay() && event.getAdditional().getStatus().getName().equalsIgnoreCase("pending")
                    && simpleDateFormat.format(start_time).equalsIgnoreCase(simpleDateFormat.format(now))) {

                // update additional
                System.out.println(event.getTitle() + " " + event.getDescription());
                AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
                StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
                StatusCalendar status = statusDB.findOne("name", "in progress");
                event.getAdditional().setStatusId(status.getId());
                event.getAdditional().setStatus(status);
                additionalDB.update(event.getAdditional());

                //send email 
                Runnable task = new Runnable() {
                    public void run() {
                        if (event.getUser().getEmail() != null) {
                            System.out.println("Send Email!!");
                            try {
                                EmailUtility.sendEmail(host, port, email, pass, event.getUser().getEmail(), event.getAdditional().getCategory().getName() + " - " + event.getTitle(),
                                        "<p>" + event.getAdditional().getCategory().getName() + " start time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(start_time) + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " end time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(end_time) + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " location: <span style=\"font-weight: bold\">" + event.getLocation() + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " description: " + event.getDescription() + "<p/>\n");
                            } catch (MessagingException ex) {
                                Logger.getLogger(SomeTwentySecondelyJob.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                };

                Thread sendEmail = new Thread(task);
                sendEmail.start();

                // send notify websocket
                try {
                    if (event.getUser() != null && event.getUser().getUsername() != null) {
                        String json = new Gson().toJson(event);
                        NotificationCalendar notiCalendar = new NotificationCalendar();
                        notiCalendar.onMessage(json);
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }

            if ((event.getAdditional().getStatus().getName().equalsIgnoreCase("in progress") || event.getAdditional().getStatus().getName().equalsIgnoreCase("pending"))
                    && simpleDateFormat.format(end_time).equalsIgnoreCase(simpleDateFormat.format(now))) {

                // update additional
                System.out.println(event.getTitle() + " " + event.getDescription());
                AdditionalCalendarDBContext additionalDB = new AdditionalCalendarDBContext();
                StatusCalendarDBContext statusDB = new StatusCalendarDBContext();
                StatusCalendar status = statusDB.findOne("name", "done");
                event.getAdditional().setStatusId(status.getId());
                event.getAdditional().setStatus(status);
                additionalDB.update(event.getAdditional());

                //send email 
                Runnable task = new Runnable() {
                    public void run() {
                        if (event.getUser().getEmail() != null) {
                            try {
                                EmailUtility.sendEmail(host, port, email, pass, event.getUser().getEmail(), event.getAdditional().getCategory().getName() + " finish - " + event.getTitle(),
                                        "<p>" + event.getAdditional().getCategory().getName() + " start time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(start_time) + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " end time: <span style=\"font-weight: bold\">" + simpleDateFormat.format(end_time) + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " location: <span style=\"font-weight: bold\">" + event.getLocation() + "</span><p/>\n"
                                        + "<p>" + event.getAdditional().getCategory().getName() + " description: " + event.getDescription() + "<p/>\n");
                            } catch (MessagingException ex) {
                                Logger.getLogger(SomeTwentySecondelyJob.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                };

                Thread sendEmail = new Thread(task);
                sendEmail.start();

                try {
                    if (event.getUser() != null && event.getUser().getUsername() != null) {
                        String json = new Gson().toJson(event);
                        NotificationCalendar notiCalendar = new NotificationCalendar();
                        notiCalendar.onMessage(json);
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }
    }

}
