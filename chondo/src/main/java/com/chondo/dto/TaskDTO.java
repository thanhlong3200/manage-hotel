package com.chondo.dto;

import javax.persistence.Column;

public class TaskDTO extends AbstractDTO<TaskDTO>{

	private String code;
	
	private String name;

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
	
}
