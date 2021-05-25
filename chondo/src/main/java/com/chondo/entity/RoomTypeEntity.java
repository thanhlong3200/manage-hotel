package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "room_types")
public class RoomTypeEntity extends BaseEntity {
	@Column
	private String code;
	
	@Column
	private String name;
	
	@OneToMany(mappedBy = "roomType")
	private List<RoomEntity> rooms = new ArrayList<RoomEntity>();
	
	@ManyToMany(mappedBy = "roomTypes")
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

	public List<RoomEntity> getRooms() {
		return rooms;
	}

	public void setRooms(List<RoomEntity> rooms) {
		this.rooms = rooms;
	}

	
	
}
