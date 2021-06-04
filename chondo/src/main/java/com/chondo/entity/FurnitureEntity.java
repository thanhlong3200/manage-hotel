package com.chondo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "furnitures")
public class FurnitureEntity extends BaseEntity {
	
	@Column
	private String code;
	
	@Column
	private String name;
	
	@Column
	private Integer quality;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "room_type_furniture", joinColumns = @JoinColumn(name = "furniture_id"), 
								  inverseJoinColumns = @JoinColumn(name = "room_type_id"))
	private List<RoomTypeEntity> roomTypes = new ArrayList<>();

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

	public Integer getQuality() {
		return quality;
	}

	public void setQuality(Integer quality) {
		this.quality = quality;
	}

	public List<RoomTypeEntity> getRoomTypes() {
		return roomTypes;
	}

	public void setRoomTypes(List<RoomTypeEntity> roomTypes) {
		this.roomTypes = roomTypes;
	}
	
	
}
