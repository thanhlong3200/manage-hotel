package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class RoleEntity extends BaseEntity{
	@Column(name = "code")
	private String code;
	
	@ManyToMany(mappedBy = "roles")
	private List<UserGroupEntity> userGroups = new ArrayList<UserGroupEntity>();

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<UserGroupEntity> getUserGroups() {
		return userGroups;
	}

	public void setUserGroups(List<UserGroupEntity> userGroups) {
		this.userGroups = userGroups;
	}
	
	
}
