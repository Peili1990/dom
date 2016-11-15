package dom;

import java.security.GeneralSecurityException;

import javax.mail.MessagingException;

import org.junit.Test;
import org.nv.dom.domain.user.Mail;
import org.nv.dom.util.MailUtil;

public class EmailTest {
	
	@Test
	public void test() throws MessagingException, GeneralSecurityException{
		Mail mail = new Mail("896097236@qq.com","yvrcppugzxfdbecg","smtp.qq.com","jack3173@qq.com","测试","测试内容");
		MailUtil.mailSend(mail);
	}

}
