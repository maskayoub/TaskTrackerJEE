package metier;
import java.util.*; 
import javax.mail.*; 
import javax.mail.PasswordAuthentication;
import javax.mail.internet.*;

public class envoyerEmail {
	
	public void sendEmail(String client, String contenu, String sujet)
	{
		final String username = "mask.ayoub.mask@gmail.com";
		final String password = "TaskTracker123";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
			}
		  });
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("mask.ayoub.mask@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
			InternetAddress.parse(client));
			message.setSubject(sujet);
			message.setText(contenu);
			Transport.send(message);
			System.out.println("Done");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

	
//	Numéro de suivi du dossier #
//
//	Le traitement de votre dossier va commencer bientôt. Vous pouvez suivre la progression de votre dossier sur notre site Web en utilisant ce numéro: #
//
//	Merci pour votre patience!
//
//	Team TaskTracker
}
