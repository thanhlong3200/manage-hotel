package com.chondo.dto;

import java.util.ArrayList;
import java.util.List;

public class UserGroupDTO extends AbstractDTO<UserGroupDTO>{

	private String code;
	
	private String name;
	
	private List<RoleDTO> roles = new ArrayList<>();

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

	public List<RoleDTO> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleDTO> roles) {
		this.roles = roles;
	}
	
	
}
