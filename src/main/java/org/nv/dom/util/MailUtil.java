package org.nv.dom.util;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.nv.dom.domain.user.Mail;
import org.nv.dom.web.service.impl.EssayServiceImpl;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * <p></p>
 * 2014年10月30日 下午4:21:09
 * @author: z```s
 */
public class MailUtil {
	
	private static Logger logger = Logger.getLogger(MailUtil.class);

	/**
	 * <p></p>
	 * @param mail
	 * @return
	 * 2014年12月24日 下午2:11:08
	 * @author: z```s
	 * @throws GeneralSecurityException 
	 * @throws UnsupportedEncodingException 
	 */
	public static boolean mailSend(Mail mail) throws GeneralSecurityException, UnsupportedEncodingException {
		boolean result = false;
		Properties properties = new Properties();
		properties.put("mail.smtp.host", mail.getHost());
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.port", "465");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		properties.put("mail.smtp.starttls.enable", true);
		final String fromUser = mail.getFromUser();
		final String password = mail.getPassword();
		Session mailSession = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromUser, password);
			}
		});
		Message message = new MimeMessage(mailSession);
		try {
			message.setFrom(new InternetAddress(mail.getFromUser()));
			message.addRecipient(RecipientType.TO, new InternetAddress(mail.getToUser()));
			message.setSubject(MimeUtility.encodeText(mail.getSubject(), "UTF-8", "B"));
			message.setContent(mail.getContent(), "text/html;charset=utf-8");
			message.saveChanges();
			Transport transport = mailSession.getTransport();
			transport.connect(mail.getHost(), fromUser, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			result = true;
		} catch (MessagingException e) {
			result = false;
			logger.error(e.getMessage(),e);
		}
		return result;
	}
	
	/**
	 * <p>群发邮件</p>
	 * @param mail 邮件实体
	 * @param regex 收件人分割字符串
	 * @return
	 * 2014年12月24日 下午2:19:29
	 * @author: z```s
	 */
	public static boolean massMailSend(Mail mail) {
		boolean rel = false;
		Properties properties = new Properties();
		properties.put("mail.smtp.host", mail.getHost());
		properties.put("mail.smtp.auth", "true");
		/** ssl发送邮件 */
		String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		properties.put("mail.transport.protocol", mail.getProtocol());
		properties.put("mail.smtp.socketFactory.class", SSL_FACTORY);
		properties.put("mail.smtp.port", "465");
		final String fromUser = mail.getFromUser();
		final String password = mail.getPassword();
		Session mailSession = Session.getDefaultInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromUser, password);
			}
		});
		Message message = new MimeMessage(mailSession);
		try {
			message.setFrom(new InternetAddress(mail.getFromUser()));
			String[] toUserGroup = mail.getToUser().split(mail.getRegex());
			int len = toUserGroup.length;
			Address[] toAddresses = new Address[toUserGroup.length];
			for (int i = 0; i < len; i++) {
				toAddresses[i] = new InternetAddress(toUserGroup[i]);
			}
			message.addRecipients(RecipientType.TO, toAddresses);
			message.setSubject(mail.getSubject());
			message.setContent(mail.getContent(), "text/html;charset=utf-8");
			message.saveChanges();
			Transport transport = mailSession.getTransport(mail.getProtocol());
			transport.connect(mail.getHost(), fromUser, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			rel = true;
		} catch (MessagingException e) {
			rel = false;
		}
		return rel;
	}
	
	/**
	 * <p></p>
	 * @param params
	 * @return
	 * 2014年11月5日 上午11:46:15
	 * @author: z```s
	 */
	public static String getMailContent(String filePath, String...params) {
		String content = null;
		File file = new File(filePath);
		try {
			content = FileUtils.readFileToString(file, "UTF-8");
			String tmp = null, param = null;
			for (int i = 0, len = params.length; i < len; i++) {
				param = params[i];
				tmp = "{" + i + "}";
				content = content.replace(tmp, param);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return content;
	}
	
	public static void main(String[] args) {
		/*if (mailSend("http://www.baidu.com", "1002086474@qq.com")) {
			System.out.println("发送成功");
		} else {
			System.out.println("发送失败");
		}*/
		//String content = getMailContent("WebContent\\jsp\\account\\email-content.jsp", "307195869@qq.com", "http://www.baidu.com", "2014-11-5");
		//System.out.println(mailSend("307195869@qq.com", content));
	}
	
}
