/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.managers;

import java.util.HashMap;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.entities.ContactEmail;
import model.entities.Item;
import model.entities.OrderEmail;

/**
 *
 * @author abrossea
 */
public class EmailManager {

    private static Properties props = new Properties();
    private static Session session;

    private static String emailTo = "waugusti@isi-mtl.com";
    private static String emailSubject;

    private static String user = "etudiant.isi.java2@gmail.com";
    private static String pwd = "z2mLt32AE";
    private static String from = "etudiant.isi.java2@gmail.com";

    static {
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pwd);
            }
        });
    }

    public static void sendContactEmail(ContactEmail contactEmail) {
        emailSubject = "Message from Customer";

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            message.setSubject(emailSubject);
            message.setContent(contactEmail.toString(), "text/html; charset=utf-8");
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendOrderEmail(OrderEmail orderEmail) {
        emailTo = orderEmail.getUser().getEmail();
        
        emailSubject = "Placeholder Computer: Thank you for your order!";

        String emailContent = "<div style=\"border:solid black thin; padding: 0 10px 0 10px; text-align:center;\">"
                + "<div>"
                + "<h1>Thank you for your order!</h1>"
                + "<h3>Your order number is: " + orderEmail.getOrder().getId() + "</h3>"
                + "<h3>Time of order: " + orderEmail.getOrder().getDateTime() + "</h3>"
                + "<div style=\"border:solid black thin; margin: 10px; text-align:center;\">"
                + "<h2>Your information</h2>"
                + "<p>Full name: " + orderEmail.getUser().getFirstName() + " " + orderEmail.getUser().getLastName() + "</p>"
                + "<p>Email address: " + orderEmail.getUser().getEmail() + "</p>"
                + "<p>Telephone number: " + orderEmail.getUser().getTelephone() + "</p>"
                + "<p>Address: " + orderEmail.getUser().getAddress() + "</p>"
                + "</div>"
                + "</div>"
                + "<div style=\"border:solid black thin; margin: 10px; text-align:center;\">"
                + "<h4>Your order wil be shipped in the next 24 to 48 hours.</h4>"
                + "</div>"
                + "</div>";
        
        
        

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            message.setSubject(emailSubject);
            message.setContent(emailContent, "text/html; charset=utf-8");
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
