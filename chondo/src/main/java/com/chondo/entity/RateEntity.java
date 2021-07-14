package com.chondo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rates")
public class RateEntity extends BaseEntity{
	@Column
	private String comment;
	
	@Column
	private Integer vote;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "room_type_id")
	private RoomTypeEntity roomType;

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getVote() {
		return vote;
	}

	public void setVote(Integer vote) {
		this.vote = vote;
	}

	public RoomTypeEntity getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomTypeEntity roomType) {
		this.roomType = roomType;
	}

	
}
