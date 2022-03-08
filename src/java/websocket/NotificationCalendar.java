/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import model.auth.User;

/**
 *
 * @author giaki
 */
@ServerEndpoint("/ws/calendar/{username}")
public class NotificationCalendar {
    
    static Set<Session> users = Collections.synchronizedSet(new HashSet<Session>()); // trả về một tập hợp được đồng bộ 

    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username) {
        System.out.println("onOpen::" + username);
    }
    
    @OnClose
    public void onClose(Session session) {
        System.out.println("onClose::" +  session.getId());
    }
    
    @OnMessage
    public void onMessage(String message, Session session) {
        try {
            System.out.println("onMessage::From=" + session.getId() + " Message=" + message);
            session.getBasicRemote().sendText("Hello Client " + session.getId() + "!");
        } catch (IOException ex) {
            Logger.getLogger(NotificationCalendar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @OnError
    public void onError(Throwable t) {
        System.out.println("onError::" + t.getMessage());
    }
    
}
