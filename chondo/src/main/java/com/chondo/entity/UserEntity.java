package com.chondo.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class UserEntity extends BaseEntity {

	@Column(name = "username", nullable = false)
	private String username;

	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "fullname", nullable = false)
	private String fullname;
	
	@Column(name = "email", nullable = false)
	private String email;

	@Column(name = "phone", nullable = false)
	private String phone;
	
	@Column(name = "gender", nullable = false)
	private String gender;
	
	@Column(name = "birthday", nullable = false)
	private Date birthday;

	@Column(name = "address", nullable = false)
	private String address;
	
	@Column (name = "status", nullable = false)
	private Integer status;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_type_id")
	private UserTypeEntity type;
	

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "group_id")
	private UserGroupEntity group;

	@OneToMany(mappedBy = "user")
	private List<BookingEntity> bookings = new ArrayList<BookingEntity>();
	
	

	public UserTypeEntity getType() {
		return type;
	}

	public void setType(UserTypeEntity type) {
		this.type = type;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}


	public UserGroupEntity getGroup() {
		return group;
	}

	public void setGroup(UserGroupEntity group) {
		this.group = group;
	}
	

}
