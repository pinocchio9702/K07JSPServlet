package eltag;

import java.awt.List;
import java.awt.Vector;

/*
	EL에서 Java클래스의 메소드 호출 절차 및 방법
	1. 클래스의 메소드를 정의한다. 단 메소드 정의시 반드시
	public static 으로 선언해야 한다.
*/
public class MyTagLib {
	
	/*
	메소드 설명 : 매게변수로 전달된 문자열에 숫자가 아닌
		문자가 포함되어 있는지 확인한다. 전체가 숫자일때는
		true을 반환하고, 그렇지 않으면 false를 반환한다.
		Ex) 1234 -> true, 백20 -> false
	*/
	public static boolean isNumber(String value) {
		
		char[] chArr = value.toCharArray();
		
		for(int i=0; i<chArr.length; i++) {
			if(!(chArr[i]>='0' && chArr[i]<='9')) {
				return false;
			}
		}
		return true;
	}
	
	public static String getGender(String jumin) {
		
		/*
		 * if(jumin.charAt(7) == '1' || jumin.charAt(7)=='3') { return "남자"; }
		 * 
		 * else if(jumin.charAt(7) == '2' || jumin.charAt(7)=='4') { return "여자"; }
		 * 
		 * return "성별을 알 수없습니다.";
		 */
		
		String returnStr = "";
		//indexOf()를 통해 -의 위치를 찾아 1을 더한다.
		int beginIdx = jumin.indexOf("-") + 1;
		//위에서 구한 인덱스를 통해 성별에 해당하는 문자를 잘라서 가져온다.
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		//쉬운 비교를 위해 정수로 변환한다.
		int genderInt = Integer.parseInt(genderStr);
		//조건을 통해 남/여
		if(genderInt==1 || genderInt==3) {
			returnStr = "남자";
		}
		
		else if(genderInt ==2 || genderInt == 4) {
			returnStr = "여자";
		}
		else {
			returnStr = "주민번호 오류 ..넌 누구니";
		}
		
		return returnStr;
		
	}
	
	public static void main(String[] args) {
		boolean result1 = isNumber("1234");
		boolean result2 = isNumber("백20");
		String result3 = getGender("123456-2000000");
		
		System.out.println("결과 1 : " + result1);
		System.out.println("결과 2 : " + result2);
		System.out.println("결과 3 : " + result3);
		
		List list = new Vector();
		
	}
}
