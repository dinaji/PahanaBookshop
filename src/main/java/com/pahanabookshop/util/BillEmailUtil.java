package com.pahanabookshop.util;

import com.pahanabookshop.model.Customer;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class BillEmailUtil {

    public static void sendBillEmail(Customer customer, int unitPrice, int total) throws MessagingException {
        final String from = "pahanabookshop@gmail.com";
        final String appPassword = "kyoxseifwcpuetjz";
        final String to = customer.getEmail();

        String subject = "Bookshop Bill - Account No " + customer.getAccountNo();
        String content = "Dear " + customer.getName() + ",\n\n" +
                "Here is your bill:\n\n" +
                "Book Category: " + customer.getBookCategory() + "\n" +
                "Book Name: " + customer.getBookName() + "\n" +
                "Units: " + customer.getUnits() + "\n" +
                "Unit Price: " + unitPrice + " LKR\n" +
                "Total: " + total + " LKR\n\n" +
                "Thank you for shopping with us!\n\n- Bookshop";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, appPassword);
            }
        });

        session.setDebug(true); // Show SMTP logs in Tomcat

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
        msg.setSubject(subject);
        msg.setText(content);

        Transport.send(msg);
    }
}
