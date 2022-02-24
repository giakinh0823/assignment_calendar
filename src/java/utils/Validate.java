/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author giaki
 */
public class Validate {

    public String getField(HttpServletRequest request, String fieldName, boolean required) throws Exception {
        String value = null;
        try {
            value = new String(request.getParameter(fieldName).getBytes("iso-8859-1"), "utf-8");
        } catch (Exception e) {
            if (value == null || value.trim().isEmpty()) {
                if (required) {
                    throw new Exception("Field "+fieldName+" is required");
                } else {
                    value = null; // Make empty string null so that you don't need to hassle with equals("") afterwards.
                }
            }
        }
        return value;
    }
    
    public Part getFieldAjaxFile(HttpServletRequest request, String fieldName, boolean required) throws Exception {
        Part value = null;
        value = request.getPart(fieldName);
        if (value == null) {
            if (required) {
                throw new Exception("Field "+fieldName+" is required");
            } else {
                value = null; // Make empty string null so that you don't need to hassle with equals("") afterwards.
            }
        }
        return value;
    }

    public String getFieldAjax(HttpServletRequest request, String fieldName, boolean required) throws Exception {
        String value = null;
        value = request.getParameter(fieldName);
        if (value == null || value.trim().isEmpty()) {
            if (required) {
                throw new Exception("Field is required");
            } else {
                value = null; // Make empty string null so that you don't need to hassle with equals("") afterwards.
            }
        }
        return value;
    }

    public int fieldInt(String value, String message) throws Exception {
        int number = 0;
        try {
            number = Integer.parseInt(value);
        } catch (NumberFormatException e) {
            throw new Exception(message);
        }
        return number;
    }

    public double fieldDouble(String value, String message) throws Exception {
        double number = 0;
        try {
            number = Double.parseDouble(value);
        } catch (NumberFormatException e) {
            throw new Exception(message);
        }
        return number;
    }

    public String fieldString(String value, String regex, String message) throws Exception {
        if (!value.matches(regex)) {
            throw new Exception(message);
        }
        return value;
    }

    public boolean fieldBoolean(String value, String message) throws Exception {
        boolean bool = false;
        try {
            bool = Boolean.parseBoolean(value);
        } catch (Exception e) {
            throw new Exception(message);
        }
        return bool;
    }

    public Date fieldDate(String value, String message) throws Exception {
        Date date = null;
        try {
            date = Date.valueOf(value);
        } catch (Exception e) {
            throw new Exception(message);
        }
        return date;
    }

    public Timestamp fieldTimestamp(String value, String message) throws Exception {
        Timestamp timestamp = null;
        try {
            timestamp = new Timestamp(new java.util.Date(Long.parseLong(value)).getTime());
        } catch (Exception e) {
            throw new Exception(message);
        }
        return timestamp;
    }
}
