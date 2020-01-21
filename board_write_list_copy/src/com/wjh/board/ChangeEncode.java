package com.wjh.board;

import java.io.UnsupportedEncodingException;

public class ChangeEncode {

	public ChangeEncode(){
		
	}
	
	public static String toLatin(String words) {
		try {
			byte[] b = words.getBytes();
			return new String(b, "ISO-8859-1");

		} catch (UnsupportedEncodingException e) {
			System.out.println("ERR_Can't change encoding to Latin" + e.getMessage());
			return null;
		}
	}

	public static String toUnicode(String words) {

		try {
			byte[] b = words.getBytes("ISO-8859-1");
			return new String(b);
		} catch (UnsupportedEncodingException e) {
			System.out.println("ERR_can't change encoding to UNICODE__" + e.getMessage());
			return null;
		}
	}


}
