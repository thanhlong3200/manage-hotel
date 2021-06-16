package com.chondo.dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.OneToMany;

import com.chondo.entity.RoomEntity;

public class RoomStatusDTO extends AbstractDTO<RoomStatusDTO>{
	private String code;
	
	private String name;
	
	private String description;
	
	private Integer active;
	
	private String btnStyle;
	


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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}









	public String getBtnStyle() {
		return btnStyle;
	}

	public void setBtnStyle(String btnStyle) {
		this.btnStyle = btnStyle;
	}
    
    
}
