package com.chondo.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "staffs")
public class StaffEntity extends BaseEntity{
	@Column
	private String fullname;
	
	@Column
	private String phone;
	
	@Column
	private String gender;

	@Column
	private Integer active;
	
	@Column
	private Date birthday;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id")
	private StaffStatusEntity status;
	
	@OneToMany(mappedBy = "staff")
	private List<StaffTaskEntity> staffTasks = new ArrayList<StaffTaskEntity>();
	
	
	public List<StaffTaskEntity> getStaffTasks() {
		return staffTasks;
	}

	public void setStaffTasks(List<StaffTaskEntity> staffTasks) {
		this.staffTasks = staffTasks;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	
	
	public StaffStatusEntity getStatus() {
		return status;
	}

	public void setStatus(StaffStatusEntity status) {
		this.status = status;
	}


}
