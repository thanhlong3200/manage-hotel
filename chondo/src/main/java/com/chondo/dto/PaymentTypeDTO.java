package com.chondo.dto;

import java.util.ArrayList;
import java.util.List;

public class PaymentTypeDTO extends AbstractDTO<PaymentTypeDTO>{
	private String code;
	
	private String name;
	
	private Integer active;


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	
}
