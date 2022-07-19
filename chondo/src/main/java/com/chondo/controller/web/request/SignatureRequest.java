package com.chondo.controller.web.request;

public class SignatureRequest {
	private String code;
	private String signature;
	private String publickey;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getPublickey() {
		return publickey;
	}

	public void setPublickey(String publickey) {
		this.publickey = publickey;
	}

	@Override
	public String toString() {
		return "SignatureRequest [code=" + code + ", signature=" + signature + ", publickey=" + publickey + "]";
	}

}
