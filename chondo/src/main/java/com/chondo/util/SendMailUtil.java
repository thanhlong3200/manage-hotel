package com.chondo.util;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.chondo.dto.BookingDTO;

public class SendMailUtil {
   
    public static boolean sendMail(String email,BookingDTO booking) throws MessagingException, UnsupportedEncodingException{
    	final String fromEmail = "nguyenthanhlong03022000@gmail.com";
        final String password = "016961193922Long";
        final String toEmail = email;
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        //set message headers
        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
        msg.addHeader("format", "flowed");
        msg.addHeader("Content-Transfer-Encoding", "8bit");
        msg.setFrom(new InternetAddress(fromEmail, "NoReply-JD"));
        msg.setReplyTo(InternetAddress.parse(fromEmail, false));
        msg.setSubject("XAC NHAN BOOKING "+booking.getCode());
        msg.setText(booking.toStringBooking());
        msg.setSentDate(new Date());
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        Transport.send(msg);
        return true;
    }
    
    public static String sendCode(String email) throws MessagingException, UnsupportedEncodingException{
    	final String fromEmail = "nguyenthanhlong03022000@gmail.com";
        final String password = "016961193922Long";
        final String toEmail = email;
        final String subject = "XAC NHAN DANG KY";
        Random random = new Random();
        int code = random.nextInt(100000);
        final String body = "Ma xac thuc cua ban là: " + code;
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        //set message headers
        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
        msg.addHeader("format", "flowed");
        msg.addHeader("Content-Transfer-Encoding", "8bit");
        msg.setFrom(new InternetAddress(fromEmail, "NoReply-JD"));
        msg.setReplyTo(InternetAddress.parse(fromEmail, false));
        msg.setSubject(subject, "UTF-8");
        msg.setText(body, "UTF-8");
        msg.setSentDate(new Date());
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        Transport.send(msg);
        return String.valueOf(code);
   }
    public static void main(String[] args) throws UnsupportedEncodingException, MessagingException {
		SendMailUtil.sendCode("nguyenthanhlong03022000@gmail.com");
	}
}