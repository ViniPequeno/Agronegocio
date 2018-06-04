package br.com.avicultura.chicken_tracker.Utils;

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

    private String emailDestinario;
    private String assunto;
    private String msg;

    public String getEmailDestinario() {
        return emailDestinario;
    }

    public void setEmailDestinario(String emailDestinario) {
        this.emailDestinario = emailDestinario;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean enviarGmail() {
        boolean retorno = false;
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");

        Session s = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ChickentrackerChickentracker@gmail.com", "Pedro8251");
            }
        });

        try {
            MimeMessage message = new MimeMessage(s);
            message.setFrom(new InternetAddress("ChickentrackerChickentracker@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.emailDestinario));
            message.setHeader("content-type", "text/html");
            message.setSubject((this.assunto));
            message.setContent(this.msg, "text/html; charset=utf-8");

            Transport.send(message);

            retorno = true;
        } catch (AddressException ex) {
            System.out.println("ERRO: "+ex.getMessage());
            retorno = false;
        } catch (MessagingException ex) {
            System.out.println("ERRO: "+ex.getMessage());
            retorno = false;
         }
        return retorno;
    }

}
