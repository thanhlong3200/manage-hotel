package com.chondo.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class HashAlgorithm {
	
	private static final String HASH_ALGORITHM = "SHA-256";

	public static byte[] doHash(String data) {
		return doHash(data.getBytes());
	}
	
	public static String doHashHex(String data) {
		return doHashHex(data.getBytes());
	}
	
	public static String doHashHex(byte[] data) {
		return bytesToHex(doHash(data));
	}
	
	public static byte[] doHash(byte[] data) {
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance(HASH_ALGORITHM);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] hash = digest.digest(data);
		return hash;
	}
	
	public static String bytesToHex(byte[] hash) {
		StringBuilder hexString = new StringBuilder(2 * hash.length);
		for (int i = 0; i < hash.length; i++) {
			String hex = Integer.toHexString(0xff & hash[i]);
			if (hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}
		return hexString.toString();
	}

	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String data = "Phung Minh Dat";
		String hash = doHashHex(data);
		System.out.println(hash);
	}
}
