/**
 * com.rightoo.domail
 * Mail.java
 * 2014年11月17日 上午10:17:15
 * @author: z```s
 */
package org.nv.dom.domain.user;

/**
 * <p></p>
 * 2014年11月17日 上午10:17:15
 * @author: z```s
 */
public class Mail {

	private String fromUser;
	
	private String password;
	
	private String host;
	
	private String toUser;
	
	private String subject;
	
	private String content;
	
	private String protocol;
	
	private String regex;

	/**
	 * Constructor Method
	 * 2014年11月17日 上午11:56:13
	 * @author: z```s
	 */
	public Mail() {
		super();
	}

	/**
	 * Constructor Method
	 * @param fromUser
	 * @param password
	 * @param host
	 * @param toUser
	 * @param subject
	 * @param content
	 * @param protocol
	 * 2014年11月17日 上午11:55:59
	 * @author: z```s
	 */
	public Mail(String fromUser, String password, String host, String toUser,
			String subject, String content) {
		super();
		this.fromUser = fromUser;
		this.password = password;
		this.host = host;
		this.toUser = toUser;
		this.subject = subject;
		this.content = content;
	}

	/**
	 * @return the fromUser
	 */
	public final String getFromUser() {
		return fromUser;
	}

	/**
	 * @param fromUser the fromUser to set
	 */
	public final void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	/**
	 * @return the password
	 */
	public final String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public final void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the host
	 */
	public final String getHost() {
		return host;
	}

	/**
	 * @param host the host to set
	 */
	public final void setHost(String host) {
		this.host = host;
	}

	/**
	 * @return the toUser
	 */
	public final String getToUser() {
		return toUser;
	}

	/**
	 * @param toUser the toUser to set
	 */
	public final void setToUser(String toUser) {
		this.toUser = toUser;
	}

	/**
	 * @return the subject
	 */
	public final String getSubject() {
		return subject;
	}

	/**
	 * @param subject the subject to set
	 */
	public final void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the content
	 */
	public final String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public final void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the protocol
	 */
	public final String getProtocol() {
		return protocol;
	}

	/**
	 * @param protocol the protocol to set
	 */
	public final void setProtocol(String protocol) {
		this.protocol = protocol;
	}

	/**
	 * @return the regex
	 */
	public final String getRegex() {
		return regex;
	}

	/**
	 * @param regex the regex to set
	 */
	public final void setRegex(String regex) {
		this.regex = regex;
	}
	
}
