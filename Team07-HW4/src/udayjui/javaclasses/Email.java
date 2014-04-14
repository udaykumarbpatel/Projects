package udayjui.javaclasses;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class Email {
    public Email(String email)
    {
        try{
            String host = "smtp.gmail.com";
            String from = "nbadassignment@gmail.com";
            String pass = "qwer@123";
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.user", from);
            props.put("mail.smtp.password", pass);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            String to = email;
            Session session = Session.getDefaultInstance(props, null);
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[1];
            toAddress[0] = new InternetAddress(to);
            for( int i=0; i < toAddress.length; i++) { // changed from a while loop
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }
            message.setSubject("Mail from Flight Reservation System");
            message.setText("Ticket has been booked from your account. Please have a look at Booking history!");
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch(Exception e){
            e.getMessage();
        }
    }
}