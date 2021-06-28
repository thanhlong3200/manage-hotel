package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tasks")
public class TaskEntity extends BaseEntity{
	@Column
	private String code;
	
	@Column
	private String name;
	
	@OneToMany(mappedBy = "task")
	private List<StaffTaskEntity> staffTasks = new ArrayList<StaffTaskEntity>();
	
	
	public List<StaffTaskEntity> getStaffTasks() {
		return staffTasks;
	}

	public void setStaffTasks(List<StaffTaskEntity> staffTasks) {
		this.staffTasks = staffTasks;
	}

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
