package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user_types")
public class UserTypeEntity extends BaseEntity {
	@Column
	private String code;
	
	@Column
	private String name;
	
	@OneToMany(mappedBy = "type")
    private List<UserEntity> users = new ArrayList<UserEntity>();
	
	@ManyToMany(mappedBy = "userTypes")
	private List<ServiceEntity> services = new ArrayList<ServiceEntity>();

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

	public List<UserEntity> getUsers() {
		return users;
	}

	public void setUsers(List<UserEntity> users) {
		this.users = users;
	}
	
	
}
