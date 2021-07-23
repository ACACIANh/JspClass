package xyz.itwill.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;

//웹프로그램 작성에 필요한 기능을 제공하기 위한 클래스
public class Utility {
	//문자열을 전달받아 암호화 처리하여 반환하는 메소드
	public static String encrypt(String source) {
		//암호화된 문자열을 저장하기 위한 변수
		String password="";
		try {
			//MessageDigest : 암호화 처리 기능을 제공하는 클래스
			//MessageDigest.getInstance(String algorithm) : 암호화 알고리즘이 저장된
			//MessageDigest 인스턴스를 반환하는 메소드
			// => 전달된 암호화 알고리즘이 없는 경우 예외(NoSuchAlgorithmException) 발생 
			//암호화 알고리즘(단방향) - MD5, SHA-1, SHA-256(권장), SHA-512 등 
			MessageDigest md=MessageDigest.getInstance("SHA-256");
			
			//MessageDigest.update(byte[] input) : MessageDigest 인스턴스에 암호화 처리하기
			//위한 문자열을 byte 배열로 전달받아 저장하는 메소드
			//String.getBytes() : 문자열을 byte 배열로 변환하여 반환하는 메소드
			md.update(source.getBytes());
			
			//MessageDigest.digest() : MessageDigest 인스턴스에 저장된 byte 배열의 요소값을
			//암호화 알고리즘을 사용하여 암호화 처리하고 byte 배열로 반환하는 메소드
			byte[] digest=md.digest();
			
			//암호화 처리된 byte 배열의 요소값을 16진수 형식의 문자열로 변환하여 변수에 
			//추가하여 저장
			for(int i=0;i<digest.length;i++) {
				password+=Integer.toHexString(digest[i]&0xff);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("[에러]잘못된 암호화 알고리즘을 사용 하였습니다.");
		}
		return password;		
	}
	
	//문자열을 전달받아 태그 관련 문자열을 모두 제거하여 반환하는 메소드
	public static String stripTag(String source) {
		//Pattern : 정규표현식을 저장하기 위한 클래스
		//Pattern.compile(String regEx) : 정규표현식이 저장된 Pattern 인스턴스를 반환하는 메소드
		//Pattern.CASE_INSENSITIVE : 정규표현식에서 대소문자를 구분하지 않도록 설정하는 상수
		Pattern htmlTag=Pattern.compile("\\<.*?\\>",Pattern.CASE_INSENSITIVE);
		
		//Pattern.matcher(String source) : 정규표현식과 문자열을 비교하기 위한 Matcher 
		//인스턴스를 반환하는 메소드
		//Matcher.replaceAll(String replacement) : Matcher 인스턴스에 저장된 문자열에서 
		//정규표현식의 문자열을 검색하여 원하는 문자열로 변경하여 반환하는 메소드 
		source=htmlTag.matcher(source).replaceAll("");//태그 관련 문자열 제거
		
		return source;
	}
	
	//문자열을 전달받아 태그 관련 기호를 회피문자(Escape) 문자로 변환하여 반환하는 메소드
	public static String escapeTag(String source) {
		return source.replace("<", "&lt;").replace(">", "&gt;");
	}
}














