package org.nv.dom.enums;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.nv.dom.config.NVTermConstant;

public enum IdentityCode {
	
	POLICE(-1,"警察"),
	OFFICER(10,"官员"),
	ASSASSIN(8,"刺客"),
	DOCTER(9,"医生"),
	PRIEST(7,"牧师"),
	CIVILIAN(11,"平民"),
	PIONEER(12,"先驱"),
	KILLER(99,"杀手"),
	MOB(22,"暴徒"),
	SPY(20,"间谍"),
	THIEF(19,"小偷"),
	WIZARD(21,"巫师"),
	GANG(23,"帮众");
	
	private final Integer code;
	private final String message;
	
	private static Integer[] goodCamp = {-1,-1,10,8,9,7,11,11,11,11,11,11};
	private static Integer[] killerCamp = {99,99,22,20,19,21,23};
	
	private IdentityCode(Integer _code, String _message) {
		this.code = _code;
		this.message = _message;
	}
	public Integer getCode() {
		return code;
	}
	public String getMessage() {
		return message;
	}
	
	/**
	 * 通过枚举code获取对应的message
	 * @return 取不到时返回null
	 * @create 2015-6-8 下午3:41:47
	 * @author 玄玉<http://blog.csdn.net/jadyer>
	 */
	public static String getMessageByCode(Integer code) {
		for (IdentityCode _enum : values()) {
			if (code.equals(_enum.getCode())) {
				return _enum.getMessage();
			}
		}
		return null;
	}
	
	public static Integer randomIdentitiyCode(Integer camp,Integer playNum){
		if(NVTermConstant.GOOD_CAMP.equals(camp)){
			List<Integer> temp = Arrays.asList(goodCamp);
			if(playNum == 22){
				temp.add(-1);
				temp.add(11);
			}
			Collections.shuffle(temp);
			return temp.get(0);
		}
		if(NVTermConstant.KILLER_CAMP.equals(camp)){
			List<Integer> temp = Arrays.asList(killerCamp);
			if(playNum == 22){
				temp.add(99);				
			}
			Collections.shuffle(temp);
			return temp.get(0);
		}
		return null;
	}
	
	
	

}


