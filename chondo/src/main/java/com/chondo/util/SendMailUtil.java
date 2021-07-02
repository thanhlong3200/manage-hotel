package com.chondo.util;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.chondo.dto.BookingDTO;

public class SendMailUtil {
   
    public static boolean sendMail(String email,BookingDTO booking){
         boolean sended = false;

         String toMail = email;
         String fromMail = "nguyenthanhlong03022000@gmail.com";
         String password = "oqtfcsnqtxsgidlr";

         try {
             Properties properties = new Properties();
             properties.setProperty("mail.smtp.host", "smtp.gmail.com");
             properties.setProperty("mail.smtp.port", "587");
             properties.setProperty("mail.smtp.auth", "true");
             properties.setProperty("mail.smtp.starttls.enable", "true");

             /*properties.put("mail.smtp.socketFactory.port", "587");
             properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");*/

             //get Session
             Session ss = Session.getInstance(properties, new Authenticator() {
                 @Override
                 protected PasswordAuthentication getPasswordAuthentication() {
                     return new PasswordAuthentication(fromMail, password);
                 }
             });

             //content e-mail
             Message msg = new MimeMessage(ss);
             msg.setFrom(new InternetAddress(fromMail));
             msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
             msg.setSubject("XAC NHAN BOOKING "+booking.getCode());
             msg.setText(booking.toStringBooking());

             // sends the e-mail
             Transport.send(msg);

             sended = true;
         }catch (Exception e){
             e.printStackTrace();
             sended = false;
         }
         return sended;
    }
}