package br.com.avicultura.chicken_tracker.Utils;

import com.google.api.client.repackaged.org.apache.commons.codec.binary.Base64;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.model.Message;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author Yan e Pedro
 */
public class Email {

    public static MimeMessage enviar(String to, String from, String subject, String body) throws AddressException, MessagingException, MessagingException {
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage email = new MimeMessage(session);
        email.setFrom(new InternetAddress(from));
        email.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
        email.setSubject(subject);
        email.setText(body);
        return email;
        
//        props.setProperty("mail.smtp.host", "smtp.gmail.com");
//        props.setProperty("mail.smtp.socketFactory.port", "465");
//        props.setProperty("mail.smtp.socketFactory.class",
//                "javax.net.ssl.SSLSocketFactory");
//        props.setProperty("mail.smtp.auth", "true");
//        props.setProperty("mail.smtp.port", "587");
//        props.setProperty("mail.smtp.starttls.enable", "true");
//        Session session = Session.getDefaultInstance(props,
//                new javax.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication("viniciuspedro350@gmail.com", "Pedro8251");
//            }
//        });

        /**
         * Ativa Debug para sessão
//         */
//        session.setDebug(true);
//
//        try {
//
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress("seuemail@gmail.com")); //Remetente
//
//            Address[] toUser = InternetAddress //Destinatário(s)
//                    .parse("viniciuspedro350@gmail.com, victoryan345@gmail.com");
//
//            message.setRecipients(Message.RecipientType.TO, toUser);
//            message.setSubject("Enviando email com JavaMail");//Assunto
//            message.setText("Enviei este email utilizando JavaMail com minha conta GMail!");
//            /**
//             * Método para enviar a mensagem criada
//             */
//            Transport.send(message);
//
//            return "Oky";
//
//        } catch (Exception e) {
//            return e.getMessage();
//        }

    }
    
    public static Message createMessage(MimeMessage emailContent) throws IOException, MessagingException{
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        emailContent.writeTo(buffer);
        byte[] bytes = buffer.toByteArray();
        String encodedEmail = Base64.encodeBase64URLSafeString(bytes);
        Message message = new Message();
        message.setRaw(encodedEmail);
        return message;
    }
    
    public static Message sendMessage(Gmail service, String userId, MimeMessage emailContent) throws IOException, MessagingException{
        Message message = createMessage(emailContent);
        message = service.users().messages().send(userId, message).execute();
        return message;
    }
}
