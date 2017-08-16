package dom;

import java.util.Date;

import org.junit.Test;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.EncryptUtil;

public class EncryptUtilTest {
	
	@Test
	public void test(){
		
		System.out.println(EncryptUtil.encryptBase64("32"));
		
		System.out.println(EncryptUtil.encryptDES("noreply@nigvic.com", "nigvic2016"));
		
	}

}
