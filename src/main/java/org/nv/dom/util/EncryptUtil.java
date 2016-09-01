package org.nv.dom.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import org.apache.commons.codec.binary.Base64;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * <p></p>
 * 2014年10月29日 上午11:27:59
 * @author: z```s
 */
public class EncryptUtil {

	public static final String KEY = "rightoocplan";
	
	private static final String DES = "DES";
	
	public static final String ENCODING = "UTF-8";
	
	/**
	 * <p>字符串转化成MD5码</p>
	 * @param inStr 需要转化的字符串
	 * @return MD5字符串
	 * 2014年10月29日 上午11:28:10
	 * @author: z```s
	 */
	public static String string2MD5(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];
		for (int i = 0; i < charArray.length; i++) {
			byteArray[i] = (byte) charArray[i];
		}
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}
	
	/**
	 * <p></p>
	 * @param value
	 * @return
	 * @throws NoSuchAlgorithmException
	 * 2015年6月18日 上午11:44:03
	 * @author: z```s
	 * @version 1.0
	 */
	public static String encryptMD5(String value) throws NoSuchAlgorithmException {
		char[] hexDigits={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
		byte[] valueBytes = value.getBytes();
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		md5.update(valueBytes);
		byte[] md = md5.digest();
		int j = md.length;
		char[] str = new char[j * 2];
		int k = 0;
		for (int i = 0; i < j; i++) {
			byte b = md[i];
			str[k++] = hexDigits[b >>> 4 & 0xf];
			str[k++] = hexDigits[b & 0xf];
		}
		return new String(str);
	}
	
	/**
	 * <p>根据键值进行加密</p>
	 * @param data
	 * @param key 加密键byte数组
	 * @return
	 * 2014年10月30日 下午2:18:00
	 * @author: z```s
	 */
	public static String encryptDES(String data, String key) {
		byte[] b = encryptDES(data.getBytes(), key.getBytes());
		return new BASE64Encoder().encode(b);
	}
	
	/**
	 * <p>根据键值进行加密</p>
	 * @param data 
	 * @param key 加密键byte数组
	 * @return
	 * 2014年10月30日 下午2:22:40
	 * @author: z```s
	 */
	private static byte[] encryptDES(byte[] data, byte[] key) {
		try {
			//生成一个可信任的随机数源
			SecureRandom sr = new SecureRandom();
			//从原始密钥数据创建DESKeySpec对象
			DESKeySpec dks = new DESKeySpec(key);
			//创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);
			SecretKey secretKey = keyFactory.generateSecret(dks);
			//Cipher对象实际完成加密操作
			Cipher cipher = Cipher.getInstance(DES);
			//用密钥初始化Cipher对象
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, sr);
			return cipher.doFinal(data);
		} catch (InvalidKeyException | NoSuchAlgorithmException | 
				InvalidKeySpecException | NoSuchPaddingException | 
				IllegalBlockSizeException | BadPaddingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * <p>根据键值进行解密</p>
	 * @param data
	 * @param key 加密键byte数组
	 * @return
	 * 2014年10月30日 下午2:25:12
	 * @author: z```s
	 */
	public static String decryptDES(String data, String key) {
		if (StringUtil.isNullOrEmpty(data)) {
			return "";
		}
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			byte[] buf = decoder.decodeBuffer(data);
			byte[] bt = decryptDES(buf, key.getBytes());
			return new String(bt);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * <p>根据键值进行解密</p>
	 * @param data
	 * @param key 加密键byte数组
	 * @return
	 * 2014年10月30日 下午2:28:42
	 * @author: z```s
	 */
	private static byte[] decryptDES(byte[] data, byte[] key) {
		try {
			//生成一个可信任的随机数源
			SecureRandom sr = new SecureRandom();
			//从原始密钥数据创建DESKeySpec对象
			DESKeySpec dks = new DESKeySpec(key);
			//创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);
			SecretKey secretKey = keyFactory.generateSecret(dks);
			//Cipher对象实际完成解密操作
			Cipher cipher = Cipher.getInstance(DES);
			//用密钥初始化Cipher对象
			cipher.init(Cipher.DECRYPT_MODE, secretKey, sr);
			return cipher.doFinal(data);
		} catch (InvalidKeyException | NoSuchAlgorithmException 
				| InvalidKeySpecException | NoSuchPaddingException 
				| IllegalBlockSizeException | BadPaddingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * <p>Base64加密</p>
	 * @param data
	 * @return
	 * 2014年11月6日 下午5:50:50
	 * @author: z```s
	 */
	public static String encryptBase64(String data) {
		try {
			byte[] b = Base64.encodeBase64URLSafe(data.getBytes(ENCODING));
			return new String(b);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * <p>Base64解密</p>
	 * @param data
	 * @return
	 * 2014年11月6日 下午5:52:09
	 * @author: z```s
	 */
	public static String decryptBase64(String data) {
		try {
			byte[] b = Base64.decodeBase64(data.getBytes(ENCODING));
			return new String(b);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) throws NoSuchAlgorithmException {
//		System.out.println(encryptDES("smtp.qq.com", KEY));
//		System.out.println(encryptDES("noreply@rightoo.com", KEY));
//		System.out.println(encryptDES("rt20130401", KEY));
//		System.out.println(encryptBase64("smtp.qq.com"));
//		System.out.println(encryptBase64("noreply@rightoo.com"));
//		System.out.println(encryptBase64("rt20130401"));
//		System.out.println(decryptBase64("c210cC5xcS5jb20"));
//		System.out.println(decryptBase64("bm9yZXBseUByaWdodG9vLmNvbQ"));
//		System.out.println(decryptBase64("cnQyMDEzMDQwMQ"));
//		String brandPic = "default_brand" + System.currentTimeMillis() + new Random().nextInt(100);
//		System.out.println(brandPic);
//		System.out.println(string2MD5("act_name=端午我们玩真的&client_ip=112.16.68.131&logo_imgurl=http://www.taozhenli.com/img/logo.png&max_value=100&mch_billno=10011720201506166158432563&mch_id=10011720&min_value=100&nick_name=淘真里&nonce_str=5581653663&re_openid=oWq_rjsz5LkBku-D9Cb34g9VwM08&remark=端午我们玩真的&send_name=淘真里&share_content=快来领取端午红包&share_url=http://test.taozhenli.com/redpack.html&total_amount=100&total_num=1&wishing=屌丝拿去花&wxappid=wxed62a0f12167499d&key=rigtooscret20141a2b3c4d5e6f7j8h9"));
//		System.out.println(encryptMD5("act_name=端午我们玩真的&client_ip=112.16.68.131&logo_imgurl=http://www.taozhenli.com/img/logo.png&max_value=100&mch_billno=10011720201506166158432563&mch_id=10011720&min_value=100&nick_name=淘真里&nonce_str=5581653663&re_openid=oWq_rjsz5LkBku-D9Cb34g9VwM08&remark=端午我们玩真的&send_name=淘真里&share_content=快来领取端午红包&share_url=http://test.taozhenli.com/redpack.html&total_amount=100&total_num=1&wishing=屌丝拿去花&wxappid=wxed62a0f12167499d&key=rigtooscret20141a2b3c4d5e6f7j8h9"));
	}

}
