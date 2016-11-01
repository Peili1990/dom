package dom;

import org.junit.Test;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.EncryptUtil;

public class EncryptUtilTest {
	
	@Test
	public void test(){
		
		System.out.println(EncryptUtil.encryptDES("yesterday", "nigvic2016"));
		
	}

}
