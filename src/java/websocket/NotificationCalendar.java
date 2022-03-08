/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import model.calendar.EventCalendar;

/**
 *
 * @author giaki
 */
@ServerEndpoint("/ws/calendar/{username}")
public class NotificationCalendar {

    static Map<String, Session> users = Collections.synchronizedMap(new HashMap<String, Session>()); // trả về một tập hợp được đồng bộ 

    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username) {
        System.out.println("onOpen::" + username);
        users.put(username, session);
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("onClose::" + session.getId());
    }

    @OnMessage
    public void onMessage(String message) {
        EventCalendar event = new Gson().fromJson(message, EventCalendar.class);
        if (users.get(event.getUser().getUsername()) != null) {
            try {
                String json = new Gson().toJson(event);
                users.get(event.getUser().getUsername()).getBasicRemote().sendText(json);
            } catch (IOException ex) {
                Logger.getLogger(NotificationCalendar.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @OnError
    public void onError(Throwable t) {
        System.out.println("onError::" + t.getMessage());
    }
}
